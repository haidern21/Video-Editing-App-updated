import 'package:get/get.dart';

import '../controllers/editor_deliver_controller.dart';

class EditorDeliverBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorDeliverController>(
      () => EditorDeliverController(),
    );
  }
}
