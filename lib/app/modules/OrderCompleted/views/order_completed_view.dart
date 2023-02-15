import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/EditorOrders/controllers/editor_orders_controller.dart';
import '../../../../Utils/utils.dart';
import '../../Order/controllers/order_controller.dart';
import '../controllers/order_completed_controller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';

class OrderCompletedView extends GetView<OrderCompletedController> {
  @override
  Widget build(BuildContext context) {
    EditorOrdersController editorOrderController = Get.find();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF9F9FB),
          leading: Padding(
            padding: EdgeInsets.all(5),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.CHECK_OUT);
                        },
                        child: buildProjectTitleContainer(height, width, sp,
                            // totalVideos: editorOrderController
                            //         .selectedOrder.quoteVideos!.isNotEmpty
                            //     ? editorOrderController
                            //         .selectedOrder.quoteVideos!.length
                            //         .toString()
                            //     : 0.toString(),
                            totalVideos: '0',
                            title: editorOrderController.selectedOrder.value!.projectTitle ??
                                '',
                            status:
                                editorOrderController.selectedOrder.value!.status ?? '')),
                    SizedBox(height: height * 0.001),
                    Theme(
                      data: Theme.of(context).copyWith(
                        unselectedWidgetColor:
                            Colors.transparent, // here for close state
                        colorScheme: ColorScheme.light(
                          primary: Colors.transparent,
                        ),
                        dividerColor: Colors.transparent,
                      ),
                      child: ExpansionTile(
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Start project ',
                                style: TextStyle(
                                  fontSize: 14 * sp,
                                  fontWeight: kfour,
                                  color: Color(0xff000000),
                                  fontFamily: 'WorkSans',
                                ),
                              ),
                              TextSpan(
                                text: 'Sep 19, 1:43 PM',
                                style: TextStyle(
                                  fontSize: 12 * sp,
                                  fontWeight: kfour,
                                  color: kgrey5,
                                  fontFamily: 'WorkSans',
                                ),
                              ),
                            ],
                          ),
                        ),
                        leading: SvgPicture.asset(
                          "assets/icons/list.svg",
                          height: height * 0.06,
                        ),
                      ),
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: Column(
                        children: [
                          ExpansionTile(
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Project details ',
                                    style: TextStyle(
                                      fontSize: 14 * sp,
                                      fontWeight: kfour,
                                      color: Color(0xff000000),
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sep 19, 1:43 PM',
                                    style: TextStyle(
                                      fontSize: 12 * sp,
                                      fontWeight: kfour,
                                      color: kgrey5,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: SvgPicture.asset(
                              "assets/icons/projectDetails.svg",
                              height: height * 0.06,
                            ),
                            children: [
                              ...List.generate(
                                  editorOrderController
                                      .selectedOrder.value!.quoteVideos!.isNotEmpty
                                      ? editorOrderController
                                      .selectedOrder.value!.quoteVideos!.length
                                      : 0,
                                  (index) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildDesciptionContainer(
                                              height, width, sp,
                                              projectNumber: '${index + 1}',
                                              description: editorOrderController
                                                      .selectedOrder.value!
                                                      .quoteVideos?[index]
                                                      .details ??
                                                  '',
                                              duration:editorOrderController
                                                  .selectedOrder.value!
                                                  .quoteVideos?[index]
                                                  .numberOfMinutes.toString() ?? '',
                                              driveLink:editorOrderController
                                                  .selectedOrder.value!
                                                  .quoteVideos?[index]
                                                  .googleDriveLink ?? ''),
                                          SizedBox(height: height * 0.013),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.062),
                                            child: MyText(
                                              text:
                                                  "What sizes would you like your videos",
                                              size: 16 * sp,
                                              color: Color(0xff000000),
                                              weight: ksix,
                                            ),
                                          ),
                                          SizedBox(height: height * 0.013),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.052),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .verticalSize ==
                                                    true
                                                    ? buildCheck(sp, text: 'Vertical')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .horizontalSize ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Horizontal')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .squareSize ==
                                                    true
                                                    ? buildCheck(sp, text: 'Square')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .allSizes ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'All of the above')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: height * 0.013),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.062),
                                            child: MyText(
                                              text:
                                                  "Please check off everything you would want for editing",
                                              size: 16 * sp,
                                              color: kgrey8,
                                              weight: kfive,
                                            ),
                                          ),
                                          SizedBox(height: height * 0.013),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: width * 0.052),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .colorGrading ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Colour Grading')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .animation ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Animations')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .customSubtitle ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Custom Subtitles')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .specialEffectOrVfx ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Special effects/ VFX')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .copyrightFreeMusic ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Copyright Free Music')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .transitions ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Transitions')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                                editorOrderController
                                                    .selectedOrder.value!
                                                    .quoteVideos![index]
                                                    .motionGraphics ==
                                                    true
                                                    ? buildCheck(sp,
                                                    text: 'Motion Graphics')
                                                    : const SizedBox(
                                                  height: 0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
                            ],
                          ),
                          ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Raju Mullah ',
                                    style: TextStyle(
                                      fontSize: 14 * sp,
                                      fontWeight: kfour,
                                      color: Color(0xff000000),
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sep 19, 1:43 PM',
                                    style: TextStyle(
                                      fontSize: 12 * sp,
                                      fontWeight: kfour,
                                      color: kgrey5,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/icons/imagePerson.png')),
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: width / 5.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: 'Hello, What’s up?',
                                            size: 14 * sp,
                                            color: kgrey8,
                                            weight: kfour,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Duseca Software ',
                                    style: TextStyle(
                                      fontSize: 14 * sp,
                                      fontWeight: kfour,
                                      color: Color(0xff000000),
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sep 19, 1:43 PM',
                                    style: TextStyle(
                                      fontSize: 12 * sp,
                                      fontWeight: kfour,
                                      color: kgrey5,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: CircleAvatar(
                                radius: 20,
                                backgroundImage:
                                    AssetImage('assets/icons/duseca.png')),
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: width / 5.5, right: width * 0.045),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: 'Doing well.',
                                        size: 14 * sp,
                                        color: kgrey8,
                                        weight: kfour,
                                      ),
                                      SizedBox(height: height * 0.012),
                                      MyText(
                                        text: 'Do you complete your project?',
                                        size: 14 * sp,
                                        color: kgrey8,
                                        weight: kfour,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Deliver order ',
                                    style: TextStyle(
                                      fontSize: 14 * sp,
                                      fontWeight: kfour,
                                      color: Color(0xff000000),
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sep 19, 1:43 PM',
                                    style: TextStyle(
                                      fontSize: 12 * sp,
                                      fontWeight: kfour,
                                      color: kgrey5,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: SvgPicture.asset(
                              'assets/icons/deliverOrder.svg',
                            ),
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(
                                      left: width / 5.5, right: width * 0.045),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text:
                                            'Thanks again for your order! Your delivery is enclosed. If there are any problems, please let me know. I\'ll get back to you as soon as I can.',
                                        size: 14 * sp,
                                        color: kgrey8,
                                        weight: kfour,
                                      ),
                                      SizedBox(height: height * 0.025),
                                      Row(
                                        children: [
                                          ...List.generate(
                                              3,
                                              (index) => Container(
                                                    margin: EdgeInsets.only(
                                                      right: width * 0.01,
                                                    ),
                                                    height: height * 0.09,
                                                    width: width / 6,
                                                    decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(
                                                            'assets/icons/playVideo.png'),
                                                      ),
                                                    ),
                                                  ))
                                        ],
                                      ),
                                      SizedBox(height: height * 0.025),
                                      // Row(
                                      //   children: [
                                      //     Expanded(
                                      //       child: SizedBox(
                                      //         height: height * 0.06,
                                      //         child: MyButton(
                                      //           borderColor: kgrey3,
                                      //           color: Color(0xffF9F9FB),
                                      //           textColor: kgre7,
                                      //           text: 'Request revision',
                                      //           onPress: () {},
                                      //         ),
                                      //       ),
                                      //     ),
                                      //     SizedBox(
                                      //       width: width * 0.01,
                                      //     ),
                                      //     Expanded(
                                      //       child: SizedBox(
                                      //         height: height * 0.06,
                                      //         child: MyButton(
                                      //           text: 'Accept',
                                      //           onPress: () {},
                                      //         ),
                                      //       ),
                                      //     )
                                      //   ],
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Revision accepted ',
                                    style: TextStyle(
                                      fontSize: 14 * sp,
                                      fontWeight: kfour,
                                      color: Color(0xff000000),
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sep 19, 1:43 PM',
                                    style: TextStyle(
                                      fontSize: 12 * sp,
                                      fontWeight: kfour,
                                      color: kgrey5,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: SvgPicture.asset(
                              "assets/icons/revision.svg",
                              height: height * 0.06,
                            ),
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: width / 5.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // MyText(
                                          //   text: 'Hello, What’s up?',
                                          //   size: 14 * sp,
                                          //   color: kgrey8,
                                          //   weight: kfour,
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            childrenPadding: EdgeInsets.zero,
                            title: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Order accepted ',
                                    style: TextStyle(
                                      fontSize: 14 * sp,
                                      fontWeight: kfour,
                                      color: Color(0xff000000),
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sep 19, 1:43 PM',
                                    style: TextStyle(
                                      fontSize: 12 * sp,
                                      fontWeight: kfour,
                                      color: kgrey5,
                                      fontFamily: 'WorkSans',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            leading: SvgPicture.asset(
                              "assets/icons/orderAccepted.svg",
                              height: height * 0.06,
                            ),
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: width / 5.5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // MyText(
                                          //   text: 'Hello, What’s up?',
                                          //   size: 14 * sp,
                                          //   color: kgrey8,
                                          //   weight: kfour,
                                          // ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height * 0.025),
                height: height * 0.1,
                width: width,
                color: kwhite,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.06,
                      width: width * 0.78,
                      child: TextFormField(
                        style: TextStyle(
                          fontSize: 14 * sp,
                          fontWeight: kfour,
                          fontFamily: 'Poppins',
                          color: kblack,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          hintStyle: TextStyle(
                            fontSize: 14 * sp,
                            fontWeight: kfour,
                            fontFamily: 'Poppins',
                            color: kblack,
                          ),
                          hintText: 'Type your message',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: kgrey3, width: 1.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: kgrey3, width: 1.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.0),
                            borderSide: BorderSide(color: kgrey3, width: 1.0),
                          ),
                          suffixIcon: FittedBox(
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/icons/upload.svg',
                                  ),
                                  SizedBox(width: 3),
                                  SvgPicture.asset(
                                    'assets/icons/camera.svg',
                                  ),
                                ],
                              ),
                            ),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: SvgPicture.asset(
                              'assets/icons/smile.svg',
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.019,
                    ),
                    SvgPicture.asset('assets/icons/frwrd.svg')
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildCheck(double sp, {required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GlobalListTileItem(),
        SizedBox(width: Checkbox.width * 0.3),
        MyText(
          text: '$text',
          size: 14 * sp,
          weight: kfour,
          color: Color(0xff000000),
        )
      ],
    );
  }

  Container buildDesciptionContainer(double height, double width, double sp,
      {required String projectNumber,
      required String duration,
      required String description,
      required String driveLink}) {
    return Container(
      padding: EdgeInsets.only(
        top: height * 0.02,
        left: width * 0.05,
        right: width * 0.05,
        bottom: height * 0.02,
      ),
      margin: EdgeInsets.only(
          left: width * 0.049, right: width * 0.049, top: height * 0.028),
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              color: Color(0xff0000000A).withOpacity(0.04),
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
            text: 'Video #$projectNumber',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          SizedBox(height: height * 0.015),
          buildDescription(
            sp,
            height,
            title: 'Estimated minutes',
            descrip: '$duration minutes',
          ),
          SizedBox(height: height * 0.015),
          buildDescription(sp, height, title: 'Drive link', descrip: driveLink
              // 'https://drive.google.com/file/d/1kazyfB4JHoZSmczN-FBVXB4C8qN5b46G/view?usp=sharing',
              ),
          SizedBox(height: height * 0.015),
          buildDescription(sp, height,
              title: 'Description', descrip: description
              // 'That\'s why you want to write long, thorough video descriptions (at least 200 words). YouTube\'s algorithm puts more weight on keywords that show up in the first 2-3 sentences of your description. In fact, YouTube recommends that you: “Put the most important keywords toward the beginning of your description”',
              ),
        ],
      ),
    );
  }

  Column buildDescription(double sp, double height,
      {required String title, required String descrip}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          text: '$title',
          size: 14 * sp,
          weight: ksix,
          color: kgrey8,
        ),
        SizedBox(height: height * 0.01),
        MyText(
          align: TextAlign.left,
          text: '$descrip',
          size: 14 * sp,
          weight: kfour,
          color: kgrey8,
        ),
      ],
    );
  }

  Container buildProjectTitleContainer(double height, double width, double sp,
      {required String title,
      required String status,
      required String totalVideos}) {
    return Container(
      padding: EdgeInsets.only(
        top: height * 0.024,
        left: width * 0.05,
        right: width * 0.05,
        bottom: height * 0.005,
      ),
      margin: EdgeInsets.only(
          left: width * 0.049, right: width * 0.049, top: height * 0.028),
      width: width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              color: Color(0xff0000000A).withOpacity(0.04),
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
            text: title,
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          SizedBox(height: height * 0.015),
          buildRow(
            sp,
            leftText: 'Total video',
            rightText: totalVideos,
          ),
          SizedBox(height: height * 0.015),
          buildRow(
            sp,
            leftText: 'Type',
            rightText: 'Personal',
          ),
          SizedBox(height: height * 0.015),
          buildRow(
            sp,
            leftText: 'Assigned date',
            rightText: '20 Sept 2022, 06:23 PM',
          ),
          SizedBox(height: height * 0.015),
          buildRow(
            sp,
            leftText: 'Project timeline',
            rightText: '10:23:54',
          ),
          SizedBox(height: height * 0.015),
          buildRow(
            sp,
            leftText: 'Project price',
            rightText: r'$145.00',
          ),
          SizedBox(height: height * 0.015),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: MyText(
                  text: 'Project stats',
                  size: 14 * sp,
                  weight: kfour,
                  color: kblack,
                ),
              ),
              FittedBox(
                child: Container(
                  height: height * 0.03,
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  decoration: BoxDecoration(
                    color: kinfo.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: MyText(
                      text: status,
                      size: 10 * sp,
                      weight: kfour,
                      color: kinfo,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * 0.009,
          )
        ],
      ),
    );
  }

  Row buildRow(double sp,
      {required String leftText, required String rightText}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: MyText(
            text: '$leftText',
            size: 14 * sp,
            weight: kfour,
            color: kblack,
          ),
        ),
        SizedBox(),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: MyText(
              align: TextAlign.right,
              text: '$rightText',
              size: 14 * sp,
              weight: ksix,
              color: kblack,
            ),
          ),
        ),
      ],
    );
  }
}
