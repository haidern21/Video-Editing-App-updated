import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/editor_sign_up_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:video_editing_app/widgets/form_validators.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/borders.dart';
import 'package:video_editing_app/widgets/login_field.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/colors.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../routes/app_pages.dart';

class EditorSignUpView extends GetView<EditorSignUpController> {
  final List<String> genderItems = [
    'Business',
    'Videographer',
    'Agency',
    'Content Creator',
    'Others'
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
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
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Email'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: 'Enter your email',
                    controller: controller.emailController,
                    validator: emailValidator,
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(sp, title: 'Phone'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: 'phone number',
                    controller: controller.phoneController,
                    validator: isMobileNumberValid,
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(sp, title: 'Account type'),
                  SizedBox(height: height * 0.008),
                  DropdownButtonFormField2(
                    searchController: controller.accountTypeController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: kwhite,
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: enabledborder,
                      enabledBorder: enabledborder,
                      focusedBorder: focusedborder,
                    ),
                    isExpanded: true,
                    hint: MyText(
                      text: 'Business',
                      size: 12 * sp,
                      weight: kfour,
                      color: kgrey8,
                    ),
                    icon: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      color: Color(0xffD3D5DA),
                    ),
                    iconSize: 30,
                    buttonHeight: height / 14,
                    buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    items: genderItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select account type';
                      }
                    },
                    onChanged: (value) {
                      //Do something when changing the item if you want.
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(sp, title: 'Password'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: '*********',
                    controller: controller.passwordController,
                    validator: passwordValidator,
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(sp, title: 'Confirm Password'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: '*********',
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
                      onPress: () {
                        Get.toNamed(Routes.EDITOR_ACCOUN_SUCCESS);
                      },
                    ),
                  ),
                  SizedBox(height: height / 28),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'By continuing, you agree to our ',
                          style: TextStyle(
                            color: kblack,
                            fontSize: 12 * sp,
                            fontWeight: kfour,
                          ),
                        ),
                        TextSpan(
                          text: 'Terms of Service ',
                          style: TextStyle(
                            color: kprimaryColor,
                            fontSize: 12 * sp,
                            fontWeight: kfour,
                          ),
                        ),
                        TextSpan(
                          text: 'and',
                          style: TextStyle(
                            color: kblack,
                            fontSize: 12 * sp,
                            fontWeight: kfour,
                          ),
                        ),
                        TextSpan(
                          text: ' Privacy Policy.',
                          style: TextStyle(
                            height: 1.5,
                            color: kprimaryColor,
                            fontSize: 12 * sp,
                            fontWeight: kfour,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
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

  LoginFields buildLoginFields(double sp,
      {required String hinttext,
      TextEditingController? controller,
      required var validator,
      var onSaved}) {
    return LoginFields(
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      fieldValidator: validator,
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
      onSavedState: onSaved,
      border: enabledborder,
    );
  }
}
