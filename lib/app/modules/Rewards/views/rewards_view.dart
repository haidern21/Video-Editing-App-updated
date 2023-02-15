import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../controllers/rewards_controller.dart';

class RewardsView extends GetView<RewardsController> {
  List<String> title = [
    'Reel/Youtube/Tiktok',
    'Reel/Youtube/Tiktok',
    'Social Media Ad',
    'Wedding',
    'Wedding',
    'Wedding',
    'Wedding',
    'Music',
    'Music',
    'Music',
    'Real Estate',
  ];
  List<String> points = [
    '150 points/',
    '500 points/',
    '250 points/',
    '200 points/',
    '320 points/',
    '350 points/',
    '600 points/',
    '300 points/',
    '350 points/',
    '250 points/',
    '700 points/',
  ];
  List<String> time = [
    'video',
    '5 video',
    'video',
    '3 Min or Less',
    '10-20 Min',
    '45-60 Min',
    '45-60 Min',
    ' 2 Min',
    ' 3 Min',
    ' 3 Min',
    ' Min',
  ];

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
              text: 'Rewards',
              size: 16 * sp,
              weight: ksix,
              color: kblack,
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.02),
                  Container(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.03, horizontal: width / 25),
                    width: width,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        MyText(
                          text: 'Total points',
                          size: 14 * sp,
                          color: kgrey6,
                        ),
                        SizedBox(height: height * 0.009),
                        MyText(
                          text: '500',
                          size: 32 * sp,
                          weight: kseven,
                          color: kprimaryColor,
                        ),
                        SizedBox(height: height * 0.014),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: MyText(
                                text: 'Get 1 more mystery box',
                                size: 14 * sp,
                                weight: kseven,
                                color: Color(0xff000000),
                              ),
                            ),
                            FittedBox(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: r'1550$',
                                      style: TextStyle(
                                        color: kprimaryColor,
                                        fontWeight: ksix,
                                        fontSize: 16 * sp,
                                        fontFamily: 'WorkSans',
                                      ),
                                    ),
                                    TextSpan(
                                      text: r'/250$',
                                      style: TextStyle(
                                        fontFamily: 'WorkSans',
                                        color: kgrey8,
                                        fontWeight: kfour,
                                        fontSize: 14 * sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.009),
                        LinearProgressIndicator(
                          minHeight: height * 0.009,
                          backgroundColor: kgrey2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            kprimaryColor,
                          ),
                          value: 0.6,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  MyText(
                    text: 'Get free video Editing',
                    size: 16 * sp,
                    weight: kseven,
                    color: kgrey8,
                  ),
                  SizedBox(height: height * 0.02),
                  ...List.generate(
                    title.length,
                    (index) => GestureDetector(
                      onTap: () => Get.toNamed(Routes.NOTIFICATIONS),
                      child: BuildFreeEditingContainer(
                        height,
                        width,
                        sp,
                        title: '${title[index]}',
                        points: '${points[index]}',
                        time: '${time[index]}',
                      ),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }

  BuildFreeEditingContainer(double height, double width, double sp,
      {required String title, required String points, required String time}) {
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.015),
      padding:
          EdgeInsets.symmetric(vertical: height * 0.03, horizontal: width / 25),
      width: width,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(
                text: '$title',
                size: 14 * sp,
                weight: ksix,
                color: kgrey8,
              ),
              SizedBox(height: height * 0.015),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$points',
                      style: TextStyle(
                        color: kprimaryColor,
                        fontWeight: ksix,
                        fontSize: 16 * sp,
                        fontFamily: 'WorkSans',
                      ),
                    ),
                    TextSpan(
                      text: '$time',
                      style: TextStyle(
                        fontFamily: 'WorkSans',
                        color: kgrey8,
                        fontWeight: kfour,
                        fontSize: 14 * sp,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_outlined,
            color: kprimaryColor,
            size: 15,
          )
        ],
      ),
    );
  }
}
