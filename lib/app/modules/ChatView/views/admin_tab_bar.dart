import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';


class AdminTabBarView extends StatelessWidget {
  const AdminTabBarView({
    Key? key,
    required this.width,
    required this.height,
    required this.sp,
  }) : super(key: key);

  final double width;
  final double height;
  final double sp;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 20),
      child: Column(
        children: [
          SizedBox(height: height * 0.015),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffF2F2F3),
              borderRadius: BorderRadius.circular(26),
            ),
            height: height * 0.07,
            child: Center(
              child: TextFormField(
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                  fontSize: 14 * sp,
                  fontWeight: kfour,
                  fontFamily: 'Poppins',
                  color: kblack,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  hintStyle: TextStyle(
                    fontSize: 14 * sp,
                    fontWeight: kfour,
                    fontFamily: 'Poppins',
                    color: Color(0xff9EA3AE),
                  ),
                  hintText: 'Search name',
                  enabledBorder: InputBorder.none,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  suffixIcon: Icon(
                    Icons.mic_none_outlined,
                    size: 20,
                    color: kgrey8,
                  ),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    size: 20,
                    color: kgrey8,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.025),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.SEND_MESSAGE),
            child: Container(
              height: height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundImage: AssetImage('assets/icons/josh.png'),
                        ),
                        SizedBox(
                          width: width / 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(
                              text: "Josiah Zayner",
                              size: 14 * sp,
                              weight: kfour,
                              color: Color(0xff31383C),
                            ),
                            SizedBox(
                              height: height * 0.003,
                            ),
                            MyText(
                              text: "How are you today?",
                              size: 14 * sp,
                              weight: ksix,
                              color: Color(0xff31383C),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FittedBox(
                    child: MyText(
                      text: "9.56 AM",
                      size: 12 * sp,
                      weight: kfour,
                      color: Color(0xffA2A2A2),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
