import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/home/controllers/home_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/widgets/back_button.dart';
import 'package:video_editing_app/widgets/my_text.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/weight.dart';
import '../controllers/get_quote_controller.dart';

HomeController homeController = Get.find();

class GetQuoteView extends GetView<GetQuoteController> {
  var styleGrey = TextStyle(
    fontSize: 14 * sp,
    fontWeight: kfour,
    color: kgrey5,
  );
  // Future future = GetQuoteController()
  //     .getPackagesList(homeController.selectedCategoryId.value);
  var stylePrimary = TextStyle(
    fontSize: 14 * sp,
    fontWeight: ksix,
    color: kprimaryColor,
  );

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9FB),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF9F9FB),
          leading: Padding(
            padding: const EdgeInsets.all(5.0),
            child: backButton(),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: height * 0.025),
              MyText(
                text: "Please choose package",
                size: 16 * sp,
                color: kgrey8,
                weight: ksix,
              ),
              SizedBox(height: height * 0.036),
              Expanded(
                child: FutureBuilder(
                    // future: controller.getPackagesList(
                    //     homeController.selectedCategoryId.value),
                    builder: (context, snapshot) {
                  return Obx(() => controller.showLoader.value == false
                      ? ListView.separated(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                controller.selectedPackageModel =
                                    controller.packages[index];
                                Get.toNamed(Routes.GET_QUOTE_TWO);
                              },
                              child: packageTile(
                                  packageName:
                                      controller.packages[index].name ?? '',
                                  price: controller.packages[index].price ?? '',
                                  videoCount:
                                      controller.packages[index].videoCount ??
                                          1),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 0);
                          },
                          itemCount: controller.packages.length,
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ));
                }),
              ),
              SizedBox(height: height * 0.046),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 15.0),
              //     child: Container(
              //       decoration: BoxDecoration(boxShadow: [kshadow]),
              //       height: height * 0.07,
              //       width: width,
              //       child: MyButton(
              //         text: 'Continue',
              //         onPress: () {
              //           Get.toNamed(Routes.GET_QUOTE_TWO);
              //         },
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget packageTile(
      {required String packageName,
      required String price,
      required int videoCount}) {
    return Container(
      padding: EdgeInsets.only(
        top: height * 0.002,
        left: width / 20,
        right: width / 20,
      ),
      height: height * 0.12,
      width: width,
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyText(
                text: packageName,
                size: 14 * sp,
                color: kgrey8,
                weight: ksix,
              ),
              SizedBox(height: height * 0.007),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                        text:
                            '\$ ${(double.parse(price) ~/ videoCount).toString()} /',
                        style: stylePrimary),
                    TextSpan(text: 'video', style: styleGrey),
                  ],
                ),
              )
            ],
          ),
          SvgPicture.asset('assets/icons/forwardPrimary.svg')
        ],
      ),
    );
  }
}
