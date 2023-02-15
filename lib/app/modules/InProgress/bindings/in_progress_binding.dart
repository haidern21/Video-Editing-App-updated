import 'package:get/get.dart';

import '../controllers/in_progress_controller.dart';

class InProgressBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InProgressController>(
      () => InProgressController(),
    );
  }
}
