import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_app_test1/Screens/welcome_screen.dart';
import 'package:video_player/video_player.dart';

class MySplashScreen extends StatefulWidget {
  static const id = 'my_splash_screen_id';

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
    VideoPlayerController.asset('images/appearingvideo.mp4')
      ..initialize().then((_) {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(false);
        _videoPlayerController.setVolume(0.0);
        setState(() {});
      });
    Timer(Duration(seconds: 2),()=> Navigator.popAndPushNamed(context, WelcomeScreen.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _videoPlayerController.value.size?.width ?? 0,
                height: _videoPlayerController.value.size?.height ?? 0,
                child: VideoPlayer(_videoPlayerController),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
