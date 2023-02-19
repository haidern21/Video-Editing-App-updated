import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/BottomBar/controllers/bottom_bar_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/find_an_editor_controller.dart';

class FindAnEditorView extends GetView<FindAnEditorController> {
  const FindAnEditorView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    BottomBarController bottomBarController= Get.find();
    return SafeArea(
      child: Scaffold(
          backgroundColor: kwhite,
          body: Column(
            children: [
              SizedBox(height: height * 0.15),
              MyText(
                text: "Find an editor...",
                size: 32 * sp,
                weight: kseven,
                color: kgrey8,
              ),
              SizedBox(height: height * 0.19),
              Image.asset('assets/icons/progress.png'),
              SizedBox(height: height * 0.09),
              MyText(
                align: TextAlign.center,
                text:
                    "Finding the right editor could take up to \n12 hours but may be sooner..",
                size: 16 * sp,
                weight: kfour,
                color: const Color(0xff25313A),
              ),
              SizedBox(height: height * 0.10),
              GestureDetector(
                onTap: ()=> Get.offAndToNamed(Routes.BOTTOM_BAR),
                child: MyText(
                  text: "Go to Orders",
                  size: 22 * sp,
                  weight: kseven,
                  color: kgrey8,
                ),
              ),
            ],
          )),
    );
  }
}
