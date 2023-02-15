import 'package:get/get.dart';

import '../controllers/editor_sign_up_controller.dart';

class EditorSignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorSignUpController>(
      () => EditorSignUpController(),
    );
  }
}
