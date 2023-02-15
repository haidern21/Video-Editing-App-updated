import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/order_controller.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import '../../../../widgets/my_text.dart';

List<String> _status = ['All', 'Pending','Quote Given', 'In progress', 'Completed'];

OrderController controller = Get.find();

ProgressRow(double width, double height, double sp) {
  return GetBuilder<OrderController>(
    init: OrderController(),
    // You can initialize your controller here the first time. Don't use init in your other GetBuilders of same controller
    builder: (_) => Padding(
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
                  padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                  height: height * 0.05,
                  decoration: BoxDecoration(
                    color: controller.selectedIndex == index
                        ? kprimaryColor
                        : Color(0xffF9F9FB),
                    border: Border.all(
                      color: controller.selectedIndex == index
                          ? kprimaryColor
                          : kgrey2,
                    ),
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Center(
                    child: MyText(
                      text: '${_status[index]}',
                      size: 12 * sp,
                      weight: kfour,
                      color: controller.selectedIndex == index ? kwhite : kgrey8,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
