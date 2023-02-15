import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../controllers/editor_notification_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';

class EditorNotificationView extends GetView<EditorNotificationController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffF9F9FB),
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: kblack,
                size: 16,
              ),
            ),
            title: MyText(
              text: 'Notifications',
              size: 16 * sp,
              weight: ksix,
              color: kblack,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 39),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: Column(
                      children: [
                        ...List.generate(
                          3,
                          (index) => ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            title: MyText(
                              text: 'Notification Title',
                              size: 14 * sp,
                              weight: ksix,
                              color: Color(0xff31383C),
                            ),
                            subtitle: MyText(
                              text: 'Here’s notification text.',
                              size: 12 * sp,
                              weight: kfour,
                              color: Color(0xff62686B),
                            ),
                            trailing: MyText(
                              text: '34m ago',
                              size: 12 * sp,
                              weight: kfour,
                              color: Color(0xffB8B9B9),
                            ),
                            leading: Image.asset(
                              'assets/icons/rounded.png',
                            ),
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height * 0.06,
                                    width: width * 0.3,
                                    child: MyButton(
                                      text: 'Accept',
                                      onPress: () {
                                        Get.toNamed(Routes.EDITOR_REWARD);
                                      },
                                    ),
                                  ),
                                  SizedBox(width: width * 0.02),
                                  SizedBox(
                                    height: height * 0.06,
                                    width: width * 0.3,
                                    child: OutlinedButton(
                                      onPressed: () {},
                                      child: MyText(
                                        text: 'Deny',
                                        size: 14 * sp,
                                        weight: kfive,
                                        color: kcancel,
                                      ),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: kcancel),
                                        shape: StadiumBorder(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: height * 0.02)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
