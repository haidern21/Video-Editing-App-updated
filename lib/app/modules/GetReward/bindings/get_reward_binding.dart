import 'package:get/get.dart';

import '../controllers/get_reward_controller.dart';

class GetRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetRewardController>(
      () => GetRewardController(),
    );
  }
}
