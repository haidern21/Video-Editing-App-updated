import 'package:get/get.dart';

import '../controllers/get_quote_on_the_way_controller.dart';

class GetQuoteOnTheWayBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetQuoteOnTheWayController>(
      () => GetQuoteOnTheWayController(),
    );
  }
}
