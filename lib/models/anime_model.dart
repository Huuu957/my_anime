class AnimeModel {
  final String id;
  final String image;
  final String title;
  final String synopsis;
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
  final bool airing;

  AnimeModel({
    required this.id,
    required this.image,
    required this.title,
    required this.synopsis,
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
    required this.airing,
  });

  factory AnimeModel.fromJson(Map<String, dynamic> json) {
    return AnimeModel(
      id: json['mal_id'].toString(),
      image: json['images']['jpg']['image_url'],
      title: json['title'],
      score: json['score'] != null ? json['score'].toDouble() : 0.0,
      episodes: json['episodes'] ?? 0,
      duration: json['duration'] ?? '',
      synopsis: json['synopsis'] ?? '',
      trailer: json['trailer']['url'] ?? '',
      rank: json['rank']?.toString() ?? '',
      scoredBy: json['scored_by']?.toString() ?? '',
      popularity: json['popularity']?.toString() ?? '',
      favorites: json['favorites']?.toString() ?? '',
      year: json['year']?.toString() ?? '',
      season: json['season'] ?? '',
      airing: json['airing'] ?? false,
    );
  }
}
