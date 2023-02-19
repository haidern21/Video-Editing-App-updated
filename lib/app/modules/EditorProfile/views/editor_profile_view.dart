import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../controllers/editor_profile_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';

class EditorProfileView extends GetView<EditorProfileController> {
  List<String> skills = ['Wedding videos', 'VFX'];
  List<String> images = [
    'assets/icons/image1.png',
    'assets/icons/image2.png',
    'assets/icons/image3.png'
  ];

  EditorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.state;
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
            text: "My Profile",
            size: 16 * sp,
            color: kblack,
            weight: ksix,
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.EDITOR_PROFILE_EDIT);
              },
              child: Padding(
                padding: EdgeInsets.only(right: width / 20),
                child: SvgPicture.asset(
                  'assets/icons/edit.svg',
                  height: height * 0.025,
                ),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.025),
                buildUserContainer(height, width, sp),
                SizedBox(height: height * 0.024),
                buildSwitch(width, sp, height),
                SizedBox(height: height * 0.024),
                buildWithdraw(height, width, sp),
                SizedBox(height: height * 0.024),
                MyText(
                  text: 'Skills',
                  size: 14 * sp,
                  weight: ksix,
                  color: kgrey8,
                ),
                SizedBox(height: height * 0.015),
                Obx(
                  () => controller.userModelFromApi.value != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ...List.generate(
                              controller.userModelFromApi.value!.skills!.isEmpty
                                  ? 0
                                  : controller
                                      .userModelFromApi.value!.skills!.length,
                              (index) => Container(
                                margin: EdgeInsets.only(right: width * 0.01),
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.05),
                                height: height * 0.05,
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xff773CFF).withOpacity(0.08),
                                  borderRadius: BorderRadius.circular(38),
                                ),
                                child: Center(
                                  child: MyText(
                                    text: controller
                                        .userModelFromApi.value!.skills![index],
                                    size: 10 * sp,
                                    weight: kfour,
                                    color: kprimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
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
                // Row(
                //   children: [
                //     Expanded(
                //       child: SizedBox(
                //         height: height * 0.07,
                //         child: MyButton(
                //           color: kwhite,
                //           text: 'Deny',
                //           textColor: kprimaryColor,
                //           onPress: () {},
                //         ),
                //       ),
                //     ),
                //     SizedBox(
                //       width: width / 65,
                //     ),
                //     Expanded(
                //       child: SizedBox(
                //         height: height * 0.07,
                //         child: MyButton(
                //           text: 'Get started',
                //           onPress: () {},
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: height * 0.044),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Container buildUserContainer(double height, double width, double sp) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: height * 0.02,
        horizontal: width / 30,
      ),
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: kwhite,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(
                  'assets/icons/circle2.png',
                ),
              ),
              SizedBox(width: width / 60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => MyText(
                      text: controller.userModelFromApi.value?.user?.name ??
                          "user name",
                      size: 14 * sp,
                      weight: ksix,
                      color: kgrey8,
                    ),
                  ),
                  Row(
                    children: [
                      MyText(
                        text: "Points:  ",
                        size: 14 * sp,
                        weight: kfour,
                        color: kgrey6,
                      ),
                      Obx(
                        () => MyText(
                          text: controller.userModelFromApi.value?.user?.points??'',
                          size: 14 * sp,
                          weight: ksix,
                          color: kgrey6,
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
          Obx(
            () => GestureDetector(
              onTap: () {
                controller.changeIcon.value = !controller.changeIcon.value;
              },
              child: Icon(
                controller.changeIcon.value == false
                    ? Icons.notifications_none_outlined
                    : Icons.notifications,
                color: kblack,
              ),
            ),
          )
        ],
      ),
    );
  }

  GetBuilder<EditorProfileController> buildSwitch(
      double width, double sp, double height) {
    return GetBuilder<EditorProfileController>(
      builder: (controller) {
        return Container(
          padding: EdgeInsets.only(
            left: width / 30,
            top: height * 0.005,
          ),
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kwhite,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(
                text: "Show online Status",
                size: 14 * sp,
                weight: kfour,
                color: kgrey8,
              ),
              Transform.scale(
                scale: 0.8,
                child: CupertinoSwitch(
                  value: controller.state,
                  onChanged: (value) {
                    controller.changeSwitch(value);
                  },
                  thumbColor: CupertinoColors.white,
                  activeColor: kprimaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  buildWithdraw(double height, double width, double sp) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.EDITOR_WITHDRAW);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: height * 0.02,
          horizontal: width / 30,
        ),
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: kwhite,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/dollarSign.svg',
                  height: height * 0.02,
                ),
                SizedBox(width: width / 40),
                MyText(
                  text: "Withdraw",
                  size: 14 * sp,
                  weight: kfour,
                  color: kblack,
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_outlined,
              color: Color(0xff090A0A),
              size: 15,
            )
          ],
        ),
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
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(images)),
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
                color: const Color(0xff000000).withOpacity(0.04),
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
          text: leftText,
          size: 14 * sp,
          weight: kfour,
          color: kblack,
        ),
        MyText(
          text: rightText,
          size: 14 * sp,
          weight: ksix,
          color: kblack,
        ),
      ],
    );
  }
}
