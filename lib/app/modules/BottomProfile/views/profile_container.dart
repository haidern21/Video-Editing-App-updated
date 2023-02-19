import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';

Widget buildProfileContainer(
  double height,
  double width,
  double sp, {
  UserModel? user,
}) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: height * 0.02),
    width: width,
    decoration: BoxDecoration(
      color: kwhite,
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage('assets/icons/avatar.png'),
        ),
        SizedBox(height: height * 0.016),
        MyText(
          text: user?.name ?? '',
          size: 20 * sp,
          weight: ksix,
          color: kblack,
        ),
        SizedBox(height: height * 0.014),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Account type :',
                style: TextStyle(
                  color: kblack,
                  fontWeight: kfour,
                  fontSize: 14 * sp,
                  fontFamily: 'WorkSans',
                ),
              ),
              TextSpan(
                text:
                    user?.accountType??'',
                    // "${user?.accountType?.substring(0, 1).toUpperCase()}${user?.accountType?.substring(1)}",
                style: TextStyle(
                  fontFamily: 'WorkSans',
                  color: kblack,
                  fontWeight: ksix,
                  fontSize: 14 * sp,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
