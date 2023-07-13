class MangaModel {
  final String id;
  final String title;
  final String image;
  final double score;
  final String rank;
  final String scoredBy;
  final String popularity;
  final String favorites;
  final String synopsis;
  final String background;

  MangaModel({
    required this.id,
    required this.title,
    required this.image,
    required this.score,
    required this.rank,
    required this.scoredBy,
    required this.popularity,
    required this.favorites,
    required this.synopsis,
    required this.background,
  });

  factory MangaModel.fromJson(Map<String, dynamic> json) {
    return MangaModel(
      id: json['mal_id'].toString(),
      title: json['title'] ?? '',
      image: json['images']['jpg']['image_url'] ?? '',
      score: json['score']?.toDouble() ?? 0.0,
      rank: json['rank']?.toString() ?? '',
      scoredBy: json['scored_by']?.toString() ?? '',
      popularity: json['popularity']?.toString() ?? '',
      favorites: json['members']?.toString() ?? '',
      synopsis: json['synopsis'] ?? '',
      background: json['background'] ?? '',
    );
  }
}
