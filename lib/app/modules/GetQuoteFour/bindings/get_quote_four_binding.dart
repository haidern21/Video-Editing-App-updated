import 'package:get/get.dart';

import '../controllers/get_quote_four_controller.dart';

class GetQuoteFourBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteFourController>(
      () => GetQuoteFourController(),
    );
  }
}
