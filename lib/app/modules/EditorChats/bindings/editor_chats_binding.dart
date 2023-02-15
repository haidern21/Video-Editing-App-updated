import 'package:get/get.dart';

import '../controllers/editor_chats_controller.dart';

class EditorChatsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EditorChatsController>(EditorChatsController(),);
  }
}
