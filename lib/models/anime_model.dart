class TopAnimeModel {
  final String id;
  final String image;
  final String title;
  final String description;
  final int episodes;
  final double score;
  final String duration;
  final String trailer;

  final String rank;
  final String scoredBy;
  final String popularity;
  final String favorites;
  final String year;
  final String season;

  TopAnimeModel({
    required this.id,
    required this.image,
    required this.title,
    required this.description,
    required this.episodes,
    required this.score,
    required this.duration,
    required this.trailer,
    required this.rank,
    required this.scoredBy,
    required this.popularity,
    required this.favorites,
    required this.year,
    required this.season,
  });
}
