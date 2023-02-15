import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:nb_utils/nb_utils.dart';

// import 'package:otp_text_field/otp_text_field.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';
import 'package:video_editing_app/app/modules/SignUp/controllers/otp_controller.dart';
import 'package:video_editing_app/app/modules/SignUp/controllers/sign_up_controller.dart';
import 'package:video_editing_app/constants/app_constants.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';

import '../../SignSelectection/controllers/sign_selectection_controller.dart';

/// Create Getx View for this screen
///
class OtpConfirmationScreen extends GetView<OtpController> {
  const OtpConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kScaffoldBackgroundColor,
        elevation: 0,
      ),

      /// build the screen
      body: Column(
        children: <Widget>[
          20.height,

          /// build the screen
          const Text('OTP Confirmation '),
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
                SignUpController signupController = Get.find();
                SignSelectectionController signController = Get.find();
                String phoneNumber = controller.phoneNumber.value;
                String name = signupController.nameController.text;
                String email = signupController.emailController.text;
                String role = signController.userRole.value;
                String accountType =
                    signupController.accountTypeController.text;
                String password = signupController.passwordController.text;
                debug('Verify Button Pressed');
                debug('Phone Number is ${controller.phoneNumber}');
                debug('Otp code is ${controller.otpController.text}');
                Map<dynamic, dynamic> userMap = {
                  "name": name,
                  "email": email,
                  "phone_number": phoneNumber,
                  "password": password,
                  "role": role,
                  "account_type": accountType
                };
                //validate Otp Code length before Sending To Server,
                // Get Phone Number as well from Otp Controller
                controller.verifyOtp(userMap: userMap);
              },
            ),
          )
        ],
      ),
    );
  }
}
