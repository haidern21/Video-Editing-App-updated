import 'package:flutter/cupertino.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/borders.dart';
import '../../../../widgets/login_field.dart';
import '../../../../widgets/my_text.dart';

buildTitle(double sp, {required String title}) {
  return MyText(
    text: title,
    size: 12 * sp,
    weight: kfour,
    color: kgrey8,
  );
}

buildLoginFields(double sp,
    {required String hinttext,
    TextEditingController? controller,
    required var validator,
    var onSaved}) {
  return LoginFields(
    contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
    fieldValidator: validator,
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
    onSavedState: onSaved,
    border: enabledborder,
  );
}
