import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            image: AssetImage(
              'assets/images/background.png',
            ),
          ),
        ),
        child: Column(children: []),
      ),
    ));
  }
}
