import 'package:get/get.dart';

import '../controllers/editor_profile_controller.dart';

class EditorProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorProfileController>(
      () => EditorProfileController(),
    );
  }
}
