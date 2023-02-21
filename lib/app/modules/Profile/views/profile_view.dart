import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  List<String> skills = ['Wedding videos', 'VFX'];
  List<String> images = [
    'assets/icons/image1.png',
    'assets/icons/image2.png',
    'assets/icons/image3.png'
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffF9F9FB),
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: backButton(),
          ),
          title: MyText(
            text: "Project details",
            size: 16 * sp,
            color: kblack,
            weight: ksix,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            // future: BottomProfileController().fetchProfileDataFromApi(),
            builder:
                (BuildContext context, AsyncSnapshot<UserModel?> snapshot) {
              if (!snapshot.hasData) {
                return snapWidgetHelper(snapshot);
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.036),
                      Container(
                        padding: EdgeInsets.only(right: width * 0.03),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kwhite,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: ListTile(
                                leading: const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: AssetImage(
                                    'assets/icons/avatar.png',
                                  ),
                                ),
                                title: MyText(
                                  text: 'user_name',
                                  size: 14 * sp,
                                  weight: ksix,
                                  color: kgrey8,
                                ),
                                subtitle: MyText(
                                  text: 'Video editor',
                                  size: 14 * sp,
                                  weight: kfour,
                                  color: kgrey5,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: height * 0.042,
                                padding: EdgeInsets.symmetric(
                                    horizontal: width / 25),
                                decoration: BoxDecoration(
                                  border: Border.all(color: kcomplete),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: MyText(
                                    text: '• Online',
                                    size: 14 * sp,
                                    weight: kfour,
                                    color: kcomplete,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.024),
                      Container(
                        height: height * 0.08,
                        padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kwhite,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: MyText(
                                  text: "Completed orders",
                                  size: 14 * sp,
                                  weight: kfour,
                                  color: kgrey8,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: MyText(
                                  text: "25",
                                  size: 14 * sp,
                                  weight: ksix,
                                  color: kgrey8,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.024),
                      MyText(
                        text: 'Skills',
                        size: 14 * sp,
                        weight: ksix,
                        color: kgrey8,
                      ),
                      SizedBox(height: height * 0.015),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ...List.generate(
                            2,
                            (index) => Container(
                              margin: EdgeInsets.only(right: width * 0.01),
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.05),
                              height: height * 0.05,
                              decoration: BoxDecoration(
                                color: const Color(0xff773CFF).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(38),
                              ),
                              child: Center(
                                child: MyText(
                                  text: '${skills[index]}',
                                  size: 10 * sp,
                                  weight: kfour,
                                  color: kprimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.024),
                      MyText(
                        text: 'Editor previous work',
                        size: 14 * sp,
                        weight: ksix,
                        color: kgrey8,
                      ),
                      SizedBox(height: height * 0.024),
                      ...List.generate(
                          images.length,
                          (index) => buildPlayVideo(sp, height, width,
                              images: images[index])),
                      SizedBox(height: height * 0.03),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: height * 0.07,
                              child: MyButton(
                                color: kwhite,
                                text: 'Deny',
                                textColor: kprimaryColor,
                                onPress: () {
                                  Get.toNamed(Routes.BOTTOM_BAR);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 65,
                          ),
                          Expanded(
                            child: SizedBox(
                              height: height * 0.07,
                              child: MyButton(
                                text: 'Get started',
                                onPress: () {
                                  Get.toNamed(Routes.IN_PROGRESS);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.044),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Column buildPlayVideo(double sp, double height, double width,
      {required String images}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: 'Title for this video',
          size: 14 * sp,
          weight: kfour,
          color: kgrey8,
        ),
        SizedBox(height: height * 0.014),
        Container(
          margin: EdgeInsets.only(bottom: height * 0.01),
          height: height / 3.1,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('${images}')),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.play_circle_outline,
            size: 60,
            color: kwhite,
          ),
        )
      ],
    );
  }

  Container buildProjectTitleContainer(double height, double width, double sp) {
    return Container(
        padding: EdgeInsets.only(
          top: height * 0.024,
          left: width * 0.05,
          right: width * 0.05,
          bottom: height * 0.005,
        ),
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                color: const Color(0xff0000000A).withOpacity(0.04),
                blurRadius: 15.0,
                spreadRadius: 0.0),
          ],
          color: kwhite,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyText(
              text: 'Project title',
              size: 16 * sp,
              weight: ksix,
              color: kblack,
            ),
            SizedBox(height: height * 0.015),
            buildRow(sp, leftText: 'Total video', rightText: '2'),
            SizedBox(height: height * 0.015),
            buildRow(sp, leftText: 'Type', rightText: 'Personal'),
            SizedBox(height: height * 0.015),
            buildRow(sp,
                leftText: 'Assigned date', rightText: '20 Sept 2022, 06:23 PM'),
            SizedBox(height: height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyText(
                  text: 'Project stats',
                  size: 14 * sp,
                  weight: kfour,
                  color: kblack,
                ),
                Container(
                  height: height * 0.03,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: kwarning.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: MyText(
                      text: 'Quote',
                      size: 10 * sp,
                      weight: kfour,
                      color: kwarning,
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }

  Row buildRow(double sp,
      {required String leftText, required String rightText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
          text: '$leftText',
          size: 14 * sp,
          weight: kfour,
          color: kblack,
        ),
        MyText(
          text: '$rightText',
          size: 14 * sp,
          weight: ksix,
          color: kblack,
        ),
      ],
    );
  }
}
