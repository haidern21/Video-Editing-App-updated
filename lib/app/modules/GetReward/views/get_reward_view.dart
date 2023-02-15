import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/weight.dart';

class GetRewardView extends StatefulWidget {
  @override
  _GetRewardViewState createState() => _GetRewardViewState();
}

class _GetRewardViewState extends State<GetRewardView> {
  bool _firstChild = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color(0xffF9F9FB),
          leading: GestureDetector(
            onTap: () {
              setState(() {
                _firstChild = !_firstChild;
              });
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: kblack,
              size: 16,
            ),
          ),
          title: MyText(
            text: 'Get reward',
            size: 16 * sp,
            weight: ksix,
            color: kblack,
          ),
          centerTitle: true,
        ),
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedCrossFade(
                  firstCurve: Curves.easeInCubic,
                  secondCurve: Curves.easeInCirc,
                  firstChild: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _firstChild = !_firstChild;
                          });
                        },
                        child: Column(
                          children: [
                            MyText(
                              text: 'Congratulations!!! ',
                              size: 16 * sp,
                              weight: ksix,
                              color: kprimaryColor,
                            ),
                            SizedBox(height: height * 0.02),
                            MyText(
                              text: 'You are rewarded',
                              size: 16 * sp,
                              weight: ksix,
                              color: kgrey8,
                            ),
                            SizedBox(height: height * 0.02),
                            FittedBox(
                              child: Container(
                                height: height / 3,
                                width: width / 2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        'assets/icons/openReward.png'),
                                  ),
                                ),
                                child: MyText(
                                  paddingTop: height * 0.1,
                                  align: TextAlign.center,
                                  text: "You won 20 Points",
                                  size: 16 * sp,
                                  weight: kseven,
                                  color: kprimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.BOTTOM_BAR),
                        child: MyText(
                          text: 'Back to home',
                          size: 14 * sp,
                          weight: ksix,
                          color: kprimaryColor,
                        ),
                      )
                    ],
                  ),
                  secondChild: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            _firstChild = !_firstChild;
                          });
                        },
                        child: Column(
                          children: [
                            MyText(
                              text: 'Tap mystery box & get rewards',
                              size: 16 * sp,
                              weight: ksix,
                              color: kgrey8,
                            ),
                            SizedBox(
                              height: height * 0.2,
                            ),
                            FittedBox(
                              child: Container(
                                height: height * 0.15,
                                width: width * 0.26,
                                child: Image.asset(
                                  'assets/icons/closeReward.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  crossFadeState: _firstChild
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(seconds: 1),
                  layoutBuilder: (
                    Widget topChild,
                    Key topChildKey,
                    Widget bottomChild,
                    Key bottomChildKey,
                  ) {
                    return Stack(
                      clipBehavior: Clip.none,
                      alignment: Alignment.center,
                      children: [
                        PositionedDirectional(
                          child: bottomChild,
                          key: bottomChildKey,
                          top: 0,
                        ),
                        PositionedDirectional(
                          child: topChild,
                          key: topChildKey,
                        ),
                      ],
                    );
                  },
                ),
                // Container(
                //   margin: EdgeInsets.all(16.0),
                //   width: double.infinity,
                //   height: 60,
                //   color: Colors.transparent,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class GetRewardView extends GetView<GetRewardController> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('GetRewardView'),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Text(
//           'GetRewardView is working',
//           style: TextStyle(fontSize: 20),
//         ),
//       ),
//     );
//   }
// }
