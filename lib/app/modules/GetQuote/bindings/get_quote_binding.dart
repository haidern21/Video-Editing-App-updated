import 'package:get/get.dart';

import '../controllers/get_quote_controller.dart';

class GetQuoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteController>(
      () => GetQuoteController(),
    );
  }
}
