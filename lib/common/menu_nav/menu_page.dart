import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/common/menu_nav/menu_cubit.dart';
import 'package:zippy/common/menu_nav/widget/build_nav.dart';
import 'package:zippy/theme/app_asset.dart';
import 'package:zippy/theme/app_theme.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});
  Widget buildNavigationItem(BuildContext context, int state, int index) {
    return GestureDetector(
      onTap: () {
        context.read<MenuCubit>().changePage(index);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            state == index
                ? context.read<MenuCubit>().menuPage[index].icon
                : context.read<MenuCubit>().menuPage[index].iconSelect,
            size: 18,
            color: AppTheme.primaryColor,
          ),
          Text(
            context.read<MenuCubit>().menuPage[index].title,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  @override
  // ignore: library_private_types_in_public_api
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late PageController _pageController;
  bool _isPageAnimating = false;

  @override
  void initState() {
    super.initState();
    final initialPage = context.read<MenuCubit>().state;
    _pageController = PageController(initialPage: initialPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<MenuCubit, int>(
        listener: (context, pageIndex) {
          _isPageAnimating = true;
          _pageController
              .animateToPage(
            pageIndex,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          )
              .then((_) {
            _isPageAnimating = false;
          });
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            if (!_isPageAnimating) {
              context.read<MenuCubit>().changePage(index);
            }
          },
          children: context
              .read<MenuCubit>()
              .menuPage
              .map((menuItem) => menuItem.page)
              .toList(),
        ),
      ),
      bottomNavigationBar: BlocBuilder<MenuCubit, int>(
        builder: (context, state) {
          return Material(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: SizedBox(
                height: 72,
                child: Stack(
                  children: [
                    // Background
                    Container(
                      color: Colors.white,
                    ),
                    // Navigation items
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Left side icons
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildNavigationItem(context, state, 2),
                            ],
                          ),
                        ),
                        // Space for custom button
                        const SizedBox(width: 80),
                        // Right side icons
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              buildNavigationItem(context, state, 1),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // Custom Button in the center
                    Align(
                      alignment: Alignment.topCenter,
                      child: GestureDetector(
                        onTap: () {
                          context.read<MenuCubit>().changePage(0);
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state == 0
                                ? AppTheme.primaryColor
                                : AppTheme.darkColor,
                            boxShadow: [
                              BoxShadow(
                                color: state == 0
                                    ? AppTheme.primaryColor.withOpacity(0.4)
                                    : Colors.black26,
                                blurRadius: state == 0 ? 12 : 8,
                                spreadRadius: state == 0 ? 2 : 1,
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Image.asset(
                              AppAsset.iconMenu,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
