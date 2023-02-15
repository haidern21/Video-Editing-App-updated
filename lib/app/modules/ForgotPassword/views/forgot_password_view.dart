import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/back_button.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';

import '../../../../constants/weight.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9FB),
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9FB),
          elevation: 0,
          leading: backButton(),
          title: MyText(
            text: 'Forgot password',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.016,
              ),
              buildTitle(sp, title: 'Email or phone'),
              SizedBox(height: height * 0.008),
              buildLoginFields(
                sp,
                hinttext: 'Enter your email or phone number',
                controller: controller.phoneNumberController,
                validator: null,
              ),
              SizedBox(height: height / 20),
              Container(
                decoration: BoxDecoration(boxShadow: [kshadow]),
                height: height * 0.07,
                width: width,
                child: MyButton(
                  text: 'Submit',
                  textColor: kwhite,
                  color: kprimaryColor,
                  onPress: () async {
                    hideKeyboard(context);
                    debug(
                        'submit button pressed ${controller.phoneNumberController.text}');
                    await controller.sendOTPRequest(isDebug: true);
                    // Get.toNamed(
                    //   Routes.PASSWORD_RESETED,
                    //   arguments: controller.phoneNumberController.text,
                    // );
                    Get.toNamed(
                      Routes.RESET_OTP_CONFIRMATION,
                      arguments: controller.phoneNumberController.text,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  MyText buildTitle(double sp, {required String title}) {
    return MyText(
      text: title,
      size: 12 * sp,
      weight: kfour,
      color: kgrey8,
    );
  }

  LoginFields buildLoginFields(
    double sp, {
    required String hinttext,
    TextEditingController? controller,
    required var validator,
    bool obSecure = false,
  }) {
    return LoginFields(
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      fieldValidator: validator,
      formcontroller: controller,
      obSecure: obSecure,
      style: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kblack,
      ),
      hintText: hinttext,
      hintStyle: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kgrey3,
      ),
      enableBorder: enabledborder,
      errorBorder: errorborder,
      focusBorder: focusedborder,
    );
  }
}
