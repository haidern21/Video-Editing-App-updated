import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/main.dart';
import 'package:video_editing_app/widgets/back_button.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/app_constants.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/login_field.dart';
import '../../../routes/app_pages.dart';
import '../controllers/editor_profile_edit_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';

EditorProfileEditController controller = Get.put(EditorProfileEditController());

class EditorProfileEditView extends GetView<EditorProfileEditView> {
  List<String> skills = ['Wedding videos', 'VFX'];
  List<String> images = [
    'assets/icons/image1.png',
    'assets/icons/image2.png',
    'assets/icons/image3.png'
  ];
  bool state = false;

  EditorProfileEditView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.state;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kwhite,
        appBar: AppBar(
          backgroundColor: kwhite,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.all(5),
            child: backButton(),
          ),
          title: MyText(
            text: "Profile Settings",
            size: 16 * sp,
            color: kblack,
            weight: ksix,
          ),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () async {
                SharedPreferences sharedPrefs =
                    await SharedPreferences.getInstance();
                await sharedPrefs.remove('jwtToken');
                Get.offAllNamed(Routes.SIGN_IN);
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.036),
                Row(
                  children: [
                    Obx(
                      () => controller.newProfileImage.isEmpty
                          ? CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  controller.userProfileImage.value.isEmpty
                                      ? emptyUserImage
                                      : controller.userProfileImage.value),
                            )
                          : CircleAvatar(
                              radius: 30,
                              backgroundImage:
                                  FileImage(controller.newProfileImage[0]),
                            ),
                    ),
                    SizedBox(width: width * 0.04),
                    GestureDetector(
                      onTap: () async {
                        var picker = await ImagePicker().pickImage(
                            source: ImageSource.gallery, imageQuality: 20);
                        controller.newProfileImage
                            .insert(0, File(picker!.path));
                        if (controller.newProfileImage.isNotEmpty) {
                          controller.userProfileImage.value =
                              await controller.uploadImageAndGetDownloadUrl(
                                  controller.newProfileImage[0]);
                        }
                      },
                      child: Container(
                        height: height * 0.05,
                        padding: EdgeInsets.symmetric(horizontal: width / 20),
                        decoration: BoxDecoration(
                          color: const Color(0xff773CFF).withOpacity(0.09),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: MyText(
                            text: 'Replace',
                            size: 14 * sp,
                            weight: kfive,
                            color: kprimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.028),
                    Container(
                      height: height * 0.05,
                      padding: EdgeInsets.symmetric(horizontal: width / 20),
                      decoration: BoxDecoration(
                        color: const Color(0xff773CFF).withOpacity(0.09),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: MyText(
                          text: 'Delete',
                          size: 14 * sp,
                          weight: kfive,
                          color: kprimaryColor,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: height * 0.024),
                buildTitle(title: 'User name', sp),
                SizedBox(height: height * 0.009),
                buildLoginFields(
                  sp,
                  hinttext: 'User name',
                  controller: controller.nameController,
                  validator: (val) {},
                ),
                SizedBox(height: height * 0.024),
                buildTitle(title: 'Editor title', sp),
                SizedBox(height: height * 0.009),
                buildLoginFields(
                  sp,
                  hinttext: 'Video editor & moton graphic designer',
                  controller: controller.editorTitle,
                  validator: null,
                ),
                SizedBox(height: height * 0.024),
                GetBuilder<EditorProfileEditController>(
                  builder: (controller) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                          vertical: height * 0.01, horizontal: width / 30),
                      width: width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: kgrey3)),
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
                ),
                SizedBox(height: height * 0.024),
                MyText(
                  text: 'Skills',
                  size: 14 * sp,
                  weight: ksix,
                  color: kgrey8,
                ),
                SizedBox(height: height * 0.015),
                Obx(
                  () => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ...List.generate(
                          controller.skills.isEmpty
                              ? 0
                              : controller.skills.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: width * 0.01),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xff773CFF).withOpacity(0.05),
                              borderRadius: BorderRadius.circular(38),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  MyText(
                                    text: controller.skills[index],
                                    size: 10 * sp,
                                    weight: kfour,
                                    color: kprimaryColor,
                                  ),
                                  SizedBox(width: width * 0.01),
                                  GestureDetector(
                                    onTap: () {
                                      controller.skills.removeAt(index);
                                    },
                                    child: const Icon(
                                      Icons.cancel_outlined,
                                      size: 13,
                                      color: kprimaryColor,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _displayTextInputDialog(
                                context: context,
                                controller: controller.skillController,
                                onOkButtonPressed: () {
                                  if (controller
                                      .skillController.text.isNotEmpty) {
                                    controller.skills
                                        .add(controller.skillController.text);
                                    Get.back();
                                  }
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: width * 0.01),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.05),
                            height: height * 0.05,
                            decoration: BoxDecoration(
                              color: const Color(0xff773CFF),
                              borderRadius: BorderRadius.circular(38),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 16,
                                    color: kwhite,
                                  ),
                                  SizedBox(width: width * 0.01),
                                  MyText(
                                    text: 'Add',
                                    size: 10 * sp,
                                    weight: kfour,
                                    color: kwhite,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                SizedBox(height: height * 0.01),
                Container(
                  height: height * 0.07,
                  decoration: BoxDecoration(
                      color: kprimaryColor,
                      borderRadius: BorderRadius.circular(55)),
                  child: Obx(
                    () => controller.showLoader.value == false
                        ? MyButton(
                            text: 'Save changes',
                            textColor: kwhite,
                            onPress: () async {
                              if (controller.newProfileImage.isNotEmpty ||
                                  controller.nameController.text !=
                                      controller.editorProfileController
                                          .userModelFromApi.value?.user?.name) {
                                controller.updateUserProfile();
                              }
                              await controller.updateEditorProfile();
                            },
                          )
                        : const Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          )),
                  ),
                ),
                SizedBox(height: height * 0.044),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _displayTextInputDialog(
      {required BuildContext context,
      required TextEditingController controller,
      required VoidCallback? onOkButtonPressed}) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add skill'),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter skill",
                enabledBorder: enabledborder,
                errorBorder: errorborder,
                focusedBorder: focusedborder,
              ),
            ),
            actions: <Widget>[
              GestureDetector(
                onTap: onOkButtonPressed,
                child: Container(
                  margin: EdgeInsets.only(right: width * 0.01),
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  height: height * 0.05,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xff773CFF),
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          size: 16,
                          color: kwhite,
                        ),
                        SizedBox(width: width * 0.01),
                        MyText(
                          text: 'Add',
                          size: 10 * sp,
                          weight: kfour,
                          color: kwhite,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
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
        ),
        SizedBox(height: height * 0.014),
        Row(
          children: [
            Container(
              height: height * 0.05,
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              decoration: BoxDecoration(
                color: const Color(0xff9263FF).withOpacity(0.09),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: MyText(
                  text: 'Replace',
                  size: 14 * sp,
                  weight: kfive,
                  color: kprimaryColor,
                ),
              ),
            ),
            SizedBox(width: width * 0.028),
            Container(
              height: height * 0.05,
              padding: EdgeInsets.symmetric(horizontal: width / 20),
              decoration: BoxDecoration(
                color: const Color(0xff9263FF).withOpacity(0.09),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: MyText(
                  text: 'Delete',
                  size: 14 * sp,
                  weight: kfive,
                  color: kprimaryColor,
                ),
              ),
            )
          ],
        ),
        SizedBox(height: height * 0.024),
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

MyText buildTitle(double sp, {required String title}) {
  return MyText(
    text: title,
    size: 12 * sp,
    weight: kfour,
    color: kgrey8,
  );
}

Widget buildLoginFields(double sp,
    {required String hinttext,
    TextEditingController? controller,
    required var validator,
    var onSaved}) {
  return LoginFields(
    formcontroller: controller,
    contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
    fieldValidator: validator,
    style: TextStyle(
      fontSize: 12 * sp,
      fontWeight: kfour,
      color: kblack,
    ),
    hintText: hinttext,
    hintStyle: TextStyle(
      fontSize: 12 * sp,
      fontWeight: kfour,
      color: kgrey3,
    ),
    enableBorder: enabledborder,
    errorBorder: errorborder,
    focusBorder: focusedborder,
    onSavedState: onSaved,
    border: enabledborder,
  );
}
