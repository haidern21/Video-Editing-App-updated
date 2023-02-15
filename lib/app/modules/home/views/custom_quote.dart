import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/modules/home/controllers/home_controller.dart';

import '../../../../constants/colors.dart';
import '../../../routes/app_pages.dart';
import 'home_view.dart';

HomeController controller = Get.put(HomeController());
CustomQuote(double width) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(Routes.GET_QUOTE_THREE);
      fiveController.selectedIndex = -1;
    },
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: width * 0.043),
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 0.0,
            color: kprimaryColor.withOpacity(0.25),
          )
        ],
      ),
      child: SvgPicture.asset(
        'assets/icons/getCustom.svg',
        width: width,
      ),
    ),
  );
}
