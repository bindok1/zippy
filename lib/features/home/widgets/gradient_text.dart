import 'package:flutter/material.dart';
import 'package:zippy/theme/app_theme.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final List<Color>? gradientColors;
  final Alignment? begin;
  final Alignment? end;

  const GradientText(
    this.text, {
    super.key,
    this.style,
    this.gradientColors,
    this.begin,
    this.end,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: gradientColors ??
            [
              AppTheme.primaryColor,
              AppTheme.secondaryColor,
            ],
        begin: begin ?? Alignment.centerLeft,
        end: end ?? Alignment.centerRight,
      ).createShader(bounds),
      child: Text(
        text,
        style: style?.copyWith(color: Colors.white) ??
            Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
      ),
    );
  }
}
