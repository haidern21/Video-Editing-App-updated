import 'package:get/get.dart';

import '../controllers/editor_notification_controller.dart';

class EditorNotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorNotificationController>(
      () => EditorNotificationController(),
    );
  }
}
