import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

ProfileAppBar(double height, double width) {
  return Container(
    height: height / 14,
    width: width,
    padding: EdgeInsets.symmetric(horizontal: width / 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/icons/smallLogo.png',
          height: height * 0.060,
        ),
        GestureDetector(
            onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
            child: SvgPicture.asset('assets/icons/notification.svg')),
      ],
    ),
  );
}
