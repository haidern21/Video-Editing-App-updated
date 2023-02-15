import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

ChatViewAppBar(double height, double width, double sp) {
  return AppBar(
    elevation: 0,
    backgroundColor: Color(0xffF9F9FB),
    leading: Padding(
      padding: EdgeInsets.only(top: height * 0.04, left: width * 0.02),
      child: MyText(
        text: 'Logo',
        size: 20 * sp,
        weight: ksix,
        color: Color(0xff000000),
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(top: height * 0.04, right: width / 25),
        child: SvgPicture.asset('assets/icons/notification.svg'),
      )
    ],
    bottom: TabBar(
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
          text: 'Admin',
        ),
        Tab(
          text: 'Editors',
        ),
      ],
    ),
  );
}
