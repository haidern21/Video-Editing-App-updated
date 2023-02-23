import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/Order/controllers/order_controller.dart';
import 'package:video_editing_app/app/modules/QuoteGiven/controllers/quote_given_controller.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/add_new_card_controller.dart';

class AddNewCardView extends GetView<AddNewCardController> {
  const AddNewCardView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    OrderController orderController = Get.find();
    QuoteGivenController quoteGivenController = Get.find();

    return SafeArea(
      child: Scaffold(
          backgroundColor: kwhite,
          appBar: AppBar(
            backgroundColor: kwhite,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: backButton(),
            ),
            title: MyText(
              text: "Add New Card",
              size: 16 * sp,
              color: kblack,
              weight: ksix,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width / 20),
            child: SingleChildScrollView(
              child: Form(
                key: controller.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.024),
                    buildTitle(sp, title: 'Card Number'),
                    SizedBox(height: height * 0.03),
                    buildLoginFields(sp,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:
                              SvgPicture.asset('assets/icons/masterCrad.svg'),
                        ),
                        hinttext: '1234 4568 4557 4789',
                        controller: controller.cardnumberController,
                        validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter card Number';
                      } else {
                        DoNothingAction();
                      }
                    }),
                    SizedBox(height: height * 0.009),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTitle(sp, title: 'Expiry Date'),
                              SizedBox(height: height * 0.009),
                              TextField(
                                controller: controller.expiry,
                                readOnly: true,
                                style: TextStyle(
                                  fontSize: 12 * sp,
                                  fontWeight: kfour,
                                  color: kblack,
                                ),
                                onTap: () async {
                                  FocusScope.of(context).unfocus();
                                  var date = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1900),
                                    lastDate: DateTime.now(),
                                    builder: (context, child) {
                                      return Theme(
                                        data: ThemeData.light().copyWith(
                                          primaryColor: kprimaryColor,
                                          accentColor: kprimaryColor,
                                          colorScheme: const ColorScheme.light(
                                            primary: kprimaryColor,
                                          ),
                                        ),
                                        child: child!,
                                      );
                                    },
                                  );
                                  controller.dobChanged(date);
                                },
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.fromLTRB(12, 16, 12, 16),
                                  hintText: 'Expiry Date',
                                  enabledBorder: enabledborder,
                                  focusedBorder: focusedborder,
                                  border: enabledborder,
                                  hintStyle: TextStyle(
                                    fontSize: 12 * sp,
                                    fontWeight: kfour,
                                    color: kgrey3,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: width / 27),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTitle(sp, title: 'CVC'),
                              SizedBox(height: height * 0.009),
                              buildLoginFields(sp,
                                  hinttext: '123',
                                  controller: controller.cvvnumberController,
                                  validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter 3 digit cvc';
                                } else {
                                  DoNothingAction();
                                }
                              }),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.03),
                    buildTitle(sp, title: 'Card Holder’s Name'),
                    SizedBox(height: height * 0.009),
                    buildLoginFields(
                      sp,
                      hinttext: 'DG Nurunnabi',
                      // controller: controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter your name';
                        } else {
                          DoNothingAction();
                        }
                      },
                    ),
                    SizedBox(height: height * 0.024),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Obx(
                          () => SizedBox(
                            width: width * 0.08,
                            child: Checkbox(
                              side: const BorderSide(color: kprimaryColor),
                              activeColor: kprimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              value: controller.checkbool.value,
                              onChanged: (value) {
                                controller.checkbool.value =
                                    !controller.checkbool.value;
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: width * 0.001),
                        MyText(
                          text: "Save Card Details",
                          size: 14 * sp,
                          color: kgrey8,
                          weight: kfour,
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.044),
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
                    SizedBox(height: height * 0.036),
                    Container(
                      height: height * 0.072,
                      width: width,
                      decoration: BoxDecoration(
                        color: kprimaryColor,
                        borderRadius: BorderRadius.circular(55),
                      ),
                      child: Obx(
                        () => controller.showLoader.value == false
                            ? MyButton(
                                text: 'Payment',
                                onPress: () async {
                                  try {
                                    controller.showLoader.value = true;
                                    await quoteGivenController.quoteAccepted(
                                        orderController
                                                .selectedOrder.value!.id ??
                                            0);
                                    await orderController.getOrderModel(
                                        orderController
                                                .selectedOrder.value?.id ??
                                            0);
                                    await orderController.fetchOrdersList();
                                    Get.toNamed(Routes.FIND_AN_EDITOR);
                                    controller.showLoader.value = false;
                                  } catch (e) {
                                    controller.showLoader.value = false;
                                    Get.snackbar('Payment issue',
                                        'Error in payment. try later');
                                  }
                                },
                              )
                            : const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

MyText buildTitle(double sp, {required String title}) {
  return MyText(
    text: title,
    size: 12 * sp,
    weight: kfour,
    color: kgrey8,
  );
}

LoginFields buildLoginFields(
  double sp, {
  var suffixIcon,
  required String hinttext,
  TextEditingController? controller,
  required var validator,
  bool obSecure = false, TextInputType? textInputType,bool? enabled=true
}) {
  return LoginFields(
    suffixicon: suffixIcon,
    enabled: enabled,
    contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
    fieldValidator: validator,
    obSecure: obSecure,
    formcontroller: controller,
    keyboardType: textInputType,
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
    border: enabledborder,
  );
}
