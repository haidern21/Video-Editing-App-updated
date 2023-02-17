import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/Order/controllers/order_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../Utils/utils.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/quote_given_controller.dart';

class QuoteGivenView extends GetView<QuoteGivenController> {
  @override
  Widget build(BuildContext context) {
    OrderController orderController = Get.find();
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
            child: GestureDetector(
              onTap: () => Get.back(),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(
                  'assets/icons/backButton.svg',
                ),
              ),
            ),
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
                        child: Obx(
                          () => buildProjectTitleContainer(height, width, sp,
                              totalVideos: orderController.selectedOrder.value!
                                      .quoteVideos!.isNotEmpty
                                  ? orderController
                                      .selectedOrder.value!.quoteVideos!.length
                                      .toString()
                                  : 0.toString(),
                              title: orderController
                                      .selectedOrder.value?.projectTitle ??
                                  '',
                              status:
                                  orderController.selectedOrder.value?.status ??
                                      '',
                              price: orderController
                                      .selectedOrder.value?.quotePrice ??
                                  ''),
                        )),
                    SizedBox(height: height * 0.001),
                    GetBuilder<QuoteGivenController>(builder: (controller) {
                      return Visibility(
                        visible: controller.visibleContainer.value,
                        child: Container(
                          padding: EdgeInsets.only(
                            top: height * 0.024,
                            left: width * 0.05,
                            right: width * 0.05,
                            bottom: height * 0.024,
                          ),
                          margin: EdgeInsets.only(
                            left: width * 0.049,
                            right: width * 0.049,
                            top: height * 0.028,
                          ),
                          width: width,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    offset: const Offset(0, 4),
                                    blurRadius: 15.0,
                                    spreadRadius: 0,
                                    color: const Color(0xff000000)
                                        .withOpacity(0.04))
                              ]),
                          child: Column(
                            children: [
                              MyText(
                                text: "Your Quote",
                                size: 14 * sp,
                                weight: ksix,
                                color: kgrey8,
                              ),
                              SizedBox(height: height * 0.01),
                              MyText(
                                text: r"$145.00",
                                size: 20 * sp,
                                weight: ksix,
                                color: kprimaryColor,
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: height * 0.001),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                      ),
                      child: Column(
                        children: [
                          ...List.generate(
                              orderController.selectedOrder.value!.quoteVideos!
                                      .isNotEmpty
                                  ? orderController
                                      .selectedOrder.value!.quoteVideos!.length
                                  : 0,
                              (index) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildDesciptionContainer(
                                          height, width, sp,
                                          projectNumber: '${index + 1}',
                                          description: orderController
                                                  .selectedOrder
                                                  .value!
                                                  .quoteVideos?[index]
                                                  .details ??
                                              '',
                                          duration: orderController
                                                  .selectedOrder
                                                  .value!
                                                  .quoteVideos?[index]
                                                  .numberOfMinutes
                                                  .toString() ??
                                              '',
                                          driveLink: orderController
                                                  .selectedOrder
                                                  .value!
                                                  .quoteVideos?[index]
                                                  .googleDriveLink ??
                                              ''),
                                      SizedBox(height: height * 0.013),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: width * 0.062),
                                        child: MyText(
                                          text:
                                              "What sizes would you like your videos",
                                          size: 16 * sp,
                                          color: const Color(0xff000000),
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
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .verticalSize ==
                                                    true
                                                ? buildCheck(sp,
                                                    text: 'Vertical')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .horizontalSize ==
                                                    true
                                                ? buildCheck(sp,
                                                    text: 'Horizontal')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .squareSize ==
                                                    true
                                                ? buildCheck(sp, text: 'Square')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
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
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .colorGrading ==
                                                    true
                                                ? buildCheck(sp,
                                                    text: 'Colour Grading')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .animation ==
                                                    true
                                                ? buildCheck(sp,
                                                    text: 'Animations')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .customSubtitle ==
                                                    true
                                                ? buildCheck(sp,
                                                    text: 'Custom Subtitles')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .specialEffectOrVfx ==
                                                    true
                                                ? buildCheck(sp,
                                                    text:
                                                        'Special effects/ VFX')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .copyrightFreeMusic ==
                                                    true
                                                ? buildCheck(sp,
                                                    text:
                                                        'Copyright Free Music')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
                                                        .quoteVideos![index]
                                                        .transitions ==
                                                    true
                                                ? buildCheck(sp,
                                                    text: 'Transitions')
                                                : const SizedBox(
                                                    height: 0,
                                                  ),
                                            orderController
                                                        .selectedOrder
                                                        .value!
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
                          // GetBuilder<QuoteGivenController>(
                          //     builder: (controller) {
                          //   return Visibility(
                          //     visible: controller.visibleContainer.value,
                          //     child: Container(
                          //       padding: const EdgeInsets.all(10),
                          //       color: const Color(0xffF9F9FB),
                          //       child: Row(
                          //         children: [
                          //           Expanded(
                          //             child: SizedBox(
                          //               height: height * 0.06,
                          //               child: ElevatedButton(
                          //                 style: ElevatedButton.styleFrom(
                          //                   backgroundColor: kwhite,
                          //                   shape: RoundedRectangleBorder(
                          //                     side: const BorderSide(
                          //                         color: kcancel),
                          //                     borderRadius:
                          //                         BorderRadius.circular(30.0),
                          //                   ),
                          //                 ),
                          //                 onPressed: () {
                          //                   controller.quoteRejected(
                          //                       orderController
                          //                               .selectedOrder.id ??
                          //                           0);
                          //                 },
                          //                 child: MyText(
                          //                   text: 'Reject',
                          //                   color: kcancel,
                          //                   size: 14 * sp,
                          //                   weight: kfive,
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //           SizedBox(width: width * 0.02),
                          //           Expanded(
                          //             child: SizedBox(
                          //               height: height * 0.06,
                          //               child: MyButton(
                          //                 text: 'Accept',
                          //                 onPress: () {
                          //                   controller.quoteAccepted(
                          //                       orderController
                          //                               .selectedOrder.id ??
                          //                           0);
                          //                 },
                          //               ),
                          //             ),
                          //           )
                          //         ],
                          //       ),
                          //     ),
                          //   );
                          // })
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                color: const Color(0xffF9F9FB),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: height * 0.06,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kwhite,
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(color: kcancel),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          onPressed: () async {
                            await controller.quoteRejected(
                                orderController.selectedOrder.value!.id ?? 0);
                            await orderController.getOrderModel(
                                orderController.selectedOrder.value?.id ?? 0);
                            await orderController.fetchOrdersList();
                          },
                          child: MyText(
                            text: 'Reject',
                            color: kcancel,
                            size: 14 * sp,
                            weight: kfive,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.06,
                        child: MyButton(
                          text: 'Accept',
                          onPress: () async {
                            await controller.quoteAccepted(
                                orderController.selectedOrder.value!.id ?? 0);
                            await orderController.getOrderModel(
                                orderController.selectedOrder.value?.id ?? 0);
                            await orderController.fetchOrdersList();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildCheck(double sp, {required String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GlobalListTileItem(),
        const SizedBox(width: Checkbox.width * 0.3),
        MyText(
          text: '$text',
          size: 14 * sp,
          weight: kfour,
          color: const Color(0xff000000),
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
      required String totalVideos,
      required String price}) {
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
            rightText: '\$$price',
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
                    color: kcomplete.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: MyText(
                      text: status,
                      size: 10 * sp,
                      weight: kfour,
                      color: kcomplete,
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
        const SizedBox(),
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
