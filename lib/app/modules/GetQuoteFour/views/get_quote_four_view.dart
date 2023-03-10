import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/widgets/form_validators.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/get_quote_four_controller.dart';

class GetQuoteFourView extends GetView<GetQuoteFourController> {
  GetQuoteFourView({super.key});

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
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
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  buildTitle(sp, title: 'Project title'),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: 'Project title',
                    controller: controller.projectTitleController,
                    validator: (val) {},
                    // validator: projectTitleValidator,
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(
                    sp,
                    // title:
                    //     'How Many Minutes Of Raw Footage Will You Be Sending Total?',
                    title: 'How Many videos Will You Be Sending Total?',
                  ),
                  SizedBox(height: height * 0.008),
                  buildLoginFields(
                    sp,
                    hinttext: '2',
                    controller: controller.totalVideosController,
                    validator: videoCountValidator,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(boxShadow: [kshadow]),
                    width: width,
                    height: height * 0.07,
                    child: MyButton(
                      text: 'Next',
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          controller.projectTitle.value =
                              controller.projectTitleController.text;
                          controller.videosCount.value =
                              controller.totalVideosController.text;
                          log('the project title is  : ${controller.projectTitle.value} from get quote  four view');
                          log('the video count  is : ${controller.videosCount.value} from get quote four view ');
                          controller.getQuoteFourData.addAll(
                            {
                              'project_title':
                                  controller.projectTitleController.text,
                              'video_count':
                                  controller.totalVideosController.text,
                            },
                          );

                          debug('debugMessage ${controller.getQuoteFourData}');
                          Get.toNamed(
                            Routes.GET_QUOTE_FIVE,
                            arguments: controller.getQuoteFourData,
                          );
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  )
                ],
              ),
            ),
          )),
    );
  }

  MyText buildTitle(double sp, {required String title}) {
    return MyText(
      text: title,
      size: 12 * sp,
      weight: kfour,
      color: kgrey8,
    );
  }

  LoginFields buildLoginFields(double sp,
      {required String hinttext,
      TextEditingController? controller,
      TextInputType? keyboardType,
      List<TextInputFormatter>? inputFormatters,
      required var validator}) {
    return LoginFields(
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      fieldValidator: validator,
      formcontroller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
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
    );
  }
}
