import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignInWithSocialMedia extends StatelessWidget {
  const SignInWithSocialMedia({
    Key? key,
    required this.socialPngs,
    required this.width,
    required this.height,
  }) : super(key: key);

  final List socialPngs;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ...List.generate(socialPngs.length, (index) {
        return InkWell(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.only(right: width / 30),
              padding: EdgeInsets.all(10),
              height: height * 0.060,
              width: width / 2.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(21),
                  border: Border.all(
                    color: Color(0xffEBEBEB),
                  )),
              child: SvgPicture.asset(socialPngs[index]),
            ));
      })
    ]);
  }
}
