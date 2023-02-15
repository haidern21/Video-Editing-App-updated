import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/ForgotPassword/controllers/otp_controller_reset_password.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(
      () => ForgotPasswordController(),
    );
  }
}

class ForgotPasswordOtpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<OtpResetPasswordController>(
      OtpResetPasswordController(),
    );
  }
}
