//TODO: HERE LISTVIEW
// import 'package:flutter/material.dart';
// import 'package:my_anime_list/models/anime_model.dart';
// import '../../controller/favorite_controller.dart';
// import 'anime_card.dart';
// import 'package:my_anime_list/constants.dart';
// import 'package:get/get.dart';
//
// class ListViewContainer extends StatelessWidget {
//   ListViewContainer({
//     super.key,
//     required this.size,
//   });
//
//   final Size size;
//   final controller = Get.put(FavoriteController(), permanent: true);
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: size.height * 0.4,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         shrinkWrap: true,
//         itemCount: animes.length,
//         itemBuilder: (context, index) => InkWell(
//           onTap: () {
//             Get.to(AnimeCard(anime: animes[index]));
//           },
//           child: Container(
//             width: size.width * 0.4,
//             margin: const EdgeInsets.symmetric(horizontal: 10),
//             child: Column(
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(kBorderRadius),
//                   child: Image.asset(
//                     animes[index].image,
//                     width: double.infinity,
//                     height: size.height * 0.25,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Text(
//                   animes[index].title,
//                   style: const TextStyle(
//                     color: kSecondaryColor,
//                     fontSize: 16,
//                   ),
//                 ),
//                 const SizedBox(height: 5),
//                 Text(
//                   'Episodes: ${animes[index].episodes}',
//                   style: TextStyle(
//                     color: kSecondaryColor.withOpacity(0.6),
//                     fontSize: 12,
//                   ),
//                 ),
//                 Text(
//                   'Score: ${animes[index].score}',
//                   style: TextStyle(
//                     color: kSecondaryColor.withOpacity(0.6),
//                     fontSize: 12,
//                   ),
//                 ),
//                 Text(
//                   'Duration: ${animes[index].duration} mins',
//                   style: TextStyle(
//                     color: kSecondaryColor.withOpacity(0.6),
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

//TODO: HERE IS ANIME MODEL

// class AnimeModel {
//   final String id;
//   final String image;
//   final String title;
//   final String description;
//   final int episodes;
//   final double score;
//   final double duration;
//
//   AnimeModel({
//     required this.score,
//     required this.episodes,
//     required this.duration,
//     required this.id,
//     required this.image,
//     required this.title,
//     required this.description,
//   });
// }
//
// List<AnimeModel> favorites = [];
//
// List<AnimeModel> animes = [
//   AnimeModel(
//     id: '1',
//     image: 'assets/images/idol.jpg',
//     title: 'Idol',
//     score: 9.8,
//     episodes: 25,
//     duration: 25,
//     description: 'idol description',
//   ),
//   AnimeModel(
//     id: '2',
//     image: 'assets/images/kono_subi.jpg',
//     title: 'kono_subi',
//     score: 9.8,
//     episodes: 25,
//     duration: 25,
//     description: 'kono description',
//   ),
//   AnimeModel(
//     id: '3',
//     image: 'assets/images/mashale.jpg',
//     title: 'Mashale',
//     score: 9.8,
//     episodes: 25,
//     duration: 25,
//     description: 'mashale description',
//   ),
//   AnimeModel(
//     id: '4',
//     image: 'assets/images/tokyo_revengers.jpg',
//     title: 'Tokyo Revengers',
//     score: 9.8,
//     episodes: 25,
//     duration: 25,
//     description: 'Tokyo description',
//   ),
// ];
