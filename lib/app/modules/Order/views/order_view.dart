import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/InProgress/controllers/in_progress_controller.dart';

import 'package:video_editing_app/app/modules/Order/views/progress_row.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'container_widget.dart';
import 'order_app_bar.dart';
import '../controllers/order_controller.dart';

OrderController orderController = Get.put(OrderController());
InProgressController inProgressController = Get.find();
// final pages = [ProjectDetailsView(), InProgressView(), CompletedView()];
double width = Get.width;
double height = Get.height;
final sp = Get.textScaleFactor;
var fourStyle = TextStyle(
  color: kgre7,
  fontSize: 14 * sp,
  fontWeight: kfour,
  fontFamily: 'WorkSans',
);
var sixStyle = TextStyle(
  color: kgre7,
  fontSize: 14 * sp,
  fontWeight: ksix,
  fontFamily: 'WorkSans',
);

class OrderView extends GetView {
  OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF9F9FB),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height * 0.02),
            OrderAppBar(height: height, width: width, sp: sp),
            SizedBox(height: height * 0.034),
            ProgressRow(width, height, sp),
            SizedBox(height: height * 0.024),
            Obx(() => controller.selectedIndex.value == 0
                ? allOrders()
                : controller.selectedIndex.value == 1
                    ? pendingOrders()
                    : controller.selectedIndex.value == 2
                        ? quotedGivenOrders()
                        : controller.selectedIndex.value == 3
                            ? inProgressOrders()
                            : completedOrders()),
          ],
        ),
      ),
    );
  }

  Widget allOrders() {
    return FutureBuilder(builder: (context, snap) {
      return Obx(() => controller.showLoader.value == false
          ? controller.orders.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.orders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await controller
                            .getOrderModel(controller.orders[index].id ?? 0);
                        if (controller.orders[index].getStatusDisplay ==
                            'In Progress') {
                          inProgressController.fetchQuoteCommunicationsList(
                              controller.orders[index].id ?? 0);
                        }
                        controller.orders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.PROJECT_DETAILS)
                            : controller.orders[index].getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.IN_PROGRESS)
                                : controller.orders[index].getStatusDisplay ==
                                        'Quote Given'
                                    ? Get.toNamed(Routes.QUOTE_GIVEN)
                                    : Get.toNamed(Routes.COMPLETED);
                      },
                      child: buildProjectTitle(width, height, sp,
                          richText: index != 1
                              ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller
                                                .orders[index].createdAt ??
                                            '',
                                        style: TextStyle(
                                          color: kgre7,
                                          fontSize: 14 * sp,
                                          fontWeight: kfour,
                                          fontFamily: 'WorkSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Project Timeline :   ',
                                          style: fourStyle),
                                      TextSpan(
                                          text: '10:44:20', style: sixStyle),
                                    ],
                                  ),
                                ),
                          status:
                              controller.orders[index].getStatusDisplay ?? '',
                          containerColor:
                              controller.orders[index].getStatusDisplay ==
                                      'Quote Pending'
                                  ? kwarning.withOpacity(0.10)
                                  : controller.orders[index].getStatusDisplay ==
                                          'In Progress'
                                      ? kinfo.withOpacity(0.10)
                                      : kcomplete.withOpacity(0.10),
                          containerTextColor:
                              controller.orders[index].getStatusDisplay ==
                                      'Quote Pending'
                                  ? kwarning
                                  : controller.orders[index].getStatusDisplay ==
                                          'In Progress'
                                      ? kinfo
                                      : kcomplete,
                          title: controller.orders[index].projectTitle ?? ''),
                    );
                  })
              : const Center(
                  child: Text('No Available Orders'),
                )
          : const Center(
              child: CircularProgressIndicator(),
            ));
    });
  }

  Widget pendingOrders() {
    return FutureBuilder(builder: (context, snap) {
      return Obx(() => controller.showLoader.value == false
          ? controller.pendingOrders.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.pendingOrders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await controller.getOrderModel(
                            controller.pendingOrders[index].id ?? 0);

                        controller.pendingOrders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.PROJECT_DETAILS)
                            : controller.pendingOrders[index]
                                        .getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.IN_PROGRESS)
                                : controller.pendingOrders[index]
                                            .getStatusDisplay ==
                                        'Quote Given'
                                    ? Get.toNamed(Routes.COMPLETED)
                                    : Get.toNamed(Routes.COMPLETED);
                      },
                      child: buildProjectTitle(width, height, sp,
                          richText: index != 1
                              ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.pendingOrders[index]
                                                .createdAt ??
                                            '',
                                        style: TextStyle(
                                          color: kgre7,
                                          fontSize: 14 * sp,
                                          fontWeight: kfour,
                                          fontFamily: 'WorkSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Project Timeline :   ',
                                          style: fourStyle),
                                      TextSpan(
                                          text: '10:44:20', style: sixStyle),
                                    ],
                                  ),
                                ),
                          status: controller
                                  .pendingOrders[index].getStatusDisplay ??
                              '',
                          containerColor: controller
                                      .pendingOrders[index].getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning.withOpacity(0.10)
                              : controller.pendingOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo.withOpacity(0.10)
                                  : kcomplete.withOpacity(0.10),
                          containerTextColor: controller
                                      .pendingOrders[index].getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning
                              : controller.pendingOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo
                                  : kcomplete,
                          title: controller.pendingOrders[index].projectTitle ??
                              ''),
                    );
                  })
              : const Center(
                  child: Text('No Pending Orders Available'),
                )
          : const Center(
              child: CircularProgressIndicator(),
            ));
    });
  }

  Widget inProgressOrders() {
    return FutureBuilder(builder: (context, snap) {
      return Obx(() => controller.showLoader.value == false
          ? controller.inProgressOrders.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.inProgressOrders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await controller.getOrderModel(
                            controller.inProgressOrders[index].id ?? 0);
                        if (controller
                                .inProgressOrders[index].getStatusDisplay ==
                            'In Progress') {
                          inProgressController.fetchQuoteCommunicationsList(
                              controller.inProgressOrders[index].id ?? 0);
                        }
                        controller.inProgressOrders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.PROJECT_DETAILS)
                            : controller.inProgressOrders[index]
                                        .getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.IN_PROGRESS)
                                : controller.inProgressOrders[index]
                                            .getStatusDisplay ==
                                        'Quote Given'
                                    ? Get.toNamed(Routes.COMPLETED)
                                    : Get.toNamed(Routes.COMPLETED);
                      },
                      child: buildProjectTitle(width, height, sp,
                          richText: index != 1
                              ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.inProgressOrders[index]
                                                .createdAt ??
                                            '',
                                        style: TextStyle(
                                          color: kgre7,
                                          fontSize: 14 * sp,
                                          fontWeight: kfour,
                                          fontFamily: 'WorkSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Project Timeline :   ',
                                          style: fourStyle),
                                      TextSpan(
                                          text: '10:44:20', style: sixStyle),
                                    ],
                                  ),
                                ),
                          status: controller
                                  .inProgressOrders[index].getStatusDisplay ??
                              '',
                          containerColor: controller.inProgressOrders[index]
                                      .getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning.withOpacity(0.10)
                              : controller.inProgressOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo.withOpacity(0.10)
                                  : kcomplete.withOpacity(0.10),
                          containerTextColor: controller.inProgressOrders[index]
                                      .getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning
                              : controller.inProgressOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo
                                  : kcomplete,
                          title:
                              controller.inProgressOrders[index].projectTitle ??
                                  ''),
                    );
                  })
              : const Center(
                  child: Text('No Available In Progress Orders'),
                )
          : const Center(
              child: CircularProgressIndicator(),
            ));
    });
  }

  Widget completedOrders() {
    return FutureBuilder(builder: (context, snap) {
      return Obx(() => controller.showLoader.value == false
          ? controller.completedOrders.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.completedOrders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await controller.getOrderModel(
                            controller.completedOrders[index].id ?? 0);
                        controller.completedOrders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.PROJECT_DETAILS)
                            : controller.completedOrders[index]
                                        .getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.IN_PROGRESS)
                                : controller.completedOrders[index]
                                            .getStatusDisplay ==
                                        'Quote Given'
                                    ? Get.toNamed(Routes.COMPLETED)
                                    : Get.toNamed(Routes.COMPLETED);
                      },
                      child: buildProjectTitle(width, height, sp,
                          richText: index != 1
                              ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller.completedOrders[index]
                                                .createdAt ??
                                            '',
                                        style: TextStyle(
                                          color: kgre7,
                                          fontSize: 14 * sp,
                                          fontWeight: kfour,
                                          fontFamily: 'WorkSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Project Timeline :   ',
                                          style: fourStyle),
                                      TextSpan(
                                          text: '10:44:20', style: sixStyle),
                                    ],
                                  ),
                                ),
                          status: controller
                                  .completedOrders[index].getStatusDisplay ??
                              '',
                          containerColor: controller.completedOrders[index]
                                      .getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning.withOpacity(0.10)
                              : controller.completedOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo.withOpacity(0.10)
                                  : kcomplete.withOpacity(0.10),
                          containerTextColor: controller.completedOrders[index]
                                      .getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning
                              : controller.completedOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo
                                  : kcomplete,
                          title:
                              controller.completedOrders[index].projectTitle ??
                                  ''),
                    );
                  })
              : const Center(
                  child: Text('No Pending Orders Available'),
                )
          : const Center(
              child: CircularProgressIndicator(),
            ));
    });
  }

  Widget quotedGivenOrders() {
    return FutureBuilder(builder: (context, snap) {
      return Obx(() => controller.showLoader.value == false
          ? controller.quotedGivenOrders.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: controller.quotedGivenOrders.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await controller.getOrderModel(
                            controller.quotedGivenOrders[index].id ?? 0);
                        controller.quotedGivenOrders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.PROJECT_DETAILS)
                            : controller.quotedGivenOrders[index]
                                        .getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.IN_PROGRESS)
                                : controller.quotedGivenOrders[index]
                                            .getStatusDisplay ==
                                        'Quote Given'
                                    ? Get.toNamed(Routes.COMPLETED)
                                    : Get.toNamed(Routes.COMPLETED);
                      },
                      child: buildProjectTitle(width, height, sp,
                          richText: index != 1
                              ? RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: controller
                                                .quotedGivenOrders[index]
                                                .createdAt ??
                                            '',
                                        style: TextStyle(
                                          color: kgre7,
                                          fontSize: 14 * sp,
                                          fontWeight: kfour,
                                          fontFamily: 'WorkSans',
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                          text: 'Project Timeline :   ',
                                          style: fourStyle),
                                      TextSpan(
                                          text: '10:44:20', style: sixStyle),
                                    ],
                                  ),
                                ),
                          status: controller
                                  .quotedGivenOrders[index].getStatusDisplay ??
                              '',
                          containerColor: controller.quotedGivenOrders[index]
                                      .getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning.withOpacity(0.10)
                              : controller.quotedGivenOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo.withOpacity(0.10)
                                  : kcomplete.withOpacity(0.10),
                          containerTextColor: controller
                                      .quotedGivenOrders[index]
                                      .getStatusDisplay ==
                                  'Quote Pending'
                              ? kwarning
                              : controller.quotedGivenOrders[index]
                                          .getStatusDisplay ==
                                      'In Progress'
                                  ? kinfo
                                  : kcomplete,
                          title: controller
                                  .quotedGivenOrders[index].projectTitle ??
                              ''),
                    );
                  })
              : const Center(
                  child: Text('No Quote Given Orders Available'),
                )
          : const Center(
              child: CircularProgressIndicator(),
            ));
    });
  }
}
