import 'package:get/get.dart';

import '../controllers/editor_profile_edit_controller.dart';

class EditorProfileEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorProfileEditController>(
      () => EditorProfileEditController(),
    );
  }
}
