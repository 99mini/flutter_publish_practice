import 'package:flutter/material.dart';
import 'package:publish_practice/template/music_app/page/music_app_home.dart';

class MusicApp extends StatelessWidget {
  const MusicApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MusicAppHome(),
    );
  }
}
