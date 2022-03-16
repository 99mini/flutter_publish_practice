import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'playing_music_profile.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  Widget _playbarBtnIcon({
    required IconData icon,
    double? size = 24,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Center(
        child: GestureDetector(
          onTap: () {},
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              icon,
              size: size,
              color: const Color(0xFFF8F8F8),
            ),
          ),
        ),
      ),
    );
  }

  Widget _playingMusicComponent({
    required String title,
    required String singer,
    required String img,
  }) {
    return Container(
      padding: const EdgeInsets.only(
        left: 42,
        top: 40,
      ),
      width: Get.width,
      height: Get.height * 0.3,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        PlayingMusicProfile(img: img),
        const SizedBox(width: 20),
        Column(
          children: [
            _playingMusicInfo(
              title: title,
              singer: singer,
            ),
            const SizedBox(height: 10),
            Container(
              width: Get.width * 0.5,
              height: 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2),
                color: const Color(0xFF808080),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _playbarBtnIcon(
                  icon: Icons.shuffle,
                ),
                _playbarBtnIcon(
                  icon: Icons.arrow_back_ios,
                ),
                _playbarBtnIcon(
                  icon: Icons.play_arrow,
                  size: 32,
                ),
                _playbarBtnIcon(
                  icon: Icons.arrow_forward_ios,
                ),
                _playbarBtnIcon(
                  icon: Icons.repeat,
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Widget _playingMusicInfo({
    required String title,
    required String singer,
  }) {
    return Column(
      children: [
        Text(
          title,
          maxLines: 1,
          style: GoogleFonts.roboto(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: const Color(0xFFF8F8F8),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          singer,
          maxLines: 1,
          style: GoogleFonts.roboto(
            fontSize: 16,
            fontWeight: FontWeight.normal,
            color: const Color(0xFF808080),
          ),
        ),
      ],
    );
  }

  Widget _musicInfoComponent({
    required String title,
    required String singer,
    required String img,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      image: DecorationImage(
                        image: AssetImage('assets/images/$img'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFFF8F8F8),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        singer,
                        maxLines: 1,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF808080),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                Icons.menu_outlined,
                size: 40,
                color: Color(
                  0xFF808080,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: Get.width,
            height: 2,
            color: const Color(0xFFDEDEDE),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onVerticalDragUpdate: (details) {
        int sensitivity = 9;
        // Down swipe
        if (details.delta.dy > sensitivity) {
          Get.back();
        }
      },
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: BoxDecoration(
          color: const Color(0xFF121212).withOpacity(0.7),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Column(
          children: [
            _playingMusicComponent(
              title: 'Step Back',
              singer: 'Got the beat',
              img: 'step_back.jpeg',
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 42,
                right: 26,
                top: 22,
              ),
              //TODO ListView.builder
              child: Column(children: [
                _musicInfoComponent(
                  img: 'step_back.jpeg',
                  singer: 'Got the beat',
                  title: 'Step Back',
                ),
                _musicInfoComponent(
                  img: 'eleven.jpeg',
                  singer: 'IVE (아이브)',
                  title: 'ELEVEN',
                ),
                _musicInfoComponent(
                  img: 'smiley.jpeg',
                  singer: 'YENA (최예나)',
                  title: 'SMILEY(feat. BIBI)',
                ),
                _musicInfoComponent(
                  img: 'dreams_come_true.jpeg',
                  singer: 'aespa',
                  title: 'Dreams Come True',
                ),
                _musicInfoComponent(
                  img: 'stronger.jpeg',
                  singer: 'Kelly Clarkson(켈리 클락슨)',
                  title: 'Stronger (What Doesn’t Kill you)',
                ),
                _musicInfoComponent(
                  img: 'next_level.png',
                  singer: 'aespa',
                  title: 'Next Level',
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
