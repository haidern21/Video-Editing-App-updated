import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';

PointsContainer(double height, double width, double sp) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(Routes.REWARDS);
    },
    child: Container(
      padding:
          EdgeInsets.symmetric(vertical: height * 0.03, horizontal: width / 25),
      width: width,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          MyText(
            text: 'Total points',
            size: 14 * sp,
            weight: kfour,
            color: kgrey8,
          ),
          SizedBox(height: height * 0.009),
          MyText(
            text: '500',
            size: 32 * sp,
            weight: kseven,
            color: kprimaryColor,
          ),
          SizedBox(height: height * 0.014),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyText(
                  text: 'Get 1 more mystery box',
                  size: 14 * sp,
                  weight: kseven,
                  color: kprimaryColor,
                ),
              ),
              FittedBox(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: r'1550$',
                        style: TextStyle(
                          color: kprimaryColor,
                          fontWeight: ksix,
                          fontSize: 16 * sp,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      TextSpan(
                        text: r'/250$',
                        style: TextStyle(
                          fontFamily: 'WorkSans',
                          color: kgrey8,
                          fontWeight: kfour,
                          fontSize: 14 * sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height * 0.009),
          LinearProgressIndicator(
            minHeight: height * 0.009,
            backgroundColor: kgrey2,
            valueColor: AlwaysStoppedAnimation<Color>(
              kprimaryColor,
            ),
            value: 0.6,
          ),
        ],
      ),
    ),
  );
}
