import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:publish_practice/binding/init_binding.dart';
import 'package:publish_practice/template/alphabet_app/alphabet_app.dart';
import 'package:publish_practice/template/app.dart';
import 'package:publish_practice/template/educat/educat.dart';
import 'package:publish_practice/template/music_app/music_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialBinding: InitBinding(),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => App(),
        ),
        GetPage(
          name: '/educat',
          page: () => Educat(),
        ),
        GetPage(
          name: '/music_app',
          page: () => MusicApp(),
        ),
        GetPage(
          name: '/alphabet_app',
          page: () => AlphabetApp(),
        ),
      ],
    );
  }
}
