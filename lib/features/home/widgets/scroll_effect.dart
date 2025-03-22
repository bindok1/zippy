import 'package:flutter/material.dart';
import 'package:zippy/domain/entity/home_pages_entity.dart';
import 'package:zippy/features/home/widgets/skeleton_loader.dart';
import 'package:zippy/theme/app_theme.dart';

class WheelScrollBanner extends StatelessWidget {
  final List<HomePageEntity> bannerData;
  final bool isLoading;

  const WheelScrollBanner({
    Key? key,
    required this.bannerData,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 600,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: isLoading ? 3 : bannerData.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 16),
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
                                    borderRadius: BorderRadius.circular(24)),
                              )
                            : Image.network(
                                bannerData[index].imageUrl,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                      ),
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
                              'Kancil dan Petani yang Marah',
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
                              'Di sebuah ladang yang luas',
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
                  ],
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
