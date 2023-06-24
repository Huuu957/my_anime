class Anime {
  final String id;
  final String image;
  final String title;
  final String description;
  final int episodes;
  final double score;
  final double duration;

  Anime({
    required this.score,
    required this.episodes,
    required this.duration,
    required this.id,
    required this.image,
    required this.title,
    required this.description,
  });
}

List<Anime> animes = [
  Anime(
    id: '1',
    image: 'assets/images/idol.jpg',
    title: 'Idol',
    score: 9.8,
    episodes: 25,
    duration: 25,
    description: 'idol description',
  ),
  Anime(
    id: '2',
    image: 'assets/images/kono_subi.jpg',
    title: 'kono_subi',
    score: 9.8,
    episodes: 25,
    duration: 25,
    description: 'kono description',
  ),
  Anime(
    id: '3',
    image: 'assets/images/mashale.jpg',
    title: 'Mashale',
    score: 9.8,
    episodes: 25,
    duration: 25,
    description: 'mashale description',
  ),
  Anime(
    id: '4',
    image: 'assets/images/tokyo_revengers.jpg',
    title: 'Tokyo Revengers',
    score: 9.8,
    episodes: 25,
    duration: 25,
    description: 'Tokyo description',
  ),
];
