import 'package:get/get.dart';

import '../controllers/password_reseted_controller.dart';

class PasswordResetedBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PasswordResetedController());
  }
}
