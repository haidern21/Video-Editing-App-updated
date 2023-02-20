import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  @override
  Widget build(BuildContext context) {
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF9F9FB),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: kblack,
              size: 16,
            ),
          ),
          title: MyText(
            text: 'Notifications',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          centerTitle: true,
        ),
        // body: Padding(
        //   padding: EdgeInsets.symmetric(horizontal: width / 39),
        //   child: Column(
        //     children: [
        //       Theme(
        //         data: Theme.of(context)
        //             .copyWith(dividerColor: Colors.transparent),
        //         child: Column(
        //           children: [
        //             ...List.generate(
        //               20,
        //               (index) => ExpansionTile(
        //                 childrenPadding: EdgeInsets.zero,
        //                 title: MyText(
        //                   text: 'Notification Title',
        //                   size: 14 * sp,
        //                   weight: ksix,
        //                   color: const Color(0xff31383C),
        //                 ),
        //                 subtitle: MyText(
        //                   text: 'Here’s notification text.',
        //                   size: 12 * sp,
        //                   weight: kfour,
        //                   color: const Color(0xff62686B),
        //                 ),
        //                 trailing: MyText(
        //                   text: '34m ago',
        //                   size: 12 * sp,
        //                   weight: kfour,
        //                   color: const Color(0xffB8B9B9),
        //                 ),
        //                 leading: Image.asset(
        //                   'assets/icons/rounded.png',
        //                 ),
        //                 // children: [
        //                 //   Row(
        //                 //     mainAxisAlignment: MainAxisAlignment.center,
        //                 //     children: [
        //                 //       SizedBox(
        //                 //         height: height * 0.06,
        //                 //         width: width * 0.3,
        //                 //         child: MyButton(
        //                 //           text: 'Accept',
        //                 //           onPress: () {
        //                 //             Get.toNamed(Routes.EDITOR_REWARD);
        //                 //           },
        //                 //         ),
        //                 //       ),
        //                 //       SizedBox(width: width * 0.02),
        //                 //       SizedBox(
        //                 //         height: height * 0.06,
        //                 //         width: width * 0.3,
        //                 //         child: OutlinedButton(
        //                 //           onPressed: () {},
        //                 //           style: OutlinedButton.styleFrom(
        //                 //             side: const BorderSide(color: kcancel),
        //                 //             shape: const StadiumBorder(),
        //                 //           ),
        //                 //           child: MyText(
        //                 //             text: 'Deny',
        //                 //             size: 14 * sp,
        //                 //             weight: kfive,
        //                 //             color: kcancel,
        //                 //           ),
        //                 //         ),
        //                 //       )
        //                 //     ],
        //                 //   ),
        //                 // ],
        //               ),
        //             ),
        //             SizedBox(height: height * 0.02)
        //           ],
        //         ),
        //       ),
        //     ],
        //   ),
        // )
        body: RefreshIndicator(
          onRefresh: () async {
            controller.fetchNotificationsList();
          },
          child: Obx(
                () => controller.showLoader.value == false
                ? controller.notifications.isNotEmpty
                ? ListView.builder(
                itemCount: controller.notifications.length,
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    childrenPadding: EdgeInsets.zero,
                    title: MyText(
                      text: controller.notifications[index].title ?? '',
                      size: 14 * sp,
                      weight: ksix,
                      color: const Color(0xff31383C),
                    ),
                    subtitle: MyText(
                      text:
                      controller.notifications[index].message ?? '',
                      size: 12 * sp,
                      weight: kfour,
                      color: const Color(0xff62686B),
                    ),
                    trailing: MyText(
                      text: controller.notifications[index].createdAt?.substring(0,10) ?? '',
                      size: 12 * sp,
                      weight: kfour,
                      color: const Color(0xffB8B9B9),
                    ),
                    leading: Image.asset(
                      'assets/icons/rounded.png',
                    ),
                  );
                })
                : const Center(
              child: Text('No available notifications'),
            )
                : const Center(child: CircularProgressIndicator()),
          ),
        ),
      ),
    );
  }
}
