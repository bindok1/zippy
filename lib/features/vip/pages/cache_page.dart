import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zippy/data/source/local/home_pages_local_source.dart';
import 'package:zippy/data/source/local/story_pages_local_source.dart';
import 'package:zippy/services/audio_service.dart';
import 'package:zippy/services/lyrics_service.dart';
import 'package:zippy/theme/app_theme.dart';

class CachePage extends StatelessWidget {
  const CachePage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: GetIt.I<GlobalKey<ScaffoldMessengerState>>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cache Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildCacheCard(
                  title: 'Story Pages Cache',
                  description: 'Clear cached story pages data',
                  onClear: () async {
                    await GetIt.I<StoryPagesLocalSource>().clearCache();
                    _showSnackBar( 'Story pages cache cleared!');
                  },
                ),
                const SizedBox(height: 16),
                _buildCacheCard(
                    title: 'Audio Cache',
                    description: 'Clear cached audio files',
                    onClear: () async {
                      await GetIt.I<AudioService>().clearAudioCache();
                      _showSnackBar( 'Audio cache cleared!');
                    }),
                const SizedBox(
                  height: 16,
                ),
                _buildCacheCard(
                  title: 'Home Pages Cache',
                  description: 'Clear cached home page data',
                  onClear: () async {
                    await GetIt.I<HomePagesLocalSource>().clearCache();
                    _showSnackBar( 'Home pages cache cleared!');
                  },
                ),
                const SizedBox(height: 16),
                _buildCacheCard(
                  title: 'Lyrics Cache',
                  description: 'Clear cached lyrics data',
                  onClear: () async {
                    await GetIt.I<LyricsService>().clearLyricsCache();
                    _showSnackBar( 'Lyrics cache cleared!');
                  },
                ),
                const SizedBox(height: 16),
                _buildCacheCard(
                  title: 'Clear All Cache',
                  description: 'Clear all cached data',
                  onClear: () async {
                    await GetIt.I<StoryPagesLocalSource>().clearCache();
                    await GetIt.I<HomePagesLocalSource>().clearCache();
                    await GetIt.I<LyricsService>().clearLyricsCache();
                    _showSnackBar('All cache cleared!');
                  },
                  isAllClear: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCacheCard({
    required String title,
    required String description,
    required VoidCallback onClear,
    bool isAllClear = false,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: onClear,
                style: TextButton.styleFrom(
                  backgroundColor: isAllClear
                      ? AppTheme.primaryColor
                      : AppTheme.primaryColor.withOpacity(0.1),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Clear Cache',
                  style: TextStyle(
                    color: isAllClear ? Colors.white : AppTheme.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(String message) {
    GetIt.I<GlobalKey<ScaffoldMessengerState>>().currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
