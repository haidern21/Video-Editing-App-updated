import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../widgets/box_shadow.dart';
import '../../../../widgets/elevated_button_widget.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';
import '../controllers/get_quote_five_controller.dart';

GetQuoteFiveController getQuoteFiveController = Get.find();

class GetQuoteFiveView extends GetView<GetQuoteFiveController> {
  const GetQuoteFiveView({super.key});

  // const GetQuoteFiveView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xffF9F9FB),
            leading: Padding(
              padding: const EdgeInsets.all(5),
              child: GestureDetector(
                onTap: () {
                  Get.back();
                  controller.selectedIndex = -1;
                },
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SvgPicture.asset(
                    'assets/icons/backButton.svg',
                  ),
                ),
              ),
            ),
            title: MyText(
              text: "Get Quote",
              size: 16 * sp,
              color: kblack,
              weight: ksix,
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.049),
            child: Column(
              children: [
                SizedBox(height: height * 0.025),
                GetBuilder<GetQuoteFiveController>(
                  builder: (controller) => Column(
                    children: [
                      ...List.generate(
                        controller.totalVideos,
                        (index) => GestureDetector(
                          onTap: () async {
                            controller.changeColor(index);

                            // controller.changeIconMethod();

                            SharedPreferences shared =
                                await SharedPreferences.getInstance();
                            shared.setString(
                              'buttonText',
                              'Video #${index + 1}',
                            );
                            controller.getQuoteDate;
                            await shared.setString(
                              '$index',
                              "{'index':'$index'}",
                            );
                            Get.toNamed(
                              Routes.GET_QUOTE_SIX,
                              arguments: index,
                            );
                            // var getvalue = shared.get('buttonText');
                            // print(shared.getString('buttonText'));
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: height * 0.015),
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.049),
                            height: height * 0.076,
                            width: width,
                            decoration: BoxDecoration(
                              color: controller.selectedIndex != index
                                  ? kprimaryColor
                                  : const Color(0xffF1EBFF),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  controller.selectedIndex != index
                                      ? Icons.play_circle_outline
                                      : Icons.check_circle,
                                  color: controller.selectedIndex == index
                                      ? kcomplete
                                      : kwhite,
                                ),
                                SizedBox(width: width * 0.02),
                                MyText(
                                  text: 'Video #${index + 1}',
                                  color: controller.selectedIndex != index
                                      ? const Color(0xffF9F9FB)
                                      : kprimaryColor,
                                  size: 14 * sp,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(boxShadow: [kshadow]),
                  width: width,
                  height: height * 0.07,
                  child: MyButton(
                    text: 'Next',
                    onPress: () async {
                      try {
                        if (controller.selectedVideos.length <
                            controller.totalVideos) {
                          return toast('Please Select All Videos');
                        } else {
                          /// Implement your logic here
                        }
                        // }
                      } catch (e) {
                        Logger().e(e);
                      }

                      // shared.setString(
                      //   'buttonText',
                      //   'Video #${controller.selectedIndex + 1}',
                      // );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                )
              ],
            ),
          )),
    );
  }
}
