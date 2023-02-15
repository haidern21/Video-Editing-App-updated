import 'package:get/get.dart';

import '../controllers/editor_send_message_controller.dart';

class EditorSendMessageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorSendMessageController>(
      () => EditorSendMessageController(),
    );
  }
}
