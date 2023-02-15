import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/find_an_editor_controller.dart';

class FindAnEditorView extends GetView<FindAnEditorController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
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
                color: Color(0xff25313A),
              ),
            ],
          )),
    );
  }
}
