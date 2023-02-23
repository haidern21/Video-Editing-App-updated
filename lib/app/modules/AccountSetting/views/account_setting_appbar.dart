import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/jwt_utils.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';

AppBar AccountSettingAppbar(double sp) {
  return AppBar(
    backgroundColor: Color(0xffF9F9FB),
    elevation: 0,
    leading: GestureDetector(
      onTap: () {
        Get.back();
      },
      child: Icon(
        Icons.arrow_back_ios_outlined,
        color: kblack,
        size: 16,
      ),
    ),
    title: MyText(
      text: 'Settings',
      size: 16 * sp,
      weight: ksix,
      color: kblack,
    ),
    centerTitle: true,
    actions: [
      GestureDetector(
        onTap: () async {
          SharedPreferences sharedPrefs= await SharedPreferences.getInstance();
          await sharedPrefs.remove('jwtToken');
          Get.offAllNamed(Routes.SIGN_IN);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
        ),
      )
    ],
  );
}
