import 'package:get/get.dart';

import '../controllers/get_quote_three_controller.dart';

class GetQuoteThreeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteThreeController>(
      () => GetQuoteThreeController(),
    );
  }
}
