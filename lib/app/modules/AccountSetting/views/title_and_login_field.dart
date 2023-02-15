import 'package:flutter/material.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/borders.dart';
import 'package:video_editing_app/widgets/login_field.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/colors.dart';

buildTitle(double sp, {required String title}) {
  return MyText(
    text: "$title",
    size: 12 * sp,
    weight: kfour,
    color: kgrey8,
  );
}

buildLoginFields(double sp,
    {required String hinttext,
    TextEditingController? controller,
    required var validator}) {
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
      color: kgrey3,
    ),
    enableBorder: enabledborder,
    errorBorder: errorborder,
    focusBorder: focusedborder,
    border: enabledborder,
  );
}
