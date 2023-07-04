class AnimeModel {
  final String id;
  final String image;
  final String title;
  final String description;
  final int episodes;
  final double score;
  final String duration;

  AnimeModel({
    required this.score,
    required this.episodes,
    required this.duration,
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });
}
