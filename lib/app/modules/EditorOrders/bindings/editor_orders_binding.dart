import 'package:get/get.dart';

import '../controllers/editor_orders_controller.dart';

class EditorOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorOrdersController>(
      () => EditorOrdersController(),
    );
  }
}
