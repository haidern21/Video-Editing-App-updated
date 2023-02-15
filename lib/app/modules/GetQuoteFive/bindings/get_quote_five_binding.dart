import 'package:get/get.dart';

import '../controllers/get_quote_five_controller.dart';

class GetQuoteFiveBinding extends Bindings {
  // @override
  // void dependencies() {
  //   Get.lazyPut<GetQuoteFiveController>(
  //     () => GetQuoteFiveController(),
  //   );
  // }

  @override
  void dependencies() {
    Get.put(GetQuoteFiveController());
    Get.lazyPut<GetQuoteFiveController>(
      () => GetQuoteFiveController(),
    );
  }
}
