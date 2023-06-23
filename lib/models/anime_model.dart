class Anime {
  final String id;
  final String image;
  final String title;
  final int epsiodes;
  final double score;
  final double duration;

  Anime(
      {required this.score,
      required this.epsiodes,
      required this.duration,
      required this.id,
      required this.image,
      required this.title});
}

List<Anime> animes = [
  Anime(
    id: '1',
    image: 'assets/images/idol.jpg',
    title: 'Idol',
    score: 9.8,
    epsiodes: 25,
    duration: 25,
  ),
  Anime(
    id: '2',
    image: 'assets/images/kono_subi.jpg',
    title: 'kono_subi',
    score: 9.8,
    epsiodes: 25,
    duration: 25,
  ),
  Anime(
    id: '3',
    image: 'assets/images/mashale.jpg',
    title: 'Mashale',
    score: 9.8,
    epsiodes: 25,
    duration: 25,
  ),
  Anime(
    id: '4',
    image: 'assets/images/tokyo_revengers.jpg',
    title: 'Tokyo Revengers',
    score: 9.8,
    epsiodes: 25,
    duration: 25,
  ),
];
