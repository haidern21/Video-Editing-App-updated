import 'package:get/get.dart';

import '../controllers/editor_alotted_controller.dart';

class EditorAlottedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorAlottedController>(
      () => EditorAlottedController(),
    );
  }
}
