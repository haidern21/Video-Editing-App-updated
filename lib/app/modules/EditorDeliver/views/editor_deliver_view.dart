import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/back_button.dart';
import 'package:video_editing_app/widgets/my_text.dart';

import '../controllers/editor_deliver_controller.dart';

EditorDeliverController controller = Get.put(EditorDeliverController());

class EditorDeliverView extends StatefulWidget {
  const EditorDeliverView({Key? key}) : super(key: key);

  @override
  State<EditorDeliverView> createState() => _EditorDeliverViewState();
}

class _EditorDeliverViewState extends State<EditorDeliverView> {
  List<String> carImages = [
    'assets/icons/carImage1.png',
    'assets/icons/carImage2.png',
    'assets/icons/carImage3.png',
    'assets/icons/carImage4.png',
    'assets/icons/carImage5.png',
    'assets/icons/carImage6.png',
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.2) / 2;
    final double itemWidth = size.width / 4;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Color(0xffF9F9FB),
            leading: backButton()),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.025),
              MyText(
                text: 'Message',
                size: 12 * sp,
                weight: kfour,
                color: kblack,
              ),
              SizedBox(height: height * 0.01),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width / 25),
                height: height * 0.23,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: kgrey3,
                  ),
                ),
                child: TextField(
                  style: TextStyle(
                    fontSize: 12 * sp,
                    fontWeight: kfour,
                    color: kblack,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintText: 'Type here',
                    hintStyle: TextStyle(
                      fontSize: 12 * sp,
                      fontWeight: kfour,
                      color: kgrey3,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              MyText(
                text: "Video",
                size: 14 * sp,
                weight: ksix,
                color: kgrey8,
              ),
              SizedBox(height: height * 0.01),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: height * 0.013),
                  SizedBox(
                    height: height * 0.4,
                    child: GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: width * 0.01,
                        mainAxisSpacing: height * 0.01,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      children: [
                        ...List.generate(
                          carImages.length,
                          (index) => Stack(
                            children: [
                              Badge(
                                padding: EdgeInsets.zero,
                                elevation: 0,
                                badgeColor: Colors.transparent,
                                badgeContent: GestureDetector(
                                  onTap: index != carImages.length - 1
                                      ? () {
                                          setState(() {
                                            carImages.remove(carImages[index]);
                                            // carImages.removeAt(index);
                                          });
                                        }
                                      : null,
                                  child: index != carImages.length - 1
                                      ? Icon(Icons.cancel,
                                          size: 20, color: kcancel)
                                      : Icon(Icons.circle,
                                          color: Colors.transparent),
                                ),
                                child: Image.asset(
                                  '${carImages[index]}',
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Spacer(),
              GetBuilder<EditorDeliverController>(builder: (controller) {
                return SizedBox(
                  width: width,
                  child: ElevatedButton(
                    onPressed: carImages.length > 1
                        ? () {
                            Get.toNamed(Routes.EDITOR_BOTTOM_BAR);
                            // print(carImages.length);
                          }
                        : null,
                    child: Text('Deliver now'),
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      disabledForegroundColor:
                          Color(0xff9EA3AE).withOpacity(0.38),
                      disabledBackgroundColor:
                          Color(0xff9EA3AE).withOpacity(0.12),
                      backgroundColor: kprimaryColor,
                    ),
                  ),
                );
              }),
              SizedBox(height: height * 0.03)
            ],
          ),
        ),
      ),
    );
  }
}

// class EditorDeliverView extends GetView<EditorDeliverController> {
//   List<String> carImages = [
//     'assets/icons/carImage1.png',
//     'assets/icons/carImage2.png',
//     'assets/icons/carImage3.png',
//     'assets/icons/carImage4.png',
//     'assets/icons/carImage5.png',
//     'assets/icons/carImage6.png',
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     final sp = MediaQuery.of(context).textScaleFactor;
//     var size = MediaQuery.of(context).size;
//     final double itemHeight = (size.height * 0.2) / 2;
//     final double itemWidth = size.width / 4;
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           backgroundColor: Color(0xffF9F9FB),
//           leading: Icon(
//             Icons.arrow_back_ios_outlined,
//             color: kblack,
//             size: 15,
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.symmetric(horizontal: width / 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(height: height * 0.025),
//               MyText(
//                 text: 'Message',
//                 size: 12 * sp,
//                 weight: kfour,
//                 color: kblack,
//               ),
//               SizedBox(height: height * 0.01),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: width / 25),
//                 height: height * 0.23,
//                 width: width,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   border: Border.all(
//                     color: kgrey3,
//                   ),
//                 ),
//                 child: TextField(
//                   style: TextStyle(
//                     fontSize: 12 * sp,
//                     fontWeight: kfour,
//                     color: kblack,
//                   ),
//                   decoration: InputDecoration(
//                     contentPadding: EdgeInsets.zero,
//                     hintText: 'Type here',
//                     hintStyle: TextStyle(
//                       fontSize: 12 * sp,
//                       fontWeight: kfour,
//                       color: kgrey3,
//                     ),
//                     enabledBorder: InputBorder.none,
//                     focusedBorder: InputBorder.none,
//                     border: InputBorder.none,
//                   ),
//                 ),
//               ),
//               SizedBox(height: height * 0.04),
//               MyText(
//                 text: "Video",
//                 size: 14 * sp,
//                 weight: ksix,
//                 color: kgrey8,
//               ),
//               SizedBox(height: height * 0.01),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   SizedBox(height: height * 0.013),
//                   GridView.count(
//                     physics: NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     childAspectRatio: (itemWidth / itemHeight),
//                     mainAxisSpacing: 8,
//                     crossAxisSpacing: 0,
//                     crossAxisCount: 3,
//                     children: [
//                       ...List.generate(carImages.length, (index) {
//                         return Stack(
//                           children: [
//                             Positioned(
//                               top: height * 0.008,
//                               child: Image.asset(
//                                 '${carImages[index]}',
//                                 height: height * 0.17 / 1.5,
//                               ),
//                             ),
//                             Positioned(
//                               bottom: height * 0.09,
//                               left: width * 0.22,
//                               child: GestureDetector(
//                                 onTap: () {
//                                   carImages.removeAt(index);
//                                   print(carImages.removeAt(index).toString());
//                                 },
//                                 child: Icon(
//                                   Icons.cancel,
//                                   size: 20,
//                                   color:
//                                       index != 5 ? kcancel : Colors.transparent,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         );
//                       })
//                     ],
//                   ),
//                 ],
//               ),
//               Spacer(),
//               GetBuilder<EditorDeliverController>(builder: (controller) {
//                 return SizedBox(
//                   width: width,
//                   child: ElevatedButton(
//                     onPressed: controller.isButtonActive
//                         ? () {
//                             controller.enabledButton();
//                           }
//                         : null,
//                     child: Text('Deliver now'),
//                     style: ElevatedButton.styleFrom(
//                       shape: StadiumBorder(),
//                       disabledForegroundColor:
//                           Color(0xff9EA3AE).withOpacity(0.38),
//                       disabledBackgroundColor:
//                           Color(0xff9EA3AE).withOpacity(0.12),
//                       backgroundColor: kprimaryColor,
//                     ),
//                   ),
//                 );
//               }),
//               SizedBox(height: height * 0.03)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
