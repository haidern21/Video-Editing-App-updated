import 'package:get/get.dart';

import '../controllers/project_details_controller.dart';

class EditorProjectDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorProjectDetailsController>(
      () => EditorProjectDetailsController(),
    );
  }
}
