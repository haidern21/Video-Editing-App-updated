import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

import '../controllers/password_reseted_controller.dart';

class PasswordResetedView extends GetView<PasswordResetedController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyText(
            text: 'Thanks!',
            size: 32 * sp,
            weight: kseven,
            color: kgrey8,
          ),
          SizedBox(height: height * 0.008),
          MyText(
            text: 'We are send you in your email a confirmation link',
            size: 10 * sp,
            weight: ksix,
            color: kgrey6,
          ),
        ],
      )),
    );
  }
}
