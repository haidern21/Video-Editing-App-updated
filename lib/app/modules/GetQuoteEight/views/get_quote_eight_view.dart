import 'dart:convert';
import 'package:http/src/response.dart' as http;
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/app/data/models/quote_model.dart';
import 'package:video_editing_app/app/modules/ChatView/views/chat_view_view.dart';
import 'package:video_editing_app/app/modules/GetQuoteFive/controllers/get_quote_five_controller.dart';
import 'package:video_editing_app/app/modules/GetQuoteFive/views/get_quote_five_view.dart';
import 'package:video_editing_app/app/modules/GetQuoteFour/controllers/get_quote_four_controller.dart';
import 'package:video_editing_app/app/modules/GetQuoteThree/controllers/get_quote_three_controller.dart';
import 'package:video_editing_app/app/modules/Order/views/order_view.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../../GetQuote/controllers/get_quote_controller.dart';
import '../../GetQuoteSeven/controllers/get_quote_seven_controller.dart';
import '../../GetQuoteSix/controllers/get_quote_six_controller.dart';
import '../controllers/get_quote_eight_controller.dart';

GetQuoteFiveController controller = Get.put(GetQuoteFiveController());
GetQuoteEightController getQuoteEightController =
    Get.put(GetQuoteEightController());
GetQuoteController getQuoteController = Get.put(GetQuoteController());
GetQuoteThreeController getQuoteThreeController = Get.find();
GetQuoteFourController getQuoteFourController = Get.find();
GetQuoteSixController getQuoteSixController = Get.find();
GetQuoteSevenController getQuoteSevenController = Get.find();

class GetQuoteEightView extends StatefulWidget {
  const GetQuoteEightView({Key? key}) : super(key: key);

  @override
  State<GetQuoteEightView> createState() => _GetQuoteEightViewState();
}

class _GetQuoteEightViewState extends State<GetQuoteEightView> {
  List<CheckBoxListTileModel> checkBoxListTileModel =
      CheckBoxListTileModel.getUsers();
  late int selectedVideoIndex;
  String buttonText = '';
  String checkValue = 'Video #${controller.totalVideos}';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    var data = Get.arguments;
    selectedVideoIndex = int.parse(data['index']);
    print(selectedVideoIndex);
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    buttonText = sharedPreferences.getString('buttonText') ?? '';
    setState(() {});
  }

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.025),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.049),
              child: MyText(
                text: "What sizes would you like your videos",
                size: 16 * sp,
                color: kblack,
                weight: kfive,
              ),
            ),
            SizedBox(height: height * 0.015),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.029),
              // child: ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: checkBoxListTileModel.length,
              //   itemBuilder: (BuildContext context, int index) {
              //     return Column(
              //       children: [
              //         CheckboxListTile(
              //           checkColor: kwhite,
              //           visualDensity: const VisualDensity(
              //             horizontal: 0,
              //             vertical: -4,
              //           ),
              //           contentPadding: EdgeInsets.zero,
              //           checkboxShape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(4),
              //           ),
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(4),
              //           ),
              //           side: const BorderSide(
              //             width: 2,
              //             color: kgrey3,
              //           ),
              //           controlAffinity: ListTileControlAffinity.leading,
              //           activeColor: kprimaryColor,
              //           dense: true,
              //           //font change
              //           title: Text(
              //             checkBoxListTileModel[index].title,
              //             style: TextStyle(
              //               fontSize: 14 * sp,
              //               fontWeight: kfour,
              //               color: kgrey8,
              //               fontFamily: 'WorkSans',
              //             ),
              //           ),
              //           value: checkBoxListTileModel[index].isCheck,
              //           onChanged: (val) {
              //             itemChange(val!, index);
              //           },
              //         )
              //       ],
              //     );
              //   },
              // ),
              child: Column(
                children: [
                  Obx(
                    () => checkBox(
                        title: 'Vertical',
                        value: getQuoteFiveController.quoteVideos
                                .asMap()
                                .containsKey(selectedVideoIndex)
                            ? getQuoteFiveController
                                    .quoteVideos[selectedVideoIndex]
                                    .verticalSize ??
                                false
                            : getQuoteEightController.vertical.value,
                        onChanged: (val) {
                          getQuoteEightController.vertical.value = val!;
                        }),
                  ),
                  Obx(
                    () => checkBox(
                        title: 'Horizontal',
                        value: getQuoteFiveController.quoteVideos
                                .asMap()
                                .containsKey(selectedVideoIndex)
                            ? getQuoteFiveController
                                    .quoteVideos[selectedVideoIndex]
                                    .horizontalSize ??
                                false
                            : getQuoteEightController.horizontal.value,
                        onChanged: (val) {
                          getQuoteEightController.horizontal.value = val!;
                        }),
                  ),
                  Obx(
                    () => checkBox(
                        title: 'Square',
                        value: getQuoteFiveController.quoteVideos
                                .asMap()
                                .containsKey(selectedVideoIndex)
                            ? getQuoteFiveController
                                    .quoteVideos[selectedVideoIndex]
                                    .squareSize ??
                                false
                            : getQuoteEightController.square.value,
                        onChanged: (val) {
                          getQuoteEightController.square.value = val!;
                        }),
                  ),
                  Obx(
                    () => checkBox(
                        title: 'All of Above',
                        value: getQuoteFiveController.quoteVideos
                                .asMap()
                                .containsKey(selectedVideoIndex)
                            ? getQuoteFiveController
                                    .quoteVideos[selectedVideoIndex].allSizes ??
                                false
                            : getQuoteEightController.allOfAbove.value,
                        onChanged: (val) {
                          getQuoteEightController.allOfAbove.value = val!;
                        }),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.049),
              decoration: BoxDecoration(boxShadow: [kshadow]),
              width: width,
              height: height * 0.07,
              child: MyButton(
                text: checkValue == buttonText
                    ? 'Get Quote'
                    : 'back to ${buttonText.toString()}',
                onPress: () async {
                  debug(buttonText.toString());
                  Map<String, dynamic> data = Get.arguments;
                  for (CheckBoxListTileModel e in checkBoxListTileModel) {
                    data.putIfAbsent(
                      e.title,
                      () => e.isCheck.toString(),
                    );
                  }

                  await SharedPreferences.getInstance().then((shared) async {
                    // shared.setString('buttonText', buttonText);
                    // shared.setString('checkValue', checkValue);
                    await shared.setString(
                      '${data['index']}',
                      jsonEncode(data),
                    );
                  });
                  debug('Index value is: ${data.toString()}');
                  QuoteVideos quoteVideos = QuoteVideos();
                  quoteVideos.googleDriveLink =
                      getQuoteSixController.urlController.text;
                  quoteVideos.numberOfMinutes = int.parse(
                      getQuoteSixController.videoDurationController.text);
                  // quoteVideos.numberOfMinutes = int.parse(data['time'] ?? 0);
                  quoteVideos.details =
                      getQuoteSixController.descripController.text;
                  quoteVideos.colorGrading =
                      getQuoteSevenController.colorGrading.value;
                  quoteVideos.animation =
                      getQuoteSevenController.animations.value;
                  quoteVideos.customSubtitle =
                      getQuoteSevenController.customSubtitles.value;
                  quoteVideos.specialEffectOrVfx =
                      getQuoteSevenController.specialEffects.value;
                  quoteVideos.copyrightFreeMusic =
                      getQuoteSevenController.copyrightFree.value;
                  quoteVideos.transitions =
                      getQuoteSevenController.transition.value;
                  quoteVideos.motionGraphics =
                      getQuoteSevenController.motionGraphics.value;
                  quoteVideos.verticalSize =
                      getQuoteEightController.vertical.value;
                  quoteVideos.horizontalSize =
                      getQuoteEightController.horizontal.value;
                  quoteVideos.squareSize = getQuoteEightController.square.value;
                  quoteVideos.allSizes =
                      getQuoteEightController.allOfAbove.value;
                  // quoteVideos.quote=5;//not needed anymore
                  log(quoteVideos);
                  var quoteExists = getQuoteFiveController.quoteVideos.where(
                      (element) =>
                          element.googleDriveLink ==
                          quoteVideos.googleDriveLink);
                  if (quoteExists.isEmpty) {
                    getQuoteFiveController.quoteVideos.add(quoteVideos);
                  }else{
                    Get.snackbar('Error', 'Two or more videos urls are same!');
                    return ;
                  }

                  log('quote videos length is : ${getQuoteFiveController.quoteVideos.length}');

                  getQuoteSevenController.colorGrading.value = false;
                  getQuoteSevenController.animations.value = false;
                  getQuoteSevenController.customSubtitles.value = false;
                  getQuoteSevenController.specialEffects.value = false;
                  getQuoteSevenController.copyrightFree.value = false;
                  getQuoteSevenController.transition.value = false;
                  getQuoteSevenController.motionGraphics.value = false;
                  getQuoteEightController.vertical.value = false;
                  getQuoteEightController.horizontal.value = false;
                  getQuoteEightController.square.value = false;
                  getQuoteEightController.allOfAbove.value = false;

                  if (checkValue == buttonText) {
                    QuoteModel quoteModel = QuoteModel();
                    quoteModel.quoteVideos = getQuoteFiveController.quoteVideos;
                    quoteModel.packageId =
                        getQuoteController.selectedPackageModel.id ?? 0;
                    quoteModel.name = getQuoteThreeController.userName.value;
                    quoteModel.email = getQuoteThreeController.userEmail.value;
                    quoteModel.phoneNumber =
                        getQuoteThreeController.userPhone.value;
                    quoteModel.projectTitle =
                        getQuoteFourController.projectTitle.value;
                    quoteModel.videoCount =
                        int.parse(getQuoteFourController.videosCount.value);
                    quoteModel.duration = 10;
                    List videos = [];
                    for (var i in quoteModel.quoteVideos!) {
                      videos.add(i.toJson());
                    }
                    try {
                      http.Response response =
                          await buildHttpResponse(createQuoteEndPoints,
                              method: HttpMethod.POST,
                              request: {
                                "package": quoteModel.packageId,
                                "name": quoteModel.name,
                                "email": quoteModel.email,
                                "phone_number": quoteModel.phoneNumber,
                                "project_title": quoteModel.projectTitle,
                                "video_count": quoteModel.videoCount,
                                "duration": quoteModel.duration,
                                "quote_videos": videos
                              },
                              biuldAuthHeader: true);
                      if (response.statusCode == 400) {
                        Get.snackbar('Error', response.body);
                        return;
                      }
                      getQuoteSixController.urlController.clear();
                      Get.offAndToNamed(Routes.GET_QUOTE_ON_THE_WAY);
                      if (response.statusCode == 201) {
                        orderController.fetchOrdersList();
                      }
                    } catch (e) {
                      Get.snackbar('Something went wrong',
                          'Some thing went wrong while posting data to server.');
                    }
                  } else {
                    Get.toNamed(Routes.GET_QUOTE_FIVE);
                  }

                  // checkValue == buttonText
                  //     ? Get.offAndToNamed(Routes.GET_QUOTE_ON_THE_WAY)
                  //     : Get.toNamed(Routes.GET_QUOTE_FIVE);

                  // shared.clear();
                  // controller.selectedIndex = -1;
                },
              ),
            ),
            SizedBox(height: height * 0.05)
          ],
        ),
      ),
    );
  }

  void itemChange(bool val, int index) {
    setState(() {
      checkBoxListTileModel[index].isCheck = val;
    });
  }
}

Widget checkBox(
    {required String title,
    required bool value,
    required ValueChanged<bool?>? onChanged}) {
  final sp = Get.textScaleFactor;
  return CheckboxListTile(
    checkColor: kwhite,
    visualDensity: const VisualDensity(
      horizontal: 0,
      vertical: -4,
    ),
    contentPadding: EdgeInsets.zero,
    checkboxShape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(4),
    ),
    side: const BorderSide(
      width: 2,
      color: kgrey3,
    ),
    controlAffinity: ListTileControlAffinity.leading,
    activeColor: kprimaryColor,
    dense: true,
    //font change
    title: Text(
      title,
      style: TextStyle(
        fontSize: 14 * sp,
        fontWeight: kfour,
        color: kgrey8,
        fontFamily: 'WorkSans',
      ),
    ),
    value: value,
    onChanged: onChanged,
    // onChanged: (val) {
    //   setState(() {
    //     value = val!;
    //   });
    //   // itemChange(val!, index);
    // },
  );
}

Row buildRow(double height, double width, double sp,
    {required String text, required var checkBox}) {
  return Row(
    children: [
      SizedBox(
        height: height * 0.024,
        width: width * 0.024,
        child: checkBox,
      ),
      SizedBox(
        width: width * 0.04,
      ),
      MyText(
        text: '$text',
        size: 14 * sp,
        color: kgrey8,
        weight: kfour,
      )
    ],
  );
}

class CheckBoxListTileModel {
  int userId;

  String title;
  bool isCheck;

  CheckBoxListTileModel(
      {required this.userId, required this.title, required this.isCheck});

  static List<CheckBoxListTileModel> getUsers() {
    return <CheckBoxListTileModel>[
      CheckBoxListTileModel(userId: 1, title: "Vertical", isCheck: true),
      CheckBoxListTileModel(userId: 2, title: "Horizontal", isCheck: false),
      CheckBoxListTileModel(userId: 3, title: "Square", isCheck: false),
      CheckBoxListTileModel(
          userId: 5, title: "All of the above", isCheck: false),
    ];
  }
}
