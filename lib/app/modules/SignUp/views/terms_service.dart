import 'package:flutter/cupertino.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';

TermsAndService(
  double sp,
) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: 'By continuing, you agree to our ',
          style: TextStyle(
            color: kblack,
            fontSize: 12 * sp,
            fontWeight: kfour,
          ),
        ),
        TextSpan(
          text: 'Terms of Service ',
          style: TextStyle(
            color: kprimaryColor,
            fontSize: 12 * sp,
            fontWeight: kfour,
          ),
        ),
        TextSpan(
          text: 'and',
          style: TextStyle(
            color: kblack,
            fontSize: 12 * sp,
            fontWeight: kfour,
          ),
        ),
        TextSpan(
          text: ' Privacy Policy.',
          style: TextStyle(
            height: 1.5,
            color: kprimaryColor,
            fontSize: 12 * sp,
            fontWeight: kfour,
          ),
        ),
      ],
    ),
  );
}
