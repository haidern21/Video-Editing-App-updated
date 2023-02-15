import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/back_button.dart';
import 'package:video_editing_app/widgets/box_shadow.dart';
import 'package:video_editing_app/widgets/elevated_button_widget.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';


class EditorWithdrawView extends StatefulWidget {
  const EditorWithdrawView({Key? key}) : super(key: key);

  @override
  State<EditorWithdrawView> createState() => _EditorWithdrawViewState();
}

class _EditorWithdrawViewState extends State<EditorWithdrawView>
    with TickerProviderStateMixin {
  List<String> avatars = [
    'assets/icons/josh.png',
    'assets/icons/circle2.png',
    'assets/icons/circle3.png',
    'assets/icons/circle4.png',
    'assets/icons/circle5.png',
    'assets/icons/circle6.png',
    'assets/icons/circle7.png',
    'assets/icons/circle8.png',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            elevation: 0,
            backgroundColor: Color(0xffF9F9FB),
            leading: backButton(),
            title: MyText(
              text: 'Earning',
              size: 16 * sp,
              weight: ksix,
              color: kblack,
            ),
            bottom: TabBar(
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 2.0, color: kprimaryColor),
                insets: EdgeInsets.symmetric(horizontal: width * 0.05),
              ),
              indicatorColor: kprimaryColor,
              labelStyle:
                  TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
              labelColor: kprimaryColor,
              unselectedLabelColor: kgrey8,
              unselectedLabelStyle:
                  TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
              tabs: [
                Tab(
                  text: 'Accounts',
                ),
                Tab(
                  text: 'Earning history',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width / 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height * 0.025),
                    MyText(
                      text: 'Total Balance',
                      size: 14 * sp,
                      weight: kfour,
                      color: kgre7,
                    ),
                    SizedBox(height: height * 0.005),
                    MyText(
                      text: r'$500.00',
                      size: 32 * sp,
                      weight: kseven,
                      color: kgrey8,
                    ),
                    SizedBox(height: height * 0.015),
                    Container(
                      height: height * 0.06,
                      decoration: BoxDecoration(boxShadow: [kshadow]),
                      child: MyButton(
                        text: 'Add payment method',
                        onPress: () {
                          Get.toNamed(Routes.EDITOR_ADD_PAYMENT_METHOD);
                        },
                      ),
                    ),
                    SizedBox(height: height * 0.015),
                    MyText(
                      text:
                          'You have no payment method added yet! Please add a payment gateway ',
                      size: 14 * sp,
                      weight: kfour,
                      color: kgre7,
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: height * 0.025),
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
                    ...List.generate(
                        5, (index) => BuildTransaction(width, height, sp))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container BuildTransaction(double width, double height, double sp) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width / 20, vertical: height * 0.025),
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
}
