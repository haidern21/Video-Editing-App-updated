import 'package:get/get.dart';

import '../controllers/editor_bottom_bar_controller.dart';

class EditorBottomBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorBottomBarController>(
      () => EditorBottomBarController(),
    );
  }
}
