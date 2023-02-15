import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../controllers/payment_and_deposit_controller.dart';

PaymentAndDepositController _controller =
    Get.put(PaymentAndDepositController());

AccountsTabBar(double width, double height, double sp) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: width / 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: height * 0.05),
        MyText(
          text: "Total Balance",
          size: 14 * sp,
          weight: kfour,
          color: kgre7,
        ),
        SizedBox(height: height * 0.02),
        MyText(
          text: r"$0.00",
          size: 32 * sp,
          weight: kseven,
          color: kgrey8,
        ),
        SizedBox(height: height * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              text: "Cards",
              size: 14 * sp,
              weight: ksix,
              color: Color(0xff212936),
            ),
            GestureDetector(
              onTap: () => Get.toNamed(Routes.ADD_NEW_CARD),
              child: MyText(
                text: "Add new card",
                size: 14 * sp,
                weight: ksix,
                color: kprimaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),
        Container(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.024,
              horizontal: width / 30,
            ),
            width: width,
            decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/pay.svg'),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MyText(
                                text: 'Apple Pay',
                                size: 14 * sp,
                                weight: ksix,
                                color: Color(0xff344054),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.01),
                          MyText(
                            text: 'Default',
                            size: 14 * sp,
                            weight: kfour,
                            color: Color(0xff667085),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Obx(
                    () => SizedBox(
                      height: height * 0.03,
                      child: Radio(
                        activeColor: kprimaryColor,
                        focusColor: kprimaryColor,
                        hoverColor: kprimaryColor,
                        value: 'apple',
                        groupValue: _controller.selectedShipment.value,
                        onChanged: (value) {
                          _controller.onChange(value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(height: height * 0.02),
        Container(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.024,
              horizontal: width / 30,
            ),
            width: width,
            decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/icons/visa.svg'),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              MyText(
                                text: 'Visa ending in 1234',
                                size: 14 * sp,
                                weight: ksix,
                                color: Color(0xff344054),
                              ),
                            ],
                          ),
                          SizedBox(height: height * 0.005),
                          MyText(
                            text: 'Expiry 06/2024',
                            size: 14 * sp,
                            weight: kfour,
                            color: Color(0xff667085),
                          ),
                          SizedBox(height: height * 0.01),
                          Row(
                            children: [
                              MyText(
                                text: 'Set as default',
                                size: 14 * sp,
                                weight: kfour,
                                color: Color(0xff667085),
                              ),
                              SizedBox(width: width * 0.02),
                              MyText(
                                text: 'Edit',
                                size: 14 * sp,
                                weight: ksix,
                                color: kprimaryColor,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Obx(
                    () => SizedBox(
                      height: height * 0.03,
                      child: Radio(
                        activeColor: kprimaryColor,
                        focusColor: kprimaryColor,
                        hoverColor: kprimaryColor,
                        value: 'visa',
                        groupValue: _controller.selectedShipment.value,
                        onChanged: (value) {
                          _controller.onChange(value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
        SizedBox(height: height * 0.02),
        Container(
            padding: EdgeInsets.symmetric(
              vertical: height * 0.024,
              horizontal: width / 30,
            ),
            width: width,
            decoration: BoxDecoration(
              color: kwhite,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/masterCardFrame.svg',
                      ),
                      SizedBox(width: width * 0.02),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: MyText(
                                    text: 'Master ending in 1234',
                                    size: 14 * sp,
                                    weight: ksix,
                                    color: Color(0xff344054),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.005),
                            MyText(
                              text: 'Expiry 06/2024',
                              size: 14 * sp,
                              weight: kfour,
                              color: Color(0xff667085),
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              children: [
                                MyText(
                                  text: 'Set as default',
                                  size: 14 * sp,
                                  weight: kfour,
                                  color: Color(0xff667085),
                                ),
                                SizedBox(width: width * 0.02),
                                MyText(
                                  text: 'Edit',
                                  size: 14 * sp,
                                  weight: ksix,
                                  color: kprimaryColor,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FittedBox(
                  child: Obx(
                    () => SizedBox(
                      height: height * 0.03,
                      child: Radio(
                        activeColor: kprimaryColor,
                        focusColor: kprimaryColor,
                        hoverColor: kprimaryColor,
                        value: 'master',
                        groupValue: _controller.selectedShipment.value,
                        onChanged: (value) {
                          _controller.onChange(value);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}
