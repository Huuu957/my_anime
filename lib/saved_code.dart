// import 'package:flutter/material.dart';
//
// import '../constants.dart';
// import 'package:my_anime_list/models/anime_model.dart';
// import 'package:get/get.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//
// class WatchTrailerScreen extends StatefulWidget {
//   const WatchTrailerScreen({super.key});
//
//   @override
//   State<WatchTrailerScreen> createState() => _WatchTrailerScreenState();
// }
//
// class _WatchTrailerScreenState extends State<WatchTrailerScreen> {
//   late final TopAnimeModel anime;
//   final videoUrl = 'https://www.youtube.com/watch?v=FhyJsI1ooXs';
//
//   late YoutubePlayerController _controller;
//
//   @override
//   void initState() {
//     final videoID = YoutubePlayer.convertUrlToId(videoUrl);
//
//     _controller = YoutubePlayerController(
//       initialVideoId: videoID!,
//       flags: const YoutubePlayerFlags(
//         autoPlay: true, // Set autoPlay to true
//       ),
//     );
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPaleLavender,
//       appBar: AppBar(
//         backgroundColor: kPaleLavender,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           color: kSecondaryColor,
//           onPressed: () => Get.back(),
//         ),
//       ),
//       body: Center(
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
//           child: YoutubePlayer(
//             controller: _controller,
//             showVideoProgressIndicator: true,
//             onReady: () => debugPrint('Ready'),
//             bottomActions: [
//               CurrentPosition(),
//               ProgressBar(
//                 isExpanded: true,
//                 colors: const ProgressBarColors(
//                   playedColor: kPrimaryColor,
//                   handleColor: Colors.white,
//                 ),
//               ),
//               const PlaybackSpeedButton()
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
