import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/EditorInProgress/controllers/editor_in_progress_controller.dart';
import '../../Order/views/container_widget.dart';
import '../controllers/editor_orders_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import '../../../../widgets/my_text.dart';

EditorOrdersController controller = Get.put(EditorOrdersController());
EditorInProgressController editorInProgressController = Get.find();
List<String> _status = ['All', 'In progress', 'Completed'];
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
double width = Get.width;
double height = Get.height;
final sp = Get.textScaleFactor;

class EditorOrdersView extends GetView {
  @override
  Widget build(BuildContext context) {
    // controller.selectedIndex.value;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      backgroundColor: const Color(0xffF9F9FB),
      body: RefreshIndicator(
        onRefresh: ()async{
          controller.fetchOrdersList();
        },
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: height * 0.02),
                  Container(
                    height: height / 14,
                    width: width,
                    padding: EdgeInsets.symmetric(horizontal: width * 0.053),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/icons/smallLogo.png',
                          height: height * 0.060,
                        ),
                        GestureDetector(
                          onTap: () => Get.toNamed(Routes.EDITOR_NOTIFICATION),
                          child: SvgPicture.asset('assets/icons/notification.svg'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.034),
                  GetBuilder<EditorOrdersController>(
                    init: controller,
                    // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
                    builder: (controller) => Padding(
                      padding: EdgeInsets.only(left: width * 0.055),
                      child: SizedBox(
                        height: height * 0.05,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...List.generate(
                              _status.length,
                              (index) => GestureDetector(
                                onTap: () {
                                  controller.changeColor(index);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: width * 0.01),
                                  padding:
                                      EdgeInsets.symmetric(horizontal: width * 0.04),
                                  height: height * 0.05,
                                  decoration: BoxDecoration(
                                    color: controller.selectedIndex.value == index
                                        ? kprimaryColor
                                        : Color(0xffF9F9FB),
                                    border: Border.all(
                                      color: controller.selectedIndex.value == index
                                          ? kprimaryColor
                                          : kgrey2,
                                    ),
                                    borderRadius: BorderRadius.circular(38),
                                  ),
                                  child: Center(
                                    child: MyText(
                                      text: _status[index],
                                      size: 12 * sp,
                                      weight: kfour,
                                      color: controller.selectedIndex.value == index
                                          ? kwhite
                                          : kgrey8,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: height * 0.025),
                  Obx(() => controller.selectedIndex.value == 0
                      ? allOrders()
                      : controller.selectedIndex.value == 1
                          ? inProgressOrders()
                          : completedOrders()),
                ],
              ),
            ),
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
                        await editorInProgressController
                            .fetchQuoteCommunicationsList(
                            controller.orders[index].id ?? 0);
                        controller.orders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.EDITOR_PROJECT_DETAILS)
                            : controller.orders[index].getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.EDITOR_IN_PROGRESS)
                                : Get.toNamed(Routes.ORDER_COMPLETED);
                      },
                      child: buildProjectTitle(
                        width,
                        height,
                        sp,
                        richText:  RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          controller.orders[index].createdAt ??
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
                              ),
                        status: controller.orders[index].getStatusDisplay ?? '',
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
                        title: controller.orders[index].projectTitle ?? '',
                      ),
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
                        await controller
                            .getOrderModel(controller.inProgressOrders[index].id ?? 0);
                        if (controller.inProgressOrders[index].getStatusDisplay == 'In Progress') {
                          editorInProgressController
                              .fetchQuoteCommunicationsList(
                              controller.inProgressOrders[index].id ?? 0);
                        }
                        controller.inProgressOrders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.EDITOR_PROJECT_DETAILS)
                            : controller.inProgressOrders[index].getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.EDITOR_IN_PROGRESS)
                                : Get.toNamed(Routes.ORDER_COMPLETED);
                      },
                      child: buildProjectTitle(width, height, sp,
                          richText:RichText(
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
                        await controller
                            .getOrderModel(controller.orders[index].id ?? 0);
                        controller.orders[index].getStatusDisplay ==
                                'Quote Pending'
                            ? Get.toNamed(Routes.EDITOR_PROJECT_DETAILS)
                            : controller.orders[index].getStatusDisplay ==
                                    'In Progress'
                                ? Get.toNamed(Routes.EDITOR_IN_PROGRESS)
                                : Get.toNamed(Routes.ORDER_COMPLETED);
                      },
                      child: buildProjectTitle(width, height, sp,
                          richText: RichText(
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
}
