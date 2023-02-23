import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editing_app/constants/colors.dart';
import '../../AddNewCard/views/add_new_card_view.dart';
import '../controllers/account_setting_controller.dart';
import 'package:video_editing_app/constants/weight.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import 'account_setting_appbar.dart';
import 'drop_down.dart';

class AccountSettingView extends GetView<AccountSettingController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9FB),
        appBar: AccountSettingAppbar(sp),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  Center(
                    child: GestureDetector(
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
                      child: Obx(
                        () => CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              NetworkImage(controller.userProfileImage.value),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.012),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTitle(sp, title: 'User name'),
                      SizedBox(height: height * 0.012),
                      buildLoginFields(
                        sp,
                        hinttext: 'Enter your User name',
                        controller: controller.userNameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter user name';
                          } else {
                            DoNothingAction();
                          }
                        },
                      ),
                      SizedBox(height: height * 0.025),
                      buildTitle(sp, title: 'Account type'),
                      SizedBox(height: height * 0.012),
                      DropDown(sp, height),
                      SizedBox(height: height * 0.025),
                      buildTitle(sp, title: 'Phone number'),
                      SizedBox(height: height * 0.012),
                      buildLoginFields(
                        sp,
                        hinttext: 'phone number',
                        controller: controller.phoneNumberController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter phone number';
                          } else
                            DoNothingAction();
                        },
                      ),
                      SizedBox(height: height * 0.025),
                      Container(
                        height: height / 14,
                        width: Get.width,
                        decoration: BoxDecoration(
                          boxShadow: [kshadow],
                          color: kprimaryColor,
                          borderRadius: BorderRadius.circular(55),
                        ),
                        child: Obx(
                          () => controller.showLoader.value == false
                              ? MyButton(
                                  text: 'Save changes',
                                  size: 14 * sp,
                                  weight: kfive,
                                  onPress: () {
                                    controller.updateUserProfile();
                                  },
                                )
                              : const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                      SizedBox(height: height / 28),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
