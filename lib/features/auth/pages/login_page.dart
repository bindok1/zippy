import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import
import 'package:zippy/features/auth/services/auth_services.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/features/auth/widgets/error_snackbar.dart';
import 'package:zippy/theme/app_asset.dart';
import 'package:zippy/theme/app_theme.dart';
import 'package:zippy/utils/utils.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _bounceAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppAsset.loginScreen,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 80),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ScaleTransition(
                    scale: _bounceAnimation,
                    child: Text(
                      'Welcome to Zippy',
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                  Utils.verticalSpace10,
                  SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0, 1),
                      end: Offset.zero,
                    ).animate(_bounceAnimation),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      icon: _isLoading
                          ? LoadingAnimationWidget.discreteCircle(
                              color: AppTheme.primaryColor,
                              size: 24,
                            )
                          : Image.asset(AppAsset.iconGoogle, height: 24),
                      label: Text(
                        _isLoading ? 'Signing in...' : 'Continue with Google',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () async {
                        HapticFeedback.lightImpact();
                        try {
                          final authService = cAuthService();
                          await authService.signInWithGoogle();
                          if (context.mounted) {
                            Navigator.pushReplacementNamed(
                                context, AppRoute.menuPage);
                          }
                        } catch (e) {
                          if (context.mounted) {
                            ErrorSnackBar.show(
                                context, 'Login failed: ${e.toString()}');
                          }
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
