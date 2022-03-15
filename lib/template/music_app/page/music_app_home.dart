import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:publish_practice/template/music_app/controller/music_app_controller.dart';

class MusicAppHome extends GetView<MusicAppController> {
  const MusicAppHome({Key? key}) : super(key: key);
  Widget _bottomSheet() {
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
            _playing_music_component(
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
              child: Column(children: [
                _music_info_component(
                  img: 'step_back.jpeg',
                  singer: 'Got the beat',
                  title: 'Step Back',
                ),
                _music_info_component(
                  img: 'eleven.jpeg',
                  singer: 'IVE (아이브)',
                  title: 'ELEVEN',
                ),
                _music_info_component(
                  img: 'smiley.jpeg',
                  singer: 'YENA (최예나)',
                  title: 'SMILEY(feat. BIBI)',
                ),
                _music_info_component(
                  img: 'dreams_come_true.jpeg',
                  singer: 'aespa',
                  title: 'Dreams Come True',
                ),
                _music_info_component(
                  img: 'stronger.jpeg',
                  singer: 'Kelly Clarkson(켈리 클락슨)',
                  title: 'Stronger (What Doesn’t Kill you)',
                ),
                _music_info_component(
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

  Widget _play_btn_icon({
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

  Widget _playing_music_component({
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
        Stack(
          children: [
            Container(
              width: Get.width * 0.3,
              height: Get.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/$img'),
                ),
              ),
            ),
            Positioned(
              top: 4,
              right: 4,
              child: Obx(
                () => IconButton(
                  onPressed: () {
                    controller.togleLikeIcon();
                  },
                  color: const Color(0xFFF8F8F8),
                  icon: controller.likeIcon.isTrue
                      ? const Icon(
                          Icons.favorite,
                          size: 28,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.favorite_outline,
                          size: 28,
                        ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            _playing_music_info(
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
                _play_btn_icon(
                  icon: Icons.shuffle,
                ),
                _play_btn_icon(
                  icon: Icons.arrow_back_ios,
                ),
                _play_btn_icon(
                  icon: Icons.play_arrow,
                  size: 32,
                ),
                _play_btn_icon(
                  icon: Icons.arrow_forward_ios,
                ),
                _play_btn_icon(
                  icon: Icons.repeat,
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  Widget _playing_music_info({
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

  Widget _music_info_component({
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
                return _bottomSheet();
              });
        }
      },
      child: Container(
        width: Get.width,
        height: Get.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/background.png',
            ),
          ),
        ),
      ),
    ));
  }
}
