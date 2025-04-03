import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zippy/common/menu_nav/menu_item_model.dart';
import 'package:zippy/features/home/pages/home_page.dart';
import 'package:zippy/features/profile/pages/profile_page.dart';
import 'package:zippy/features/vip/pages/cache_page.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<int> {
  MenuCubit() : super(0);

  change(int i) => emit(i);

  final List<MenuItem> menuPage = [
    MenuItem(
      title: 'Home',
      iconSelect: IconsaxPlusLinear.home,
      icon: IconsaxPlusBold.home,
      page: const HomePage(),
    ),
    MenuItem(
      title: 'Cache',
      iconSelect: IconsaxPlusLinear.crown,
      icon: IconsaxPlusBold.cake,
      page: const CachePage(),
    ),
    MenuItem(
      title: 'Profile',
      iconSelect: IconsaxPlusLinear.profile,
      icon: IconsaxPlusBold.profile,
      page: const ProfilePage(),
    ),
  ];

  void changePage(int index) {
    emit(index);
  }

  // Access the page widget from the current MenuItem
  Widget get page => menuPage[state].page;
}
