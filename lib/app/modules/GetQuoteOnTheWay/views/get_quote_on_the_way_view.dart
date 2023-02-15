import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/get_quote_on_the_way_controller.dart';

class GetQuoteOnTheWayView extends GetView<GetQuoteOnTheWayController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
          backgroundColor: kwhite,
          appBar: AppBar(
            backgroundColor: kwhite,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.all(5),
              child: backButton(),
            ),
            title: MyText(
              text: "Get Quote",
              size: 16 * sp,
              color: kblack,
              weight: ksix,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.only(
                top: height * 0.10, left: width / 20, right: width / 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                    align: TextAlign.center,
                    text: 'Your quote\non the way! Hang\ntight!',
                    size: 32 * sp,
                    weight: kseven,
                    color: kgrey8,
                  ),
                  SizedBox(height: height / 8),
                  Image.asset('assets/icons/colors.png'),
                  SizedBox(height: height / 8),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.BOTTOM_BAR);
                    },
                    child: MyText(
                      align: TextAlign.center,
                      text: 'Go to order',
                      size: 14 * sp,
                      weight: ksix,
                      color: kprimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
