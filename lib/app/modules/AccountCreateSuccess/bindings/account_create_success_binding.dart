import 'package:get/get.dart';

import '../controllers/account_create_success_controller.dart';

class AccountCreateSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountCreateSuccessController>(
      () => AccountCreateSuccessController(),
    );
  }
}
