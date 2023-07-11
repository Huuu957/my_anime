import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../constants.dart';

class WatchTrailerScreen extends StatefulWidget {
  const WatchTrailerScreen({Key? key}) : super(key: key);

  static const watchMoreScreen = '/watchMoreScreen';

  @override
  State<WatchTrailerScreen> createState() => _WatchTrailerScreenState();
}

class _WatchTrailerScreenState extends State<WatchTrailerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _getVideoId(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }

  String _getVideoId() {
    final String? trailerUrl = Get.arguments?.trailer;
    final String? videoId = YoutubePlayer.convertUrlToId(trailerUrl!);
    return videoId ?? '';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPaleLavender,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPaleLavender,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kSecondaryColor,
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: false,
            onReady: () => debugPrint('Ready'),
            bottomActions: [
              CurrentPosition(),
              ProgressBar(
                isExpanded: true,
                colors: const ProgressBarColors(
                  playedColor: kPrimaryColor,
                  handleColor: kVeryLightPurple,
                ),
              ),
              const PlaybackSpeedButton(),
            ],
          ),
        ),
      ),
    );
  }
}
