import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/data/hive/hive_signup_data.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../SignUp/controllers/sign_up_controller.dart';
import '../controllers/sign_selectection_controller.dart';

class SignSelectectionView extends GetView<SignSelectectionController> {
  const SignSelectectionView({super.key});

  @override
  Widget build(BuildContext context) {
    //Media query initialize
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    //Media query initialize

    return SafeArea(
        child: Scaffold(
            body: Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Column(children: [
                  SizedBox(height: height / 3),
                  MyText(
                    height: 1.5,
                    align: TextAlign.center,
                    text: "Connecting the right editors to\nthe right clients",
                    size: 20 * sp,
                    weight: kseven,
                    color: kgrey6,
                  ),
                  SizedBox(height: height * 0.1),
                  Container(
                      height: height / 14,
                      width: width,
                      decoration: BoxDecoration(boxShadow: [kshadow]),
                      child: MyButton(
                          text: 'Sign up as buyer',
                          size: 14 * sp,
                          weight: kfive,
                          onPress: () async {
                            controller.userRole.value = 'buyer';
                            await captureAccountTypeSignUpData('buyer');
                            Get.toNamed(Routes.SIGN_UP);
                          })),
                  SizedBox(height: height / 33),
                  SizedBox(
                      height: height / 14,
                      width: width,
                      child: MyButton(
                          text: 'Sign up as editor',
                          size: 14 * sp,
                          weight: kfive,
                          color: kwhite,
                          textColor: kprimaryColor,
                          onPress: () async {
                            controller.userRole.value = 'editor';
                            await captureAccountTypeSignUpData('editor');
                            Get.toNamed(Routes.SIGN_UP);
                          })),
                  SizedBox(height: height / 33),
                  const Text(
                    'OR',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: height / 33),
                  SizedBox(
                      height: height / 14,
                      width: width,
                      child: MyButton(
                          text: 'Sign In',
                          size: 14 * sp,
                          weight: kfive,
                          color: kwhite,
                          textColor: kprimaryColor,
                          onPress: () async {
                            Get.toNamed(Routes.SIGN_IN);
                          })),
                ]))));
  }
}
