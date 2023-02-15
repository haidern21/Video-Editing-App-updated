import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget backButton() {
  return GestureDetector(
    onTap: () => Get.back(),
    child: Padding(
      padding: EdgeInsets.all(12),
      child: SvgPicture.asset(
        'assets/icons/backButton.svg',
      ),
    ),
  );
}
