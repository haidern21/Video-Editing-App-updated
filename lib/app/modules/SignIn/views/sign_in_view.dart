import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/app/modules/SignIn/views/sign_in_with_social_media.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/borders.dart';
import 'package:video_editing_app/widgets/form_validators.dart';
import 'package:video_editing_app/widgets/login_field.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../routes/app_pages.dart';
import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  List socialPngs = ['assets/icons/google.svg', 'assets/icons/facebook.svg'];

  @override
  Widget build(BuildContext context) {
    //Media query initialize
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    //Media query initialize

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: const Color(0xffF9F9FB),
            elevation: 0,
            title: MyText(
              text: 'Sign In',
              size: 16 * sp,
              weight: ksix,
              color: kblack,
            ),
            centerTitle: true),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Form(
            key: controller.formkey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  MyText(
                    text: "Email or phone",
                    size: 12 * sp,
                    weight: kfour,
                    color: kgrey8,
                  ),
                  SizedBox(height: height * 0.008),
                  LoginFields(
                    fieldValidator: emailValidator,
                    formcontroller: controller.emailController,
                    style: TextStyle(
                      fontSize: 12 * sp,
                      fontWeight: kfour,
                      color: kblack,
                    ),
                    hintText: 'Enter your email or phone number',
                    hintStyle: TextStyle(
                      fontSize: 12 * sp,
                      fontWeight: kfour,
                      color: kgrey3,
                    ),
                    enableBorder: enabledborder,
                    errorBorder: errorborder,
                    focusBorder: focusedborder,
                    border: enabledborder,
                  ),
                  SizedBox(height: height * 0.030),
                  MyText(
                    text: "Password",
                    size: 12 * sp,
                    weight: kfour,
                    color: kgrey8,
                  ),
                  SizedBox(height: height * 0.008),
                  LoginFields(
                    formcontroller: controller.passworController,
                    fieldValidator: passwordValidator,
                    // obscureText: true,
                    obSecure: true,
                    style: TextStyle(
                      fontSize: 12 * sp,
                      fontWeight: kfour,
                      color: kblack,
                    ),
                    hintText: '*********',
                    hintStyle: TextStyle(
                      fontSize: 12 * sp,
                      fontWeight: kfour,
                      color: kgrey3,
                    ),
                    enableBorder: enabledborder,
                    errorBorder: errorborder,
                    focusBorder: focusedborder,
                    border: enabledborder,
                  ),
                  SizedBox(height: height * 0.030),
                  GestureDetector(
                    onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: MyText(
                        text: "Forgot password?",
                        size: 14 * sp,
                        weight: ksix,
                        color: kprimaryColor,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.040),
                  Container(
                      height: height / 14,
                      width: Get.width,
                      decoration: BoxDecoration(boxShadow: [kshadow]),
                      child: MyButton(
                        text: 'Sign in',
                        size: 14 * sp,
                        weight: kfive,
                        onPress: () {
                          hideKeyboard(context);
                          if (controller.formkey.currentState?.validate() ??
                              false) {
                            controller.signIn();
                          }
                        },
                      )),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                      height: height / 14,
                      width: width,
                      child: MyButton(
                        text: 'Sign up',
                        size: 14 * sp,
                        weight: kfive,
                        color: kwhite,
                        textColor: kprimaryColor,
                        onPress: () {
                          Get.toNamed(Routes.SIGN_UP);
                        },
                      )),
                  SizedBox(height: height * 0.035),
                  SvgPicture.asset('assets/icons/or.svg', width: Get.width),
                  SizedBox(height: height * 0.024),
                  SignInWithSocialMedia(
                      socialPngs: socialPngs, width: width, height: height)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
