import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/app/modules/ForgotPassword/controllers/otp_controller_reset_password.dart';
import 'package:video_editing_app/constants/app_constants.dart';
// import 'package:otp_text_field/otp_text_field.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';

class VerifyResetPasswordOtp extends GetView<OtpResetPasswordController> {
  const VerifyResetPasswordOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kScaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          20.height,
          const Text('Verify Reset Password Otp'),
          if (controller.phoneNumber != null)
            Text('Controller Phone Number: ${controller.phoneNumber}'),
          20.height,
          Center(
            child: OTPTextField(
              pinLength: 6,
              onChanged: (p0) {
                debug("Changed: $p0");
                controller.otpController.text = p0;
              },
              fieldWidth: 40,
              onCompleted: (pin) {
                debug("Completed: $pin");
              },
            ),
          ),
          20.height,
          Container(
            height: height / 14,
            width: width,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              boxShadow: [kshadow],
            ),
            child: MyButton(
              text: 'Verify',
              onPress: () {
                hideKeyboard(context);
                //validate Otp Code length before Sending To Server,
                // Get Phone Number as well from Otp Controller
                controller.verifyOtp();
              },
            ),
          )
        ],
      ),
    );
  }
}
