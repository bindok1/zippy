import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/common/menu_nav/menu_cubit.dart';
import 'package:zippy/theme/app_theme.dart';

Widget buildNavigationItem(BuildContext context, int state, int index) {
  return GestureDetector(
    onTap: () {
      context.read<MenuCubit>().changePage(index);
    },
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            state == index
                ? context.read<MenuCubit>().menuPage[index].icon
                : context.read<MenuCubit>().menuPage[index].iconSelect,
            size: 20,
            color: AppTheme.primaryColor,
          ),
          Text(
            context.read<MenuCubit>().menuPage[index].title,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    ),
  );
}
