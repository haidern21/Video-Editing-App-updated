import 'package:get/get.dart';

import '../controllers/get_quote_two_controller.dart';

class GetQuoteTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteTwoController>(
      () => GetQuoteTwoController(),
    );
  }
}
