import 'package:get/get.dart';

import '../controllers/get_quote_eight_controller.dart';

class GetQuoteEightBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteEightController>(
      () => GetQuoteEightController(),
    );
  }
}
