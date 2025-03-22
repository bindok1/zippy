import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zippy/features/home/cubit/opacity_cubit.dart';
import 'package:zippy/features/home/widgets/like_button.dart';
import 'package:zippy/features/home/widgets/skeleton_loader.dart';
import 'package:zippy/theme/app_theme.dart';
import 'package:zippy/utils/utils.dart';

class PodcastHeader extends StatefulWidget {
  final double expandedHeight;
  final String image;
  final bool isPlaying;
  final Future<void> Function() onPlayPressed;
  final VoidCallback onBackPressed;
  final String title;
  final String subtitle;
  final Duration duration;

  const PodcastHeader({
    super.key,
    required this.expandedHeight,
    required this.image,
    required this.isPlaying,
    required this.onPlayPressed,
    required this.onBackPressed,
    required this.title,
    required this.subtitle,
    required this.duration,
  });

  @override
  State<PodcastHeader> createState() => _PodcastHeaderState();
}

class _PodcastHeaderState extends State<PodcastHeader> {
  bool isLoading = false;

  void _handlePlayPress() async {
    if (!isLoading) {
      setState(() => isLoading = true);
      await widget.onPlayPressed();
      if (mounted) setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: widget.expandedHeight,
      leading: BlocBuilder<OpacityCubit, double>(
        builder: (context, opacity) {
          return Padding(
            padding: const EdgeInsets.only(left: 24),
            child: AnimatedOpacity(
              opacity: opacity,
              duration: const Duration(milliseconds: 200),
              child: IconButton(
                icon: const Icon(
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
              duration: const Duration(milliseconds: 200),
              child: Text(
                'Kancil dan Petani yang Marah',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          );
        },
      ),
      pinned: true,
      floating: true,
      backgroundColor: AppTheme.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: widget.image,
              width: double.infinity,
              height: widget.expandedHeight,
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
              placeholder: (context, url) => CustomSkeletonLoader(
                child: SizedBox(
                  width: double.infinity,
                  height: widget.expandedHeight,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                height: widget.expandedHeight,
                color: AppTheme.primaryColor.withOpacity(0.3),
                child: const Icon(
                  Icons.error_outline,
                  size: 48,
                  color: AppTheme.primaryColor,
                ),
              ),
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
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: widget.onBackPressed,
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
                          const LikeButton(
                            initialLiked: false,
                            iconColor: Colors.white,
                            showBorder: true,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: CachedNetworkImage(
                        imageUrl: widget.image,
                        imageBuilder: (context, imageProvider) => Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        placeholder: (context, url) =>
                            const CustomSkeletonLoader(
                          child: SizedBox(
                            width: 200,
                            height: 200,
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: 200,
                          height: 200,
                          color: AppTheme.primaryColor.withOpacity(0.3),
                          child: const Icon(
                            Icons.error_outline,
                            size: 48,
                            color: AppTheme.primaryColor,
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
                              .headlineMedium!
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
                                  color: Colors.white.withOpacity(0.6),
                                  fontWeight: FontWeight.w600),
                        ),
                        Utils.verticalSpace(24),
                        MaterialButton(
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(52),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          color: widget.isPlaying
                              ? Colors.white
                              : AppTheme.primaryColor,
                          disabledColor: Colors.white,
                          elevation: 0,
                          highlightElevation: 0,
                          onPressed: widget.isPlaying ? null : _handlePlayPress,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                widget.isPlaying
                                    ? IconsaxPlusBold.pause
                                    : IconsaxPlusBold.play,
                                size: 24,
                                color: widget.isPlaying || isLoading
                                    ? AppTheme.primaryColor
                                    : Colors.white,
                              ),
                              Utils.horizontalSpace(8),
                              Text(
                                widget.isPlaying ? 'Playing...' : 'Play Now',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                      color: widget.isPlaying
                                          ? AppTheme.primaryColor
                                          : Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              )
                            ],
                          ),
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
}
