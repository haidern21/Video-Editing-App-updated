import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/modules/SignUp/controllers/sign_up_controller.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/my_text.dart';

SignUpController controller = Get.find();
final List<String> accountItems = [
  'Business',
  'Videographer',
  'Agency',
  'Content Creator',
  'Others'
];

class AccountType extends StatelessWidget {
  const AccountType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return DropdownButtonFormField2(
      // searchController: controller.accountTypeController,
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
      items: accountItems
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
          return 'Please account type';
        }
      },
      onChanged: (value) {
        // controller.accountTypeController.text=value??'';
//Do something when changing the item if you want.
      },
      onSaved: (value) {
        controller.selectedValue = value.toString();
      },
    );
  }
}
