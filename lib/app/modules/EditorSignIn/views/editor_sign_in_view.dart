import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/editor_sign_in_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/borders.dart';
import 'package:video_editing_app/widgets/form_validators.dart';
import 'package:video_editing_app/widgets/login_field.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../routes/app_pages.dart';

class EditorSignInView extends GetView<EditorSignInController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    print("width " + width.toString());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        appBar: AppBar(
          backgroundColor: Color(0xffF9F9FB),
          elevation: 0,
          title: MyText(
            text: 'Sign In',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          centerTitle: true,
        ),
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
                  SizedBox(height: height * 0.036),
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
                      onPress: () {},
                    ),
                  ),
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
                        Get.toNamed(Routes.EDITOR_SIGN_UP);
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.035),
                  SvgPicture.asset(
                    'assets/icons/or.svg',
                    width: Get.width,
                  ),
                  SizedBox(height: height * 0.024),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: height * 0.060,
                        width: width / 2.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(
                            color: Color(0xffEBEBEB),
                          ),
                        ),
                        child: SvgPicture.asset('assets/icons/google.svg'),
                      ),
                      SizedBox(width: width / 20),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: height * 0.06,
                        width: width / 2.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(21),
                          border: Border.all(
                            color: Color(0xffEBEBEB),
                          ),
                        ),
                        child: SvgPicture.asset('assets/icons/facebook.svg'),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
