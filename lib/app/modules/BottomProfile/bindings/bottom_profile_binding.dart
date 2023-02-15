import 'package:get/get.dart';

import '../controllers/bottom_profile_controller.dart';

class BottomProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BottomProfileController>(
      BottomProfileController(),
    );
  }
}
