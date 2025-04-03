import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:zippy/features/home/widgets/skeleton_loader.dart';
import 'package:zippy/theme/app_theme.dart';

class WheelScrollBanner extends StatelessWidget {
  final List<String> imageUrls;
  final bool isLoading;
  final List<String> title;
  final List<String> subTitle;
  final List<bool> showNewBadge;
  final Function(int index)? onTap;

  const WheelScrollBanner({
    super.key,
    required this.imageUrls,
    required this.isLoading,
    required this.title,
    required this.subTitle,
    required this.showNewBadge,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 600,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            itemCount: (isLoading ? 4 : imageUrls.length) + 1,
            itemBuilder: (context, index) {
              if (index == (isLoading ? 4 : imageUrls.length)) {
                return const SizedBox(height: 200);
              }
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
                child: GestureDetector(
                  onTap: () => onTap?.call(index),
                  child: Stack(
                    children: [
                      CustomSkeletonLoader(
                        isLoading: isLoading,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: isLoading
                                ? Container(
                                    height: 200,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24)),
                                  )
                                : CachedNetworkImage(
                                    imageUrl: imageUrls[index],
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    placeholder: (context, url) =>
                                        const CustomSkeletonLoader(
                                          child: SizedBox(
                                            height: 200,
                                            width: double.infinity,
                                          ),
                                        ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                          height: 200,
                                          color: AppTheme.primaryColor
                                              .withOpacity(0.3),
                                          child: const Icon(Icons.error),
                                        ))),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(24),
                                bottomRight: Radius.circular(24)),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppTheme.primaryColor.withOpacity(0),
                                AppTheme.primaryColor.withOpacity(0.8),
                                AppTheme.primaryColor.withOpacity(1),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Kisah',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isLoading
                                    ? 'Kancil dan Petani Yang Marah'
                                    : title[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                isLoading
                                    ? 'Di sebuah ladang'
                                    : subTitle[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (!isLoading && showNewBadge[index])
                        Positioned(
                          top: 12,
                          right: 12,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              'New!',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 200,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFFF4EEEF).withOpacity(0),
                  const Color(0xFFF4EEEF).withOpacity(0.8),
                  const Color(0xFFF4EEEF),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
