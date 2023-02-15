import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

TransactionTabBar(double height, double width, double sp) {
  return SingleChildScrollView(
    child: Column(
      children: [
        SizedBox(height: height * 0.015),
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: width / 20, vertical: height * 0.025),
          width: width,
          color: kgrey2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: MyText(
                  fontFamily: 'Poppins',
                  text: 'Order',
                  size: 12 * sp,
                  weight: kfive,
                  color: kgrey8,
                ),
              ),
              Expanded(
                child: MyText(
                  fontFamily: 'Poppins',
                  text: 'Date',
                  size: 12 * sp,
                  weight: kfive,
                  color: kgrey8,
                ),
              ),
              Expanded(
                child: MyText(
                  fontFamily: 'Poppins',
                  text: 'Amount',
                  size: 12 * sp,
                  weight: kfive,
                  color: kgrey8,
                ),
              ),
              SvgPicture.asset(
                'assets/icons/download.svg',
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        ...List.generate(5, (index) => BuildTransaction(width, height, sp))
      ],
    ),
  );
}

BuildTransaction(double width, double height, double sp) {
  return Container(
    padding:
        EdgeInsets.symmetric(horizontal: width / 20, vertical: height * 0.025),
    width: width,
    child: Row(
      children: [
        Expanded(
          child: MyText(
            fontFamily: 'Poppins',
            text: '#AC256664',
            size: 12 * sp,
            weight: kfive,
            color: kgrey8,
          ),
        ),
        Expanded(
          child: MyText(
            fontFamily: 'Poppins',
            text: '05 Oct 2022',
            size: 12 * sp,
            weight: kfive,
            color: kgrey8,
          ),
        ),
        Expanded(
          child: MyText(
            fontFamily: 'Poppins',
            text: r'$250',
            size: 12 * sp,
            weight: kfive,
            color: kgrey8,
          ),
        ),
        SvgPicture.asset('assets/icons/download.svg'),
      ],
    ),
  );
}
