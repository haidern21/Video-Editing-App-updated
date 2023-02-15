import 'package:flutter/material.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import '../../../../widgets/my_text.dart';

buildProjectTitle(double width, double height, double sp,
    {required var richText,
    required Color containerColor,
    required String status,
    required Color containerTextColor,required String title}) {
  return Container(
    margin: EdgeInsets.only(
      bottom: height * 0.015,
      left: width * 0.053,
      right: width * 0.053,
    ),
    padding: EdgeInsets.only(
      top: height * 0.02,
      left: width * 0.04,
      right: width * 0.04,
      bottom: height * 0.02,
    ),
    width: width,
    decoration: BoxDecoration(
      color: kwhite,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: title,
                size: 16 * sp,
                weight: ksix,
                color: kblack,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              richText,
            ],
          ),
        ),
        FittedBox(
          child: Container(
            height: height * 0.04,
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(38),
            ),
            child: Center(
              child: MyText(
                text: status,
                size: 10 * sp,
                weight: kfour,
                color: containerTextColor,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
