import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/home/controllers/home_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import '../../../../widgets/my_text.dart';
import '../../../data/models/category_model.dart';

// List<String> categories = [
//   'Reel/Youtube/Tiktok ',
//   'Social Media Ad',
//   'Wedding',
//   'Music',
//   'Real Estate'
// ];

// categoriesWidget(double height, double width, double sp,
//     List<CategoryModel> categories, HomeController homeController) {
//   return List.generate(
//       categories.length,
//       (index) => GestureDetector(
//             onTap: () {
//               homeController.selectedCategoryId.value =
//                   categories[index].id ?? 0;
//               Get.toNamed(Routes.GET_QUOTE);
//             },
//             child: Container(
//               margin: EdgeInsets.only(bottom: height * 0.013),
//               padding: EdgeInsets.symmetric(horizontal: width * 0.04),
//               height: height * 0.07,
//               width: width,
//               decoration: BoxDecoration(
//                 color: kwhite,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   MyText(
//                     text: "${categories[index].name}",
//                     size: 14 * sp,
//                     color: kgrey8,
//                     weight: ksix,
//                   ),
//                   SvgPicture.asset('assets/icons/forwardPrimary.svg'),
//                 ],
//               ),
//             ),
//           ));
// }
