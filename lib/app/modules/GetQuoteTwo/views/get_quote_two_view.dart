import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/get_quote_two_controller.dart';

class GetQuoteTwoView extends GetView<GetQuoteTwoController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    debug('height ${height * 0.024}');

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffF9F9FB),
            leading: Padding(
              padding: const EdgeInsets.all(5),
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
            padding: EdgeInsets.symmetric(horizontal: width * 0.049),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.025),
                MyText(
                  text: controller.packageModel.name ?? '',
                  size: 16 * sp,
                  color: kblack,
                  weight: ksix,
                ),
                SizedBox(height: height * 0.028),
                Expanded(
                  child: FutureBuilder(builder: (context, snap) {
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemCount: controller.packageModel.offerings!.length,
                        itemBuilder: (context, index) {
                          return buildMyText(sp,
                              text: controller.packageModel.offerings![index]);
                        });
                  }),
                ),
                // buildMyText(sp, text: 'Under 60 seconds'),
                // SizedBox(height: height * 0.024),
                // buildMyText(sp, text: 'Subtitles included'),
                // SizedBox(height: height * 0.024),
                // buildMyText(sp, text: 'Logo'),
                // SizedBox(height: height * 0.024),
                // buildMyText(sp, text: 'Copyright Free Music'),
                // SizedBox(height: height * 0.024),
                // buildMyText(sp, text: 'Transitions'),
                // SizedBox(height: height * 0.024),
                // buildMyText(sp, text: 'Basic Animations'),
                // SizedBox(height: height * 0.024),
                // buildMyText(sp, text: r'$25/video'),
                SizedBox(height: height * 0.040),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15.0),
                    child: Container(
                      width: width,
                      decoration: BoxDecoration(boxShadow: [kshadow]),
                      height: height * 0.07,
                      child: MyButton(
                        text: 'Continue',
                        onPress: () {
                          Get.toNamed(Routes.GET_QUOTE_THREE);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  MyText buildMyText(double sp, {required String text}) {
    return MyText(
      text: "\u2022 $text",
      size: 15 * sp,
      color: kgrey8,
      weight: kfour,
    );
  }
}
