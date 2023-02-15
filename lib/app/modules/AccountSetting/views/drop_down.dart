import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/modules/AccountSetting/controllers/account_setting_controller.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/borders.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/colors.dart';

AccountSettingController controller = Get.put(AccountSettingController());
DropDown(double sp, double height) {
  final List<String> accountTypes = [
    'Business',
    'Videographer',
    'Agency',
    'Content Creator',
    'Others'
  ];

  return DropdownButtonFormField2(
    searchController: controller.accountTypeController,
    decoration: InputDecoration(
      filled: true,
      fillColor: kwhite,
      isDense: true,
      contentPadding: EdgeInsets.zero,
      border: enabledborder,
      enabledBorder: enabledborder,
      focusedBorder: focusedborder,
    ),
    isExpanded: true,
    hint: MyText(
      text: 'Business',
      size: 12 * sp,
      weight: kfour,
      color: kgrey8,
    ),
    icon: Icon(
      Icons.keyboard_arrow_down_outlined,
      color: Color(0xffD3D5DA),
    ),
    iconSize: 30,
    buttonHeight: height / 14,
    buttonPadding: EdgeInsets.only(left: 20, right: 10),
    dropdownDecoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
    ),
    items: accountTypes
        .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ))
        .toList(),
    validator: (value) {
      if (value == null) {
        return 'Please select account type';
      }
    },
    onChanged: (value) {
      //Do something when changing the item if you want.
    },
    onSaved: (value) {
      controller.selectedValue = value.toString();
    },
  );
}
