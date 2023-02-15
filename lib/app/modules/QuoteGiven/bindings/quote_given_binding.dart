import 'package:get/get.dart';

import '../controllers/quote_given_controller.dart';


class QuoteGivenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuoteGivenController>(
          () => QuoteGivenController(),
    );
  }
}