import 'package:get/get.dart';

import '../controllers/get_reward_two_controller.dart';

class GetRewardTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetRewardTwoController>(
      () => GetRewardTwoController(),
    );
  }
}
