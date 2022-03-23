import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publish_practice/template/music_app/controller/music_app_controller.dart';

class PlayingMusicProfile extends GetView<MusicAppController> {
  final String img;
  bool? home;
  PlayingMusicProfile({
    Key? key,
    required this.img,
    this.home = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: home! ? Get.width * 0.4 : Get.width * 0.3,
          height: home! ? Get.width * 0.4 : Get.width * 0.3,
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
    );
  }
}
