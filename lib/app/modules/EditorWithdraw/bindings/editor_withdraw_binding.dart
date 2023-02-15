import 'package:get/get.dart';

import '../controllers/editor_withdraw_controller.dart';

class EditorWithdrawBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorWithdrawController>(
      () => EditorWithdrawController(),
    );
  }
}
