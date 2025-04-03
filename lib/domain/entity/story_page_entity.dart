import 'package:zippy/domain/entity/home_pages_entity.dart';

class StoryPageEntity {
  final String id;
  final String homePageId;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String audioUrl;
  final String lyrics;
  final DateTime createdAt;
  final DateTime updatedAt;
  final HomePageEntity homePage;
  final Duration duration;

  const StoryPageEntity({
    required this.id,
    required this.homePageId,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.audioUrl,
    required this.lyrics,
    required this.createdAt,
    required this.updatedAt,
    required this.homePage,
    required this.duration,
  });
}
