import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/SignUp/controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(OtpController());
    // Get.lazyPut<OtpController>(
    //   () => OtpController(),
    // );
  }
}
