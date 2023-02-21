import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/my_text.dart';
import '../../Order/controllers/order_controller.dart';
import '../../QuoteGiven/controllers/quote_given_controller.dart';
import '../controllers/check_out_controller.dart';

CheckOutController _controller = Get.put(CheckOutController());

class CheckOutView extends GetView<CheckOutController> {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    OrderController orderController = Get.find();
    QuoteGivenController quoteGivenController = Get.find();
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
            text: "Checkout",
            size: 16 * sp,
            color: kblack,
            weight: ksix,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.024),
              MyText(
                text: "Select Payment Methods",
                size: 20 * sp,
                weight: kfive,
                color: kgrey8,
              ),
              SizedBox(height: height * 0.036),
              GestureDetector(
                onTap: () {
                  _controller.onChange('standard ');
                  Get.toNamed(Routes.ADD_NEW_CARD);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: width / 20),
                  height: height / 13,
                  width: width,
                  decoration: BoxDecoration(
                    border: Border.all(color: kgrey3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Obx(
                            () => SizedBox(
                              width: width / 20,
                              child: Radio(
                                  activeColor: kprimaryColor,
                                  focusColor: kprimaryColor,
                                  hoverColor: kprimaryColor,
                                  value: 'standard ',
                                  groupValue:
                                      _controller.selectedShipment.value,
                                  onChanged: (value) {
                                    _controller.onChange(value);
                                  }),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          SvgPicture.asset('assets/icons/card.svg'),
                          SizedBox(width: width * 0.01),
                          FittedBox(
                            child: MyText(
                              text: "Credit/Debit Card",
                              size: 14 * sp,
                              weight: kfive,
                              color: kgrey8,
                            ),
                          ),
                        ],
                      ),
                      SvgPicture.asset('assets/icons/masterCrad.svg'),
                    ],
                  ),
                ),
              ),
              // SizedBox(height: height * 0.013),
              // GestureDetector(
              //   onTap: () => Get.toNamed(Routes.ADD_NEW_CARD),
              //   child: Align(
              //     alignment: Alignment.bottomRight,
              //     child: MyText(
              //       decoration: TextDecoration.underline,
              //       text: "Change card",
              //       size: 14 * sp,
              //       weight: kfive,
              //       color: kgrey8,
              //     ),
              //   ),
              // ),
              SizedBox(height: height * 0.036),
              GestureDetector(
                onTap: () async {
                  try {
                    controller.showLoader.value = true;
                    _controller.onChange('standard shipping');
                    await quoteGivenController.quoteAccepted(
                        orderController.selectedOrder.value!.id ?? 0);
                    await orderController.getOrderModel(
                        orderController.selectedOrder.value?.id ?? 0);
                    await orderController.fetchOrdersList();
                    Get.toNamed(Routes.FIND_AN_EDITOR);
                    controller.showLoader.value = false;
                  } catch (e) {
                    controller.showLoader.value = false;
                    Get.snackbar('Error', 'Error in making payment. try later');
                  }
                },
                child: Obx(
                  () => controller.showLoader.value == false
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: width / 20),
                          height: height / 13,
                          width: width,
                          decoration: BoxDecoration(
                            border: Border.all(color: kgrey3),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(
                                () => SizedBox(
                                  width: width / 20,
                                  child: Radio(
                                      activeColor: kprimaryColor,
                                      focusColor: kprimaryColor,
                                      hoverColor: kprimaryColor,
                                      value: 'standard shipping',
                                      groupValue:
                                          _controller.selectedShipment.value,
                                      onChanged: (value) {
                                        _controller.onChange(value);
                                      }),
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              SvgPicture.asset('assets/icons/paypal.svg'),
                            ],
                          ),
                        )
                      : const Center(
                          child: CircularProgressIndicator(
                            color: kprimaryColor,
                          ),
                        ),
                ),
              ),
              SizedBox(height: height * 0.044),
              Center(
                child: MyText(
                  text:
                      'Total :\$ ${orderController.selectedOrder.value?.quotePrice ?? ''}',
                  size: 20 * sp,
                  weight: kfive,
                  color: const Color(0xff000000),
                ),
              ),
              // SizedBox(height: height * 0.036),
              // SizedBox(
              //   height: height * 0.072,
              //   width: width,
              //   child: MyButton(
              //     text: 'Payment',
              //     onPress: () {
              //       Get.toNamed(Routes.FIND_AN_EDITOR);
              //     },
              //   ),
              // ),
              SizedBox(height: height * 0.036),
              Center(
                child: MyText(
                  height: 1.2,
                  align: TextAlign.center,
                  text: "When you spents up to \$50 you will get a rewards box",
                  size: 14 * sp,
                  weight: kfive,
                  color: kgrey8,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
