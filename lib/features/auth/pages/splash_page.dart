import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/features/auth/cubit/auth_cubit.dart';
import 'package:zippy/features/auth/cubit/auth_state.dart';
import 'package:zippy/theme/app_asset.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.forward();
    _initializeApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _initializeApp() async {
    await Future.delayed(const Duration(seconds: 4));
    if (mounted) {
      context.read<AuthCubit>().checkAuth();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthAuthenticated) {
          Navigator.pushReplacementNamed(context, AppRoute.menuPage);
        } else if (state is AuthUnauthenticated) {
          Navigator.pushReplacementNamed(context, AppRoute.loginPage);
        }
      },
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              fit: StackFit.expand,
              children: [
                FadeTransition(
                  opacity: _animation,
                  child: Image.asset(
                    AppAsset.splashScreen,
                    fit: BoxFit.cover,
                  ),
                ),
                if (state is AuthLoading)
                  Positioned(
                    bottom: 60,
                    left: 0,
                    right: 0,
                    child: FadeTransition(
                      opacity: _animation,
                      child: LoadingAnimationWidget.discreteCircle(
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
