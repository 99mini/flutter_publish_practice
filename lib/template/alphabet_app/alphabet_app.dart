import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class AlphabetApp extends StatefulWidget {
  const AlphabetApp({Key? key}) : super(key: key);

  @override
  State<AlphabetApp> createState() => _AlphabetAppState();
}

class _AlphabetAppState extends State<AlphabetApp> {
  bool _selected = false;
  double _acceleration = 1.8;
  double _velocity = 0;
  double _angle = 0;
  late Timer _timer;
  double _timerCount = 0;

  void _startAnimation() {
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _timerCount++;
        _velocity += _acceleration;
        _angle = _timerCount;
        print(_timerCount);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      width: 50.0,
      height: 50.0,
      top: _velocity * _timerCount,
      duration: const Duration(milliseconds: 1000),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _startAnimation();
          });
        },
        child: Transform.rotate(
          angle: -1 * _angle * math.pi / 180,
          child: Container(
            width: 200,
            height: 200,
            child: SvgPicture.asset('assets/alphabet/alphabet_a.svg'),
          ),
        ),
      ),
    );
  }
}
