import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

PaymentAppBar(double sp, double width) {
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xffF9F9FB),
    centerTitle: true,
    leading: GestureDetector(
      onTap: () => Get.back(),
      child: Icon(
        Icons.arrow_back_ios_new_outlined,
        size: 15,
        color: kblack,
      ),
    ),
    title: MyText(
      text: 'Payment',
      size: 20 * sp,
      weight: ksix,
      color: Color(0xff000000),
    ),
    bottom: TabBarMethod(width, sp),
  );
}

TabBarMethod(double width, double sp) {
  return TabBar(
    indicator: UnderlineTabIndicator(
      borderSide: BorderSide(width: 2.0, color: kprimaryColor),
      insets: EdgeInsets.symmetric(horizontal: width * 0.05),
    ),
    indicatorColor: kprimaryColor,
    labelStyle: TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
    labelColor: kprimaryColor,
    unselectedLabelColor: kgrey8,
    unselectedLabelStyle:
        TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
    tabs: [
      Tab(
        text: 'Accounts',
      ),
      Tab(
        text: 'Transactions',
      ),
    ],
  );
}
