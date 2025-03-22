import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomSkeletonLoader extends StatelessWidget {
  final bool isLoading;
  final Widget child;
  final Color baseColor;
  final Color highlightColor;
  final Duration animationDuration;
  final BorderRadius? borderRadius;

  const CustomSkeletonLoader(
      {Key? key,
      required this.isLoading,
      required this.child,
      this.baseColor = const Color(0xFFEA4B0B),
      this.highlightColor = Colors.white70,
      this.animationDuration = const Duration(milliseconds: 800),
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      effect: ShimmerEffect(
        baseColor: baseColor.withOpacity(0.2),
        highlightColor: highlightColor,
        duration: animationDuration,
      ),
      enableSwitchAnimation: true,
      switchAnimationConfig:const SwitchAnimationConfig(
        duration: Duration(milliseconds: 500),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
      ),
      child: child,
    );
  }
}
