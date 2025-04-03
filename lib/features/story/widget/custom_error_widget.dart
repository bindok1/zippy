import 'package:flutter/material.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/theme/app_theme.dart';

class CustomErrorWidget extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback? onRetry;
  final String buttonText;

  const CustomErrorWidget({
    super.key,
    this.title = 'Internet Error 🤒',
    this.message = 'Please check your internet connection and try again',
    this.onRetry,
    this.buttonText = 'Back to Home',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: AppTheme.textColorBlack,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: AppTheme.textColorGrey,
                  ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            MaterialButton(
              minWidth: double.infinity,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(52),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: AppTheme.primaryColor,
              elevation: 0,
              highlightElevation: 0,
              onPressed: () {
                if (onRetry != null) {
                  onRetry!();
                } else {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoute.homePage,
                    (route) => false,
                  );
                }
              },
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
