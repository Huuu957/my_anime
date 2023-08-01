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
      duration: json['duration'] ?? 'No Data',
      synopsis: json['synopsis'] ?? 'No Data',
      trailer: json['trailer']['url'] ?? 'No Data',
      rank: json['rank']?.toString() ?? 'No Data',
      scoredBy: json['scored_by']?.toString() ?? 'No Data',
      popularity: json['popularity']?.toString() ?? 'No Data',
      favorites: json['favorites']?.toString() ?? 'No Data',
      year: json['year']?.toString() ?? 'No Data',
      season: json['season'] ?? 'No Data',
      airing: json['airing'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'title': title,
      'synopsis': synopsis,
      'episodes': episodes,
      'score': score,
      'duration': duration,
      'trailer': trailer,
      'rank': rank,
      'scoredBy': scoredBy,
      'popularity': popularity,
      'favorites': favorites,
      'year': year,
      'season': season,
      'airing': airing,
    };
  }
}
