import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
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
                  ...List.generate(
                    10,
                    (index) => GestureDetector(
                      onTap: () => Get.toNamed(Routes.GET_REWARD),
                      child: Container(
                        // margin: EdgeInsets.only(bottom: height * 0.02),
                        width: width,
                        color:
                            index == 0 ? Color(0xffF2F2F3) : Color(0xffF9F9FB),
                        padding: EdgeInsets.symmetric(
                            horizontal: width / 25, vertical: height * 0.02),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: width / 40),
                                    padding: EdgeInsets.all(5),
                                    // height: height * 0.07,
                                    // width: width / 8.5,
                                    decoration: BoxDecoration(
                                      color: kprimaryColor,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/icons/notiLogo.svg',
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: 'Notification Title',
                                        size: 14 * sp,
                                        weight: ksix,
                                        color: Color(0xff31383C),
                                      ),
                                      SizedBox(height: height * 0.009),
                                      MyText(
                                        text: 'Here’s notification text.',
                                        size: 12 * sp,
                                        weight: kfour,
                                        color: Color(0xff62686B),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            FittedBox(
                              child: MyText(
                                text: '34m ago',
                                size: 12 * sp,
                                weight: kfour,
                                color: Color(0xffB8B9B9),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
