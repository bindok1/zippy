import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/common/routers/model.dart';
import 'package:zippy/features/home/cubit/opacity_cubit.dart';
import 'package:zippy/features/home/widgets/icon_animation.dart';
import 'package:zippy/features/home/widgets/like_button.dart';
import 'package:zippy/source/data_dummy.dart';
import 'package:zippy/theme/app_asset.dart';
import 'package:zippy/theme/app_theme.dart';
import 'package:zippy/utils/utils.dart';

class DetailPodcastPage extends StatefulWidget {
  final String imageAsset;
  final String title;
  final String subtitle;

  const DetailPodcastPage({
    Key? key,
    required this.imageAsset,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  State<DetailPodcastPage> createState() => _DetailPodcastPageState();
}

class _DetailPodcastPageState extends State<DetailPodcastPage> {
  late ScrollController _scrollController;
  late OpacityCubit _opacityCubit;
  final double _expandedHeight = 394.0;

  @override
  void initState() {
    super.initState();

    _opacityCubit = OpacityCubit();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      double offset = _scrollController.offset;
      double newOpacity =
          (offset / (_expandedHeight - kToolbarHeight)).clamp(0.0, 1.0);

      if (newOpacity >= 0.9) {
        _opacityCubit.updateOpacity(newOpacity);
      } else {
        _opacityCubit.updateOpacity(0.0);
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _opacityCubit,
      child: Scaffold(
          body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [mainPodcast(context)];
        },
        body: SingleChildScrollView(
          child: Column(
            children: [
              Utils.horizontalSpace(20),
              playOrDownload(context),
              aboutText(context),
              creatorWidget(context),
              Utils.verticalSpace(20),
              commentWidget(context),
              Utils.verticalSpace(40)
            ],
          ),
        ),
      )),
    );
  }

  Widget mainPodcast(BuildContext context) {
    return SliverAppBar(
      expandedHeight: _expandedHeight,
      leading: BlocBuilder<OpacityCubit, double>(
        builder: (context, opacity) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 200),
              child: IconButton(
                icon: Icon(
                  IconsaxPlusLinear.arrow_left,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        },
      ),
      title: BlocBuilder<OpacityCubit, double>(
        builder: (context, opacity) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 200),
              child: Text(
                widget.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          );
        },
      ),
      actions: [
        BlocBuilder<OpacityCubit, double>(
          builder: (context, opacity) {
            return Padding(
              padding: const EdgeInsets.only(right: 24),
              child: AnimatedOpacity(
                opacity: opacity,
                duration: Duration(milliseconds: 200),
                child: LikeButton(
                  initialLiked: false,
                  iconColor: Colors.white,
                  showBorder: false,
                ),
              ),
            );
          },
        ),
      ],
      pinned: true,
      floating: true,
      backgroundColor: AppTheme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Image.asset(
              widget.imageAsset,
              width: double.infinity,
              height: 394,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                height: _expandedHeight,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              width: 48,
                              height: 48,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                  width: 1,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  IconsaxPlusLinear.arrow_left,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          // Tombol suka
                          const LikeButton(
                            initialLiked: false,
                            iconColor: Colors.white,
                            showBorder: true,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          image: DecorationImage(
                            image: AssetImage(widget.imageAsset),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Utils.verticalSpace20,
                    Column(
                      children: [
                        Text(
                          widget.title,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                        ),
                        Text(
                          widget.subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget playOrDownload(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Button
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(52)),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            color: AppTheme.primaryColor,
            elevation: 5,
            highlightElevation: 10,
            onPressed: () {
              final podcastDetail = PodcastDetail(
                imageAsset: widget.imageAsset,
                title: widget.title,
                subtitle: widget.subtitle,
              );
              Navigator.pushNamed(context, AppRoute.runPodcastPage,
                  arguments: podcastDetail);
            },
            child: Row(
              children: [
                const Icon(
                  IconsaxPlusBold.play,
                  size: 24,
                  color: Colors.white,
                ),
                Utils.horizontalSpace(8),
                Text(
                  'Play All',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),

          //Button Outlined
          OutlinedButton.icon(
            icon: const Icon(
              IconsaxPlusLinear.receive_square,
              color: AppTheme.textColorBlack,
            ),
            onPressed: () {},
            label: Text(
              'Download',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold, color: AppTheme.textColorBlack),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget aboutText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.boldTitle('About', context),
          Utils.verticalSpace(6),
          Text(
            textAlign: TextAlign.justify,
            'Rahasia di Balik Otak Cerdas Si Rubah. Dalam episode kali ini, kita akan mengungkap kemampuan kognitif rubah yang luar biasa dan bagaimana mereka menggunakannya untuk bertahan hidup.',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }

  Widget creatorWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.boldTitle('Creator', context),
        Utils.verticalSpace(6),
        Container(
          width: 343,
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 14,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16), color: Colors.white),
          child:

              // Photo
              Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(AppAsset.photo1),
                  ),
                  Utils.horizontalSpace(14),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Utils.boldTitle('Picky Pals', context),
                      Text(
                        '49,3k subscribers',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: AppTheme.textColorGrey),
                      )
                    ],
                  ),
                ],
              ),
              MaterialButton(
                color: AppTheme.primaryColor.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                elevation: 0,
                onPressed: () {},
                textColor: AppTheme.primaryColor,
                child: Text(
                  'Subscribe',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primaryColor),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget commentWidget(BuildContext context) {
    final commentData = DataDummy.commentData;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Utils.boldTitle('Comment', context),
              Text(
                'View All',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Utils.verticalSpace(6),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: commentData.length,
            itemBuilder: (context, index) {
              final data = commentData[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset(
                                  data.image,
                                  width: 40,
                                  height: 40,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Utils.horizontalSpace(14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Utils.boldTitle(data.name, context),
                                  Text(
                                    data.time,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.textColorGrey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: List.generate(5, (index) {
                              return const Icon(
                                Icons.star,
                                color: AppTheme.starColor,
                                size: 20,
                              );
                            }),
                          ),
                        ],
                      ),
                      Utils.verticalSpace(8),
                      Text(data.comment),
                      Utils.verticalSpace(8),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppTheme.textColorGrey.withOpacity(0.4),
                        ),
                      ),
                      Utils.verticalSpace(8),
                      Row(
                        children: [
                          IconAnimationWidget(
                            iconBold: IconsaxPlusBold.like_1,
                            iconColor: AppTheme.primaryColor,
                            iconOutline: IconsaxPlusLinear.like_1,
                            iconSize: 16,
                            initial: false,
                          ),
                          Utils.horizontalSpace(8),
                          IconAnimationWidget(
                            iconBold: IconsaxPlusBold.dislike,
                            iconColor: AppTheme.primaryColor,
                            iconOutline: IconsaxPlusLinear.dislike,
                            iconSize: 16,
                            initial: false,
                          ),
                          Utils.horizontalSpace(8),
                          Text('reply'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
