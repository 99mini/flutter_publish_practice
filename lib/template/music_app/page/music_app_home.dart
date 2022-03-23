import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publish_practice/template/music_app/component/music_player_component.dart';
import 'package:publish_practice/template/music_app/component/playing_music_profile.dart';

import '../component/custom_bottom_sheet.dart';

class MusicAppHome extends StatelessWidget {
  const MusicAppHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          int sensitivity = 9;
          // Up swipe
          if (details.delta.dy < -sensitivity) {
            showModalBottomSheet(
              isDismissible: false,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext context) {
                return const CustomBottomSheet();
              },
            );
          }
        },
        child: Container(
          width: Get.width,
          height: Get.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Color(0xFF808080),
                BlendMode.modulate,
              ),
              image: AssetImage(
                'assets/images/background.png',
              ),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                PlayingMusicProfile(
                  img: 'step_back.jpeg',
                  home: true,
                ),
                const SizedBox(height: 24),
                MusicPlayerComponent(
                  title: 'Step Back',
                  singer: 'God the beat',
                  home: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
