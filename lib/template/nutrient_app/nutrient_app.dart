import 'package:flutter/material.dart';
import 'package:publish_practice/template/nutrient_app/page/home_page.dart';

class NutrientApp extends StatelessWidget {
  const NutrientApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
