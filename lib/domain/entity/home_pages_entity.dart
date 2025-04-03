class HomePageEntity {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final String storyPageId;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isNew => DateTime.now().difference(updatedAt).inDays < 7;

  const HomePageEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.storyPageId,
    required this.createdAt,
    required this.updatedAt,
  });
}