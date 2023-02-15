import 'package:get/get.dart';

import '../controllers/editor_in_progress_controller.dart';

class EditorInProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorInProgressController>(
      () => EditorInProgressController(),
    );
  }
}
