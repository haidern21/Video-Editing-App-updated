import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../controllers/account_create_success_controller.dart';

class AccountCreateSuccessView extends GetView<AccountCreateSuccessController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(
              left: width / 11, right: width / 10, top: height / 3),
          child: Center(
            child: Column(
              children: [
                Image.asset('assets/icons/congrats.png', height: height / 5),
                SizedBox(height: height * 0.024),
                MyText(
                  text: 'Congratulations!',
                  size: 20 * sp,
                  weight: ksix,
                  color: kgrey8,
                ),
                SizedBox(height: height * 0.018),
                MyText(
                  text: 'Account created successfully!',
                  size: 12 * sp,
                  weight: kfour,
                  color: kgrey5,
                ),
                SizedBox(height: height * 0.024),
                GestureDetector(
                  // onTap: () => Get.toNamed(Routes.BOTTOM_BAR),
                  onTap: () => Get.offAndToNamed(Routes.SIGN_IN),
                  child: MyText(
                    text: 'Go to Sign In',
                    size: 14 * sp,
                    weight: ksix,
                    color: kprimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
