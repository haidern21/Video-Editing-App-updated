import 'package:get/get.dart';

import '../controllers/get_quote_six_controller.dart';

class GetQuoteSixBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteSixController>(
      () => GetQuoteSixController(),
    );
  }
}
