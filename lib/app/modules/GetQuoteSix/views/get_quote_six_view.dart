import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../../widgets/form_validators.dart';
import '../../GetQuoteFive/controllers/get_quote_five_controller.dart';
import '../controllers/get_quote_six_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';

GetQuoteSixController controller = Get.put(GetQuoteSixController());
GetQuoteFiveController fiveController = Get.put(GetQuoteFiveController());

class GetQuoteSixView extends StatefulWidget {
  const GetQuoteSixView({Key? key}) : super(key: key);

  @override
  State<GetQuoteSixView> createState() => _GetQuoteSixViewState();
}

class _GetQuoteSixViewState extends State<GetQuoteSixView> {
  String buttonText = '';
  String dropdownValue = 'Minutes';

  @override
  void initState() {
    super.initState();
    loadData();
    // loadDatas();
    controller.loadData();
  }

  loadData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    buttonText = sharedPreferences.getString('buttonText') ?? '';
  }

  final List<String> minutes = [
    '1-30 minutes',
    '20-30 minutes',
  ];

  String? selectedValue;
  var formKey = GlobalKey<FormState>();

  // loadDatas() {
  //   log('load datasss ');
  //   var data = Get.arguments;
  //   int selectedVideoIndex =
  //       controller.getQuoteFiveController.quoteVideos.asMap().containsKey(0)
  //           ? 0
  //           : -1;
  //     controller.videoDurationController.text = controller
  //             .getQuoteFiveController.quoteVideos
  //             .asMap()
  //             .containsKey(selectedVideoIndex)
  //         ? controller.getQuoteFiveController.quoteVideos[selectedVideoIndex]
  //             .numberOfMinutes
  //             .toString()
  //         : 'empty time ';
  //
  //     controller.urlController.text = controller
  //             .getQuoteFiveController.quoteVideos
  //             .asMap()
  //             .containsKey(selectedVideoIndex)
  //         ? controller.getQuoteFiveController.quoteVideos[selectedVideoIndex]
  //             .googleDriveLink
  //             .toString()
  //         : 'empty url';
  // }

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
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height * 0.025),
                  MyText(
                    text: buttonText,
                    size: 16 * sp,
                    color: kblack,
                    weight: ksix,
                  ),
                  SizedBox(height: height * 0.036),
                  buildTitle(sp, title: 'How Long Should The Final Video Be?'),
                  SizedBox(height: height * 0.008),
                  Row(
                    children: [
                      Expanded(
                        flex: 5,
                        child: SizedBox(
                          child: TextFormField(
                            validator: durationValidator,
                            controller: controller.videoDurationController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(
                              fontSize: 14 * sp,
                              fontWeight: kfour,
                              color: const Color(0xff25313A),
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: width * 0.02),
                              hintText: '1-30 minutes',
                              hintStyle: TextStyle(
                                fontSize: 14 * sp,
                                fontWeight: kfour,
                                color: kgrey3,
                              ),
                              enabledBorder: enabledborder,
                              errorBorder: errorborder,
                              focusedBorder: focusedborder,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          decoration: BoxDecoration(color: kwhite, boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.3),
                                blurRadius: 4,
                                spreadRadius: 2)
                          ]),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: DropdownButton<String>(
                              // Step 3.
                              value: dropdownValue,
                              underline: const SizedBox(
                                height: 0,
                              ),
                              // Step 4.
                              items: <String>[
                                'Minutes',
                                'Seconds'
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                );
                              }).toList(),
                              // Step 5.
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // buildLoginFields(
                  //   sp,
                  //   hinttext: '1-30 minutes',
                  //   controller: controller.videoDurationController,
                  //   validator: durationValidator,
                  // ),
                  SizedBox(height: height * 0.030),
                  buildTitle(sp, title: 'Google drive url * ( Raw video)'),
                  SizedBox(height: height * 0.008),
                  // buildLoginFields(
                  //   sp,
                  //   hinttext: 'Enter URL',
                  //   controller: urlController,
                  //   validator: driveUrlValidator,
                  // ),
                  TextFormField(
                    validator: driveUrlValidator,
                    controller: controller.urlController,
                    style: TextStyle(
                      fontSize: 14 * sp,
                      fontWeight: kfour,
                      color: const Color(0xff25313A),
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: width * 0.02),
                      hintText: 'Enter Url',
                      hintStyle: TextStyle(
                        fontSize: 14 * sp,
                        fontWeight: kfour,
                        color: kgrey3,
                      ),
                      enabledBorder: enabledborder,
                      errorBorder: errorborder,
                      focusedBorder: focusedborder,
                    ),
                  ),
                  SizedBox(height: height * 0.030),
                  buildTitle(
                    sp,
                    title:
                        'Please describe any animated text or special\neffects you may want)',
                  ),
                  SizedBox(height: height * 0.008),
                  Container(
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      color: kwhite,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: kgrey3,
                      ),
                    ),
                    child: TextFormField(
                      validator: descriptionValidator,
                      controller: controller.descripController,
                      style: TextStyle(
                        fontSize: 14 * sp,
                        fontWeight: kfour,
                        color: const Color(0xff25313A),
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: width * 0.02),
                        hintText: 'write something here',
                        hintStyle: TextStyle(
                          fontSize: 14 * sp,
                          fontWeight: kfour,
                          color: kgrey3,
                        ),
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SizedBox(height: height / 7),
                  Container(
                    decoration: BoxDecoration(boxShadow: [kshadow]),
                    width: width,
                    height: height * 0.07,
                    child: MyButton(
                      text: 'Next',
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          try {
                            int selectedVideoIndex = Get.arguments;
                            controller.selectedIndex.value = Get.arguments;
                            // print(controller.selectedIndex.value);
                            var data = {
                              'index': selectedVideoIndex.toString(),
                              'url': controller.urlController.text,
                              'description': controller.descripController.text,
                              'time': controller.videoDurationController.text,
                            };
                            sharedPreferences.setString(
                              '$selectedVideoIndex',
                              jsonEncode(data),
                            );
                            Get.toNamed(
                              Routes.GET_QUOTE_SEVEN,
                              arguments: data,
                            );
                          } catch (e) {
                            Logger().e(e);
                          }
                        }
                      },
                    ),
                  ),
                  SizedBox(height: height * 0.05)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  MyText buildTitle(double sp, {required String title}) {
    return MyText(
      text: title,
      size: 14 * sp,
      weight: kfour,
      color: const Color(0xff25313A),
    );
  }

  LoginFields buildLoginFields(double sp,
      {required String hinttext,
      TextEditingController? controller,
      required var validator}) {
    return LoginFields(
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
    );
  }
}

// class GetQuoteSixView extends GetView<GetQuoteSixController> {
