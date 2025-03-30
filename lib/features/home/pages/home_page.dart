import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/data/source/local/home_pages_local_source.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';
import 'package:zippy/features/home/blocs/home_pages_bloc.dart';
import 'package:zippy/features/story/blocs/story_bloc.dart';
import 'package:zippy/features/story/pages/story_page.dart';
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
                _searchWidget(context),
                Utils.verticalSpace25,
                _categoriesWidget(context, isLoading),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Utils.verticalSpace20,
                    BlocBuilder<HomePagesBloc, HomePagesState>(
                      builder: (context, state) {
                        debugPrint('Current state: $state');
                        return state.when(
                            initial: () => _bannerWidget(context, true),
                            loading: () => _bannerWidget(context, true),
                            loaded: (stories) {
                              return _bannerWidget(context, false, stories);
                            },
                            error: (message) => Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text('Error Koneksi 👀'),
                                      const SizedBox(height: 8),
                                      Text(message.toString()),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final localSource =
                                              GetIt.I<HomePagesLocalSource>();
                                          await localSource.clearCache();
                                          context.read<HomePagesBloc>().add(
                                              const HomePagesEvent
                                                  .getHomePages());
                                        },
                                        child: const Text('Retry'),
                                      ),
                                    ],
                                  ),
                                ));
                      },
                    )
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Widget _searchWidget(
    BuildContext context,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: 285,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: Colors.white),
          child: Row(
            children: [
              const Icon(
                IconsaxPlusLinear.search_normal,
                size: 20,
                color: AppTheme.textColorBlack,
              ),
              Utils.horizontalSpace10,
              Text(
                "Kids' bedtime stories",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppTheme.textColorGrey.withOpacity(0.6)),
              )
            ],
          ),
        ),
        Utils.horizontalSpace12,
        Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          width: 46,
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Icon(
              IconsaxPlusBold.notification_bing,
              color: AppTheme.primaryColor,
              size: 24,
            ),
          ),
        )
      ],
    );
  }

  Widget _categoriesWidget(BuildContext context, bool isLoading) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Utils.boldTitle('Story Title', context),
        Utils.verticalSpace12,
      ],
    );
  }

  Widget _bannerWidget(BuildContext context, bool isLoading,
      [List<HomePageEntity> stories = const []]) {
    return SizedBox(
      child: WheelScrollBanner(
        onTap: (index) async {
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
        subTitle: stories.map((story) => story.subtitle).toList(),
      ),
    );
  }
}
