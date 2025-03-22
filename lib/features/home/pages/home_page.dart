import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:zippy/features/home/blocs/home_pages_bloc.dart';
import 'package:zippy/features/home/pages/story_page.dart';
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
                        return state.when(
                          initial: () => _bannerWidget(context, true),
                          loading: () => _bannerWidget(context, true),
                          loaded: (stories) {
                            return _bannerWidget(context, false);
                          },
                          error: (message) => Center(child: Text('Error home_pages: $message'),)
                        );
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

  Widget _bannerWidget(BuildContext context, bool isLoading) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const StoryPage()));
      },
      child: SizedBox(
        child: WheelScrollBanner(
          bannerData: context.read<HomePagesBloc>().state.maybeWhen(loaded: (stories) => stories,
          orElse: ()=> [],),
          isLoading: isLoading,
        ),
      ),
    );
  }
}
