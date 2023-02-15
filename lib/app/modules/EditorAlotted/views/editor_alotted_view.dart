import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/editor_alotted_controller.dart';

class EditorAlottedView extends GetView<EditorAlottedController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffF9F9FB),
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
        body: Column(
          children: [
            SizedBox(height: height * 0.066),
            Center(
              child: Image.asset(
                'assets/icons/done.png',
                height: height * 0.15,
              ),
            ),
            SizedBox(height: height * 0.06),
            MyText(
              align: TextAlign.center,
              text: "We got an editor for\nyour project",
              size: 24 * sp,
              color: Color(0xff000000),
              weight: kfive,
            ),
            SizedBox(height: height * 0.06),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: height * 0.030),
                    height: height * 0.24,
                    width: width,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage:
                              AssetImage('assets/icons/avatar.png'),
                        ),
                        SizedBox(height: height * 0.012),
                        MyText(
                          text: "Falcon Thought",
                          size: 16 * sp,
                          color: Color(0xff000000),
                          weight: kfive,
                        ),
                        SizedBox(height: height * 0.022),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PROFILE);
                          },
                          child: MyText(
                            text: "View profile",
                            size: 14 * sp,
                            color: kprimaryColor,
                            weight: kfive,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
