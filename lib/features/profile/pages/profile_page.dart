import 'package:flutter/material.dart';
import 'package:zippy/common/routers/app_router.dart';
import 'package:zippy/features/auth/services/auth_services.dart';

import 'package:zippy/features/home/widgets/gradient_text.dart';
import 'package:zippy/theme/app_theme.dart';
import 'package:zippy/utils/utils.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = cAuthService();
    final user = authService.currentUser;
    final userName = user?.userMetadata?['full_name'] ?? 'Little Dreamer';

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GradientText(
                "Hi, $userName! 👋",
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                gradientColors: [
                  Colors.blue.shade300,
                  Colors.purple.shade300,
                  AppTheme.primaryColor,
                  Colors.pink.shade300,
                  AppTheme.secondaryColor,
                ],
              ),
              Utils.verticalSpace25,
              Text(
                'Terima kasih telah mengunduh Zippy! 🌟',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Utils.verticalSpace12,
              Text(
                'Jika kamu menyukai aplikasi ini, yuk berikan rating dan ulasan di Play Store! 🌈',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Utils.verticalSpace25,
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Fun Fact ✨',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.primaryColor,
                          ),
                    ),
                    Utils.verticalSpace12,
                    Text(
                      'Di episode Kancil dan Ular, buku cerita yang jadi referensi hilang halaman terakhirnya. Makannya ceritnya tidak sampai selesai, Zippy terinspirasi dari pengalaman masa kecil yang penuh rasa penasaran akan kelanjutan cerita.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.5,
                          ),
                    ),
                  ],
                ),
              ),
              Utils.verticalSpace25,
              ListTile(
                leading: const Icon(Icons.star_outline),
                title: const Text('Beri Rating'),
                onTap: () {
                  // TODO: Implement app store rating
                },
              ),
              ListTile(
                leading: const Icon(Icons.feedback_outlined),
                title: const Text('Kirim Saran'),
                onTap: () {
                  // TODO: Implement feedback
                },
              ),
              const Spacer(),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade50,
                    foregroundColor: Colors.red,
                  ),
                  onPressed: () async {
                    try {
                      await authService.signOut();
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(
                            context, AppRoute.loginPage);
                      }
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Logout failed: ${e.toString()}')),
                        );
                      }
                    }
                  },
                  child: const Text('Logout'),
                ),
              ),
              Utils.verticalSpace25,
            ],
          ),
        ),
      ),
    );
  }
}
