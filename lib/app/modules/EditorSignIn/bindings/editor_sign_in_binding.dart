import 'package:get/get.dart';

import '../controllers/editor_sign_in_controller.dart';

class EditorSignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorSignInController>(
      () => EditorSignInController(),
    );
  }
}
