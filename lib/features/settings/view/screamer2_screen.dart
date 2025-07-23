import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Screamer2Screen extends StatefulWidget {
  const Screamer2Screen({super.key});

  @override
  State<Screamer2Screen> createState() => _Screamer2ScreenState();
}

class _Screamer2ScreenState extends State<Screamer2Screen> {
  late VideoPlayerController _controller;
  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/screamer/screamer2.mp4")
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(false);

        // _playScreamer();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _controller.value.isInitialized
          ? Stack(
              children: [
                Positioned.fill(
                  child: AspectRatio(
                    aspectRatio: 9 / 16,
                    child: VideoPlayer(_controller),
                  ),
                ),
              ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
