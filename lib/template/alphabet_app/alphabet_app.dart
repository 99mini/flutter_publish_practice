import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlphabetApp extends StatefulWidget {
  const AlphabetApp({Key? key}) : super(key: key);

  @override
  State<AlphabetApp> createState() => _AlphabetAppState();
}

class _AlphabetAppState extends State<AlphabetApp> {
  bool selected = false;
  double acceleration = 9.8;
  int tapCount = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          width: 50.0,
          height: 50.0,
          top: acceleration * tapCount,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: GestureDetector(
            onTap: () {
              setState(() {
                tapCount += 1;
              });
            },
            child: Container(
              width: 200,
              height: 200,
              child: SvgPicture.asset('assets/alphabet/alphabet_a.svg'),
            ),
          ),
        ),
      ],
    );
  }
}
