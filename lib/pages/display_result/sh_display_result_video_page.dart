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

class SHDisplayResultVideoPage extends StatefulWidget {
  final File file;
  String resultPath = "";
  SHDisplayResultVideoPage({
    required this.file,
    super.key,
  }) {
    // final random = Random().nextInt(2) + 1;

    // resultPath = "assets/images/demo2.gif";

    // resultPath = AppManager.shared.animationPath;

    resultPath = AppManager.shared.animationPath(filepath: file.path);
  }

  @override
  State<SHDisplayResultVideoPage> createState() =>
      _SHDisplayResultVideoPageState();
}

class _SHDisplayResultVideoPageState extends State<SHDisplayResultVideoPage> {
  late VideoPlayerController _videoController;
  late Future<void> _initializeVideoPlayerFuture;
  Duration duration = Duration();
  Duration position = Duration();
  Future<dynamic> _resultDelayed =
      Future.delayed(const Duration(milliseconds: 500));

  late VideoPlayerController _resultVideoController;
  late Future<void> _initializeResultVideoPlayerFuture;

  @override
  void initState() {
    _videoController = VideoPlayerController.file(
      widget.file,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _initializeVideoPlayerFuture = _videoController.initialize().then((value) {
      _videoController.setLooping(true);
      _videoController.setVolume(1);
      _videoController.play();
      setState(() {});
    });

    _videoController.addListener(() {
      setState(() {
        // Here you can get the current position of the video
        setState(() {
          position = _videoController.value.position;
          duration = _videoController.value.duration;
        });
      });
    });

    _resultVideoController = VideoPlayerController.asset(
      widget.resultPath,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
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
    _videoController.pause();
    _videoController.dispose();
    _resultVideoController.pause();
    _resultVideoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SHMainAppBar(
        title: "Kết quả",
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                Utility.getFullImagePath("bg_blue_pattern"),
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              height: 300,
              child: Container(
                color: Colors.black,
                width: double.maxFinite,
                child: FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Stack(
                        children: [
                          FittedBox(
                            fit: BoxFit.cover,
                            clipBehavior: Clip.hardEdge,
                            child: SizedBox(
                              height: _videoController.value.size.height,
                              width: _videoController.value.size.width,
                              child: VideoPlayer(_videoController),
                            ),
                          ),
                          Positioned(
                            right: 8,
                            left: 8,
                            bottom: 30,
                            child: Slider(
                              // activeColor: SHColors.primaryBlue,
                              activeColor: Color(0xFFFC0D1C),
                              min: 0,
                              max: duration.inSeconds.toDouble(),
                              value: position.inSeconds.toDouble(),
                              onChanged: (value) async {
                                // final position = Duration(seconds: value.toInt());
                                // await audioPlayer.seek(position);
                                // await audioPlayer.resume();
                                _videoController
                                    .seekTo(Duration(seconds: value.toInt()));
                              },
                            ),
                          ),
                        ],
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
              ),
            ),
            // Positioned(
            //   bottom: 50,
            //   right: 20,
            //   height: 250,
            //   child: FutureBuilder(
            //     future: _resultDelayed,
            //     builder: (context, snapshot) =>
            //         snapshot.connectionState == ConnectionState.done
            //             ? ClipRRect(
            //                 borderRadius: const BorderRadius.all(
            //                   Radius.circular(15),
            //                 ),
            //                 child: Image.asset(
            //                   widget.resultPath,
            //                   fit: BoxFit.contain,
            //                 ),
            //               )
            //             : SizedBox(
            //                 width: 150,
            //                 child: Center(
            //                   child: CircularProgressIndicator(
            //                     color: SHColors.primaryBlue,
            //                   ),
            //                 ),
            //               ),
            //   ),
            // ),
            Positioned(
              bottom: 50,
              right: 20,
              left: 20,
              height: 250,
              child: FutureBuilder(
                future: _initializeResultVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return FittedBox(
                      fit: BoxFit.cover,
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
            ),
          ],
        ),
      ),
    );
  }
}
