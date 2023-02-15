import 'package:get/get.dart';

import '../controllers/editor_accoun_success_controller.dart';

class EditorAccounSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorAccounSuccessController>(
      () => EditorAccounSuccessController(),
    );
  }
}
