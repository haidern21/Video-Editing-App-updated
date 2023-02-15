import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/form_validators.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/get_quote_three_controller.dart';

class GetQuoteThreeView extends GetView<GetQuoteThreeController> {
  GetQuoteThreeView({super.key});

  var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color(0xffF9F9FB),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffF9F9FB),
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: backButton(),
            ),
            title: MyText(
              text: "Get Quote",
              size: 16 * sp,
              color: kblack,
              weight: ksix,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.049),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Name'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: 'Enter Your Name',
                    controller: controller.nameController,
                    validator: nameValidator,
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(sp, title: 'Phone'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: 'Enter Your Phone',
                    controller: controller.phoneNumberController,
                    validator: isMobileNumberValid,
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(sp, title: 'Email'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: 'Enter Your Email',
                    controller: controller.emailController,
                    validator: emailValidator,
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(boxShadow: [kshadow]),
                    width: width,
                    height: height * 0.07,
                    child: MyButton(
                      text: 'Next',
                      onPress: () {
                       if(formKey.currentState!.validate()){
                         controller.userName.value =
                             controller.nameController.text;
                         controller.userEmail.value =
                             controller.emailController.text;
                         controller.userPhone.value =
                             controller.phoneNumberController.text;
                         log('User Name value from get quote three is : ${controller.userName.value}');
                         log('User email value from get quote three is : ${controller.userEmail.value}');
                         log('User phone value from get quote three is : ${controller.userPhone.value}');

                         Get.toNamed(Routes.GET_QUOTE_FOUR, arguments: {
                           'name': controller.nameController.text,
                           'email': controller.emailController.text,
                           'phone_number': controller.phoneNumberController.text,
                         });
                       }
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  )
                ],
              ),
            ),
          )),
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
    required String? Function(String?)? validator,
  }) {
    return LoginFields(
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      fieldValidator: validator,
      formcontroller: controller,
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
