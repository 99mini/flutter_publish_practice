import 'package:get/instance_manager.dart';
import 'package:publish_practice/template/music_app/controller/music_app_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MusicAppController());
  }
}
