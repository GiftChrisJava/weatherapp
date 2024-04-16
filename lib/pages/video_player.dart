import 'package:flutter/material.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({super.key});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late FlickManager flickManager;

  @override
  void initState() {
    super.initState();

    // using network

    // flickManager = FlickManager(
    //     videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
    //         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')));

    // video stored in the app locally
    flickManager = FlickManager(
        videoPlayerController:
            VideoPlayerController.asset("assets/floods.mp4"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF2B4A54),
          title: const Text(
            "Zochita munthawi Yaza Dzidzi",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: AspectRatio(
            aspectRatio: 16 / 10,
            child: FlickVideoPlayer(
              flickManager: flickManager,
            ),
          ),
        ));
  }
}
