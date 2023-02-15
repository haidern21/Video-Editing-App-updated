import 'package:get/get.dart';

import '../controllers/order_completed_controller.dart';

class OrderCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderCompletedController>(
      () => OrderCompletedController(),
    );
  }
}
