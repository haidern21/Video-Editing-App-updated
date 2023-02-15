import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/constants/colors.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: Center(
          child: Image.asset(
        "assets/icons/introLogo.png",
        height: 199,
        width: 199,
      )),
    );
  }
}
