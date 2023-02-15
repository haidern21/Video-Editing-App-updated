import 'package:get/get.dart';

import '../controllers/get_quote_eight_controller.dart';

class GetQuoteNineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteNineController>(
      () => GetQuoteNineController(),
    );
  }
}
