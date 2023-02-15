import 'package:get/get.dart';

import '../controllers/sign_selectection_controller.dart';

class SignSelectectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignSelectectionController>(
      () => SignSelectectionController(),
    );
  }
}
