import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sign_helper/app_manager.dart';
import 'package:sign_helper/resources/app_colors.dart';
import 'package:sign_helper/utils/utility.dart';
import 'package:sign_helper/widgets/appbars/sh_main_app_bar.dart';
import 'package:sign_helper/widgets/buttons/sh_no_splash_button.dart';
import 'package:sign_helper/widgets/sh_background_container.dart';
import 'package:video_player/video_player.dart';

class SHDisplayResultPage extends StatefulWidget {
  File file;
  String resultPath = "";
  SHDisplayResultPage({
    required this.file,
    super.key,
  }) {
    resultPath = AppManager.shared.animationPath(filepath: file.path);
  }

  @override
  State<SHDisplayResultPage> createState() => _SHDisplayResultPageState();
}

class _SHDisplayResultPageState extends State<SHDisplayResultPage> {
  late VideoPlayerController _resultVideoController;
  late Future<void> _initializeResultVideoPlayerFuture;

  @override
  void initState() {
    _resultVideoController = VideoPlayerController.asset(widget.resultPath);
    // _videoController =
    //     VideoPlayerController.asset("assets/videos/action_4.mov");
    // _videoController = VideoPlayerController.networkUrl(Uri.parse(
    //     "https://dl.dropboxusercontent.com/scl/fi/efg51rjoo2f0ufb8jie26/sign_helper_demo.mp4?rlkey=mjnvi95b4cbp04ae5mpzwh779&dl=0"));
    // _videoController = VideoPlayerController.networkUrl(Uri.parse(
    //     "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4"));
    _initializeResultVideoPlayerFuture =
        _resultVideoController.initialize().then((value) {
      _resultVideoController.setLooping(true);
      _resultVideoController.setVolume(0);
      _resultVideoController.play();
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _resultVideoController.pause();
    _resultVideoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SHMainAppBar(
        title: "Kết quả",
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Wrap the play or pause in a call to `setState`. This ensures the
      //     // correct icon is shown.
      //     setState(() {
      //       // If the video is playing, pause it.
      //       if (_videoController.value.isPlaying) {
      //         _videoController.pause();
      //       } else {
      //         // If the video is paused, play it.
      //         _videoController.play();
      //       }
      //     });
      //   },
      //   shape: const CircleBorder(),
      //   backgroundColor: SHColors.primaryBlue,
      //   // Display the correct icon depending on the state of the player.
      //   child: Icon(
      //     _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
      //     color: Colors.white,
      //   ),
      // ),
      body: SafeArea(
        child: SHBackgroundContainer(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  color: Colors.black,
                  width: double.maxFinite,
                  child: FutureBuilder(
                    future: _initializeResultVideoPlayerFuture,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return FittedBox(
                          fit: BoxFit.contain,
                          child: SizedBox(
                            height: _resultVideoController.value.size.height,
                            width: _resultVideoController.value.size.width,
                            child: VideoPlayer(_resultVideoController),
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: SHColors.primaryBlue,
                          ),
                        );
                      }
                    },
                  ),
                  // child: Image.asset(widget.resultPath),
                ),
              ),
              Expanded(
                flex: 1,
                child: Image.file(
                  widget.file,
                  width: double.maxFinite,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
