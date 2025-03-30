class StoryCacheKey {
  final String id;

  const StoryCacheKey({
    required this.id,
  });

  String get key => id;
}
