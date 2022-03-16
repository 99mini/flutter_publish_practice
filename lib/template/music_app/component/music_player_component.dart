import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MusicPlayerComponent extends StatelessWidget {
  final String title;
  final String singer;
  bool? home;

  MusicPlayerComponent({
    Key? key,
    required this.title,
    required this.singer,
    this.home = false,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
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
            color: home! ? const Color(0xFFF8F8F8) : const Color(0xFF808080),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
