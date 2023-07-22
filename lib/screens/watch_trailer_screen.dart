import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_anime/controller/theme_controller.dart';
import 'package:url_launcher/url_launcher.dart';
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
  final ThemeController themeController = Get.find();

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
      backgroundColor:
          themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            themeController.isDarkMode.value ? kDarkColor : kPaleLavender,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: themeController.isDarkMode.value ? kLightColor : kDarkColor,
          onPressed: () => Get.back(),
        ),
      ),
      body: FractionalTranslation(
        translation: Offset(0.h, -0.2.w),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,
            horizontal: kDefaultPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              YoutubePlayer(
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
              ElevatedButton(
                onPressed: () {
                  launchUrl(Uri.parse(
                      'https://www.youtube.com/watch?v=${_getVideoId()}'));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      themeController.isDarkMode.value
                          ? kDarkTeal1
                          : kPrimaryColor),
                ),
                child: Text(
                  'Go watch on YouTube',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: kSmallText + 3,
                    fontFamily: kDefaultFont,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
