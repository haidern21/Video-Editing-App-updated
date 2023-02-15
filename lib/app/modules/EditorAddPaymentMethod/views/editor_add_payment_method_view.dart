import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/back_button.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/login_field.dart';
import '../controllers/editor_add_payment_method_controller.dart';

EditorAddPaymentMethodController controller =
    Get.put(EditorAddPaymentMethodController());

class EditorAddPaymentMethodView
    extends GetView<EditorAddPaymentMethodController> {
  final List<String> banks = [
    'Bangladesh Bank',
    'Pakistan Bank',
  ];

  List<String> titles = ['Bank', 'Paypal', 'Wise', 'Wise'];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF9F9FB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF9F9FB),
          leading: backButton(),
          title: MyText(
            text: 'Add payment method',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.025),
              GetBuilder<EditorAddPaymentMethodController>(
                  builder: (controller) {
                return Padding(
                  padding: EdgeInsets.only(left: width / 20),
                  child: SizedBox(
                    height: height * 0.06,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...List.generate(
                            titles.length,
                            (index) => GestureDetector(
                                  onTap: () {
                                    controller.changeColor(index);
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: width * 0.04),
                                    height: height * 0.06,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: width / 20,
                                    ),
                                    decoration: BoxDecoration(
                                      color: controller.selectedIndex == index
                                          ? kprimaryColor
                                          : kwhite,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                          color:
                                              controller.selectedIndex == index
                                                  ? kprimaryColor
                                                  : kgrey3),
                                    ),
                                    child: Center(
                                      child: MyText(
                                        text: '${titles[index]}',
                                        size: 14,
                                        color: controller.selectedIndex == index
                                            ? kwhite
                                            : kblack,
                                        weight: kfive,
                                      ),
                                    ),
                                  ),
                                ))
                      ],
                    ),
                  ),
                );
              }),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.05),
                    buildTitle(title: 'Select Bank', sp),
                    SizedBox(height: height * 0.012),
                    DropdownButtonFormField2(
                      style: TextStyle(
                        fontSize: 12 * sp,
                        fontWeight: kfour,
                        color: kblack,
                        fontFamily: 'WorkSans',
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: kwhite,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: enabledborder,
                        focusedBorder: focusedborder,
                        enabledBorder: enabledborder,
                      ),
                      isExpanded: true,
                      hint: Text(
                        'Select bank',
                        style: TextStyle(
                          fontSize: 12 * sp,
                          fontWeight: kfour,
                          color: kblack,
                          fontFamily: 'WorkSans',
                        ),
                      ),
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      buttonHeight: 50,
                      buttonPadding:
                          EdgeInsets.only(left: width / 30, right: 10),
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      items: banks
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 12 * sp,
                                    fontWeight: kfour,
                                    color: kblack,
                                    fontFamily: 'WorkSans',
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Select bank';
                        }
                      },
                      onChanged: (value) {
                        //Do something when changing the item if you want.
                      },
                      onSaved: (value) {
                        controller.selectedValue = value.toString();
                      },
                    ),
                    SizedBox(height: height * 0.025),
                    buildTitle(title: 'Account holder name', sp),
                    SizedBox(height: height * 0.012),
                    buildLoginFields(
                      sp,
                      hinttext: 'Type here',
                      controller: controller.accountypecontroller,
                      validator: null,
                    ),
                    SizedBox(height: height * 0.025),
                    buildTitle(title: 'Account number', sp),
                    SizedBox(height: height * 0.012),
                    buildLoginFields(
                      sp,
                      hinttext: 'Type here',
                      controller: controller.accountnumbercontroller,
                      validator: null,
                    ),
                    SizedBox(height: height * 0.025),
                    buildTitle(title: 'District name', sp),
                    SizedBox(height: height * 0.012),
                    buildLoginFields(
                      sp,
                      hinttext: 'Type here',
                      controller: controller.districtcontroller,
                      validator: null,
                    ),
                    SizedBox(height: height * 0.025),
                    buildTitle(title: 'Branch name', sp),
                    SizedBox(height: height * 0.012),
                    buildLoginFields(
                      sp,
                      hinttext: 'Type here',
                      controller: controller.branchcontroller,
                      validator: null,
                    ),
                    SizedBox(height: height * 0.036),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [kshadow],
                      ),
                      height: height * 0.07,
                      child: MyButton(
                        text: 'Confirm',
                        onPress: () {
                          showDialog(
                            context: context,
                            builder: (ctx) => AlertDialog(
                              title: MyText(
                                align: TextAlign.center,
                                text: "Your payment on the way",
                                size: 20 * sp,
                                weight: kseven,
                                color: kblack,
                              ),
                              content: Image.asset('assets/icons/onTheWay.png',
                                  height: height * 0.2),
                              actions: <Widget>[
                                Center(
                                  child: SizedBox(
                                    width: width / 2.5,
                                    child: MyButton(
                                      text: 'Got it',
                                      onPress: () {
                                        Get.offAndToNamed(
                                            Routes.EDITOR_WITHDRAW);
                                      },
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  MyText buildTitle(double sp, {required String title}) {
    return MyText(
      text: "$title",
      size: 12 * sp,
      weight: kfour,
      color: kgrey8,
    );
  }

  LoginFields buildLoginFields(double sp,
      {required String hinttext,
      TextEditingController? controller,
      required var validator,
      var onSaved}) {
    return LoginFields(
      contentPadding: EdgeInsets.fromLTRB(12, 16, 12, 16),
      fieldValidator: validator,
      style: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kblack,
      ),
      hintText: '$hinttext',
      hintStyle: TextStyle(
        fontSize: 12 * sp,
        fontWeight: kfour,
        color: kblack,
      ),
      enableBorder: enabledborder,
      errorBorder: errorborder,
      focusBorder: focusedborder,
      onSavedState: onSaved,
      border: enabledborder,
    );
  }
}
