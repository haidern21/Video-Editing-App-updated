import 'package:get/get.dart';

import '../controllers/editor_add_payment_method_controller.dart';

class EditorAddPaymentMethodBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorAddPaymentMethodController>(
      () => EditorAddPaymentMethodController(),
    );
  }
}
