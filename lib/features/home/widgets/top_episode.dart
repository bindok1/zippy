import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zippy/theme/app_theme.dart';
import 'package:zippy/utils/utils.dart';

class EpisodeCard extends StatelessWidget {
  final String assetImage;
  final String title;
  final String subtitle;
  final String duration;

  const EpisodeCard({
    Key? key,
    required this.assetImage,
    required this.title,
    required this.subtitle,
    required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 343,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(assetImage),
              ),
            ),
          ),
          Utils.horizontalSpace(14),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            child: SizedBox(
              width: 157,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Utils.verticalSpace(4),
                  Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: AppTheme.textColorGrey),
                  ),
                  Utils.verticalSpace(4),
                  Row(
                    children: [
                      Icon(
                        IconsaxPlusLinear.timer_start,
                        size: 12,
                        color: AppTheme.textColorGrey,
                      ),
                      Utils.horizontalSpace(4),
                      Text(
                        duration,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppTheme.textColorGrey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor,
              shape: BoxShape.circle,
            ),
            width: 44,
            height: 80,
            child: Icon(
              IconsaxPlusLinear.play_circle,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
