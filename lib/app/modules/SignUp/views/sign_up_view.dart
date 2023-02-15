import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/app/data/hive/hive_signup_data.dart';
import 'package:video_editing_app/app/modules/SignSelectection/controllers/sign_selectection_controller.dart';
import 'package:video_editing_app/app/modules/SignUp/views/terms_service.dart';
import 'package:video_editing_app/widgets/form_validators.dart';
import '../../AddNewCard/views/add_new_card_view.dart';
import '../controllers/sign_up_controller.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../routes/app_pages.dart';
import 'drop_down.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    final SignSelectectionController selectectionController = Get.find();

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9FB),
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9FB),
          elevation: 0,
          title: MyText(
            text: 'Sign up',
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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Name'),
                  SizedBox(height: height * 0.012),
                  buildLoginFields(
                    sp,
                    hinttext: 'Enter your name',
                    controller: controller.nameController,
                    validator: nameValidator,
                  ),
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Email'),
                  SizedBox(height: height * 0.012),
                  buildLoginFields(
                    sp,
                    hinttext: 'Enter your email',
                    controller: controller.emailController,
                    validator: emailValidator,
                  ),
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Phone'),
                  SizedBox(height: height * 0.012),
                  buildLoginFields(
                    sp,
                    hinttext: 'phone number',
                    controller: controller.phoneController,
                    validator: isMobileNumberValid,
                  ),
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Account type'),
                  SizedBox(height: height * 0.012),
                  const AccountType(),
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Password'),
                  SizedBox(height: height * 0.012),
                  buildLoginFields(
                    sp,
                    hinttext: '*********',
                    controller: controller.passwordController,
                    obSecure: true,
                    validator: passwordValidator,
                  ),
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Confirm Password'),
                  SizedBox(height: height * 0.012),
                  buildLoginFields(
                    sp,
                    hinttext: '*********',
                    obSecure: true,
                    controller: controller.confirmPasswordController,
                    validator: passwordValidator,
                  ),
                  SizedBox(height: height / 17),
                  Container(
                      height: height / 14,
                      width: Get.width,
                      decoration: BoxDecoration(boxShadow: [kshadow]),
                      child: MyButton(
                        text: 'Sign up',
                        size: 14 * sp,
                        weight: kfive,
                        onPress: () async {
                          debug('Sign Up Button Pressed');
                          debug(
                              'Email Value ${controller.emailController.text}');

                          try {
                            if (controller.formKey.currentState?.validate() ??
                                false) {
                              /// Create a map and Save these value in Hive BOx
                              ///
                              ///  Clear box after Signup
                              ///
                              Map<String, dynamic> signupData = {
                                'name': controller.nameController.text,
                                'email': controller.emailController.text,
                                'phone_number': controller.phoneController.text,
                                'password': controller.passwordController.text,
                                "role": selectectionController.userRole.value,
                                "account_type":controller.accountTypeController.text
                              };

                              print('sign up data map is : $signupData');

                              await captureSignUpData(signupData).then((value) {
                                // Redirect to OTP Screen

                                Get.toNamed(Routes.OTP_CONFIRMATION);
                              });
                            }
                          } on Exception catch (e, stack) {
                            e.debugException(stack);
                          }

                          // Get.toNamed(Routes.ACCOUNT_CREATE_SUCCESS);
                        },
                      )),
                  SizedBox(height: height / 28),
                  TermsAndService(sp),
                  SizedBox(height: height / 28),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
