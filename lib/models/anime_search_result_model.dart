class AnimeSearchResult {
  final String imageUrl;
  final String title;

  AnimeSearchResult({
    required this.imageUrl,
    required this.title,
  });

  factory AnimeSearchResult.fromJson(Map<String, dynamic> json) {
    return AnimeSearchResult(
      imageUrl: json['images']['jpg']['image_url'],
      title: json['title'],
    );
  }
}
