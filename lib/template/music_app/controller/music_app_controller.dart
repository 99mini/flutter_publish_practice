import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class MusicAppController extends GetxController {
  RxBool likeIcon = false.obs;

  void togleLikeIcon() {
    if (likeIcon.isFalse) {
      likeIcon(true);
    } else {
      likeIcon(false);
    }
  }
}
