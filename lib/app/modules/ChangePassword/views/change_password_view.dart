import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/change_password_controller.dart';

class ChangePasswordView extends GetView<ChangePasswordController> {
  const ChangePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
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
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.046,
                ),
                buildTitle(sp, title: 'Password'),
                SizedBox(height: height * 0.011),
                buildLoginFields(
                  sp,
                  hinttext: '********',
                  controller: controller.passwordController,
                  validator: null,
                  obSecure: true,
                ),
                SizedBox(height: height * 0.018),
                buildTitle(sp, title: 'Confirm Password'),
                SizedBox(height: height * 0.011),
                buildLoginFields(
                  sp,
                  hinttext: '********',
                  obSecure: true,
                  controller: controller.confirmpasswordController,
                  validator: null,
                ),
                SizedBox(height: height / 20),
                Container(
                  decoration: BoxDecoration(boxShadow: [kshadow]),
                  height: height * 0.07,
                  width: width,
                  child: MyButton(
                    text: 'Change password',
                    textColor: kwhite,
                    color: kprimaryColor,
                    onPress: () {
                      ///
                      ///
                      hideKeyboard(context);
                      debug('Phone number: ${controller.phoneNumber}');

                      if (controller.formKey.currentState?.validate() ??
                          false) {
                        controller.changePassword();
                      }
                      // Get.toNamed(Routes.ACCOUNT_CREATE_SUCCESS);
                    },
                  ),
                )
              ],
            ),
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
    bool obSecure = false,
    required var validator,
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
