import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/my_text.dart';

RouteContainers(double height, double width, double sp) {
  bool state = false;
  bool isSwitched = false;
  var textValue = 'Switch is OFF';

  List<String> title = [
    'Account settings',
    'Payment settings',
    'Notification settings'
  ];

  List<String> icons = [
    'assets/icons/accountSetting.svg',
    'assets/icons/card.svg',
    'assets/icons/notification.svg'
  ];
  return List.generate(
      3,
      (index) => GestureDetector(
          onTap: () {
            index == 0
                ? Get.toNamed(Routes.ACCOUNT_SETTING)
                : index == 1
                    ? Get.toNamed(Routes.PAYMENT_AND_DEPOSIT)
                    : DoNothingAction();
          },
          child: Container(
              margin: EdgeInsets.only(bottom: height * 0.015),
              padding: EdgeInsets.only(
                top: height * 0.014,
                bottom: height * 0.014,
                left: width / 25,
                right: index != 2 ? width / 25 : 0,
              ),
              height: height * 0.075,
              width: width,
              decoration: BoxDecoration(
                color: kwhite,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          icons[index],
                          color: kgre7,
                        ),
                        SizedBox(width: width * 0.02),
                        MyText(
                          text: title[index],
                          size: 14 * sp,
                          weight: kfour,
                          color: Color(0xff090A0A),
                        )
                      ],
                    ),
                  ),
                  FittedBox(
                    child: index == 2
                        ? StatefulBuilder(builder:
                            (BuildContext context, StateSetter setState) {
                            return Transform.scale(
                              scale: 0.8,
                              child: CupertinoSwitch(
                                value: state,
                                onChanged: (value) {
                                  state = value;
                                  setState(
                                    () {},
                                  );
                                },
                                thumbColor: kwhite,
                                activeColor: kprimaryColor,
                              ),
                            );
                          })
                        : Icon(
                            Icons.arrow_forward_ios_outlined,
                            color: Color(0xff090A0A),
                            size: 16,
                          ),
                  )
                ],
              ))));
}
