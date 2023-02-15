import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../../../routes/app_pages.dart';
import '../../GetQuoteFive/controllers/get_quote_five_controller.dart';
import '../controllers/home_controller.dart';
import 'app_bar.dart';
import 'catergories_widget.dart';
import 'custom_quote.dart';

GetQuoteFiveController fiveController = Get.put(GetQuoteFiveController());

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9FB),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.02),
            AppBarWidget(height, width, sp),
            SizedBox(height: height * 0.025),
            CustomQuote(width),
            SizedBox(height: height * 0.036),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.053),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyText(
                    text: "Categories",
                    size: 16 * sp,
                    weight: ksix,
                    color: kgrey8,
                  ),
                  SizedBox(height: height * 0.025),
                  // ...categoriesWidget(
                  //     height, width, sp, controller.categories, controller)
                  FutureBuilder(builder: (context, snap) {
                    return Obx(() => controller.showLoader.value == false
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  controller.selectedCategoryId.value =
                                      controller.categories[index].id ?? 0;
                                  Get.toNamed(Routes.GET_QUOTE);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(bottom: height * 0.013),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: width * 0.04),
                                  height: height * 0.07,
                                  width: width,
                                  decoration: BoxDecoration(
                                    color: kwhite,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      MyText(
                                        text:
                                            "${controller.categories[index].name}",
                                        size: 14 * sp,
                                        color: kgrey8,
                                        weight: ksix,
                                      ),
                                      SvgPicture.asset(
                                          'assets/icons/forwardPrimary.svg'),
                                    ],
                                  ),
                                ),
                              );
                            })
                        : const Center(
                            child: CircularProgressIndicator(),
                          ));
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
