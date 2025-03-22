import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final IconData iconSelect;
  final Widget page;
  final IconData icon;

  MenuItem({
    required this.title,
    required this.iconSelect,
    required this.page,
    required this.icon,
  });
}
