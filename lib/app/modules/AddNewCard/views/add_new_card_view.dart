import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/add_new_card_controller.dart';

class AddNewCardView extends GetView<AddNewCardController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

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
                                ;
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
                        text: r"Total: $145",
                        size: 20 * sp,
                        weight: kfive,
                        color: const Color(0xff000000),
                      ),
                    ),
                    SizedBox(height: height * 0.036),
                    Container(
                      height: height * 0.072,
                      width: width,
                      child: MyButton(
                        text: 'Payment',
                        onPress: () {
                          Get.back();
                        },
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
  bool obSecure = false,
}) {
  return LoginFields(
    suffixicon: suffixIcon,
    contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
    fieldValidator: validator,
    obSecure: obSecure,
    formcontroller: controller,
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
