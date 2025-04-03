import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/data/source/local/home_pages_local_source.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';
import 'package:zippy/features/auth/services/auth_services.dart';
import 'package:zippy/features/home/blocs/home_pages_bloc.dart';
import 'package:zippy/features/home/widgets/gradient_text.dart';
import 'package:zippy/features/story/blocs/story_bloc.dart';
import 'package:zippy/features/story/widget/custom_error_widget.dart';
import 'package:zippy/theme/app_theme.dart';
import 'package:zippy/utils/utils.dart';

import '../widgets/scroll_effect.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    context.read<HomePagesBloc>().add(const HomePagesEvent.getHomePages());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _greetingWidget(context),
                Utils.verticalSpace25,
                _categoriesWidget(context, isLoading),
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                final localSource = GetIt.I<HomePagesLocalSource>();
                await localSource.clearCache();
                if (context.mounted) {
                  context
                      .read<HomePagesBloc>()
                      .add(const HomePagesEvent.getHomePages());
                }
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.verticalSpace20,
                      BlocBuilder<HomePagesBloc, HomePagesState>(
                        builder: (context, state) {
                          return state.when(
                              initial: () => _bannerWidget(context, true),
                              loading: () => _bannerWidget(context, true),
                              loaded: (stories) {
                                return _bannerWidget(context, false, stories);
                              },
                              error: (message) => CustomErrorWidget(
                                    title: 'Connection error 👀',
                                    message: 'Cek koneksi internet anda',
                                    buttonText: 'Coba lagi',
                                    onRetry: () async {
                                      final localSource =
                                          GetIt.I<HomePagesLocalSource>();
                                      await localSource.clearCache();
                                      if (context.mounted) {
                                        context.read<HomePagesBloc>().add(
                                            const HomePagesEvent
                                                .getHomePages());
                                      }
                                    },
                                  ));
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _greetingWidget(BuildContext context) {
    final authService = cAuthService();
    final user = authService.currentUser;
    final userName = user?.userMetadata?['full_name'] ?? 'Little Dreamer';
    final greeting = _getGreeting();
    final emoji = greeting == "Good Malam"
        ? "🌙✨"
        : greeting == "Good Pagi"
            ? "🌅✨"
            : greeting == "Good Sore"
                ? "☀️✨"
                : "🌆✨";
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Utils.horizontalSpace10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GradientText(
                  "$greeting, $userName!",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                  gradientColors: [
                    Colors.blue.shade300,
                    Colors.purple.shade300,
                    AppTheme.primaryColor,
                    Colors.pink.shade300,
                    AppTheme.secondaryColor,
                  ],
                ),
                Utils.verticalSpace(8),
                Text(
                  greeting.contains("Morning")
                      ? "Siap memulai petualangan baru! $emoji"
                      : greeting.contains("Afternoon")
                          ? "Semangat terus menjelajah! $emoji"
                          : greeting.contains("Evening")
                              ? "Mari istirahat sejenak dan berpetualang! $emoji"
                              : "Waktunya untuk mimpi indah! $emoji",
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppTheme.textColorBlack,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoriesWidget(BuildContext context, bool isLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Utils.boldTitle('Magical Tales of Kancil 🦌✨', context),
        Utils.verticalSpace12,
      ],
    );
  }

  Widget _bannerWidget(BuildContext context, bool isLoading,
      [List<HomePageEntity> rawStories = const []]) {
    final stories = List<HomePageEntity>.from(rawStories)
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return SizedBox(
      child: WheelScrollBanner(
        onTap: (index) async {
          HapticFeedback.mediumImpact();
          if (stories.isNotEmpty && index < stories.length) {
            final storyId = stories[index].storyPageId;
            debugPrint('Banner ${stories[index].storyPageId} tapped');

            await Future.microtask(() {
              context.read<StoryBloc>().add(StoryEvent.getStory(storyId));
            });

            if (context.mounted) {
              Navigator.pushNamed(context, AppRoute.storyPage,
                  arguments: stories[index].storyPageId);
            }
          }
        },
        imageUrls: stories.map((story) => story.imageUrl).toList(),
        isLoading: isLoading,
        title: stories.map((story) => story.title).toList(),
        showNewBadge: stories.map((story) => story.isNew).toList(),
        subTitle: stories.map((story) => story.subtitle).toList(),
      ),
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else if (hour < 21) {
      return "Good Evening";
    }
    return "Good Night";
  }
}
