import 'package:get/get.dart';

import '../controllers/editor_reward_controller.dart';

class EditorRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorRewardController>(
      () => EditorRewardController(),
    );
  }
}
