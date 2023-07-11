class MangaModel {
  final String id;
  final String title;
  final String image;
  final String rank;
  final double score;
  final String scoredBy;
  final String popularity;
  final String favorites;
  final String synopsis;
  final String background;

  MangaModel({
    required this.id,
    required this.title,
    required this.image,
    required this.rank,
    required this.score,
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
      image: json['images']?['jpg']?['image_url'] ?? '',
      rank: json['rank']?.toString() ?? '',
      score: json['score']?.toDouble() ?? 0.0,
      scoredBy: json['scored_by']?.toString() ?? '',
      popularity: json['popularity']?.toString() ?? '',
      favorites: json['members']?.toString() ?? '',
      synopsis: json['synopsis'] ?? '',
      background: json['background'] ?? '',
    );
  }
}
