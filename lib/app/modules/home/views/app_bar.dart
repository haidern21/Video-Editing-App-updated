import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';

Widget AppBarWidget(double height, double width, double sp) {
  return Container(
    height: height / 14,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: width * 0.053),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/icons/smallLogo.png',
          height: height * 0.060,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () => Get.toNamed(Routes.REWARDS),
              child: Container(
                margin: EdgeInsets.only(right: width * 0.016),
                height: width * 0.060,
                width: 117,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(53),
                  color: kprimaryColor,
                ),
                child: Center(
                  child: MyText(
                    text: 'Tap to see points',
                    size: 10 * sp,
                    weight: kfour,
                    color: kwhite,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
              child: SvgPicture.asset('assets/icons/notification.svg'),
            ),
          ],
        )
      ],
    ),
  );
}
