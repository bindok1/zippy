import 'package:flutter/material.dart';

class Utils {
  // TODO : Spacing
  static SizedBox verticalSpace(double height) {
    return SizedBox(height: height);
  }

  static SizedBox horizontalSpace(double width) {
    return SizedBox(width: width);
  }

  static SizedBox verticalSpace25 = const SizedBox(height: 25);
  static SizedBox verticalSpace20 = const SizedBox(height: 20);
  static SizedBox verticalSpace10 = const SizedBox(height: 10);
  static SizedBox verticalSpace12 = const SizedBox(height: 12);

  static SizedBox horizontalSpace25 = const SizedBox(width: 25);
  static SizedBox horizontalSpace10 = const SizedBox(width: 10);
  static SizedBox horizontalSpace12 = const SizedBox(width: 12);
  static SizedBox horizontalSpace20 = const SizedBox(width: 20);

  //TODO : Title
  static Widget boldTitle(String text, BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ));
  }
}
