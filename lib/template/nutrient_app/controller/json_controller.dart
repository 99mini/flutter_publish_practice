import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:publish_practice/template/nutrient_app/model/menu_model.dart';

class JsonController {
  Future<String> _loadAssets(String path) async {
    return await rootBundle.loadString('assests/${path}');
  }

  Future loadModel(String path) async {
    String jsonString = await _loadAssets(path);
    final jsonResponse = json.decode(jsonString);
    MenuModel model = new MenuModel.fromJson(jsonResponse);
    print(model);
  }
}
