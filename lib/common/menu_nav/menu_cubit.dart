import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:zippy/common/menu_nav/menu_item_model.dart';
import 'package:zippy/features/home/pages/home_page.dart';
import 'package:zippy/features/library/pages/library_page.dart';
import 'package:zippy/features/profile/pages/profile_page.dart';
import 'package:zippy/features/vip/pages/vip_page.dart';

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
      title: 'VIP',
      iconSelect: IconsaxPlusLinear.crown,
      icon: IconsaxPlusBold.crown,
      page: const VipPage(),
    ),
    MenuItem(
      title: 'Library',
      iconSelect: IconsaxPlusLinear.note,
      icon: IconsaxPlusBold.note,
      page: const LibraryPage(),
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
