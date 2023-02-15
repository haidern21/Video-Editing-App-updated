import 'package:get/get.dart';

import '../controllers/get_quote_seven_controller.dart';

class GetQuoteSevenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteSevenController>(
      () => GetQuoteSevenController(),
    );
  }
}
