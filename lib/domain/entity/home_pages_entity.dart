class HomePageEntity {
  final String id;
  final String title;
  final String subtitle;
  final String imageUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  const HomePageEntity({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });
}