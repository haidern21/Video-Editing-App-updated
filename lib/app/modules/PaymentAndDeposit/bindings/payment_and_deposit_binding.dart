import 'package:get/get.dart';

import '../controllers/payment_and_deposit_controller.dart';

class PaymentAndDepositBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PaymentAndDepositController>(
      () => PaymentAndDepositController(),
    );
  }
}
