import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  Widget _templateContainer({required String title}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Get.toNamed('/$title'),
            child: Container(
              padding: const EdgeInsets.all(20),
              width: Get.width * 0.8,
              height: Get.height * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.pink,
              ),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white70,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('template'),
      ),
      body: Column(children: [
        _templateContainer(title: 'educat'),
        _templateContainer(title: 'music_app'),
      ]),
    );
  }
}
