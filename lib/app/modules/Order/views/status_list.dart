import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'container_widget.dart';
import 'order_app_bar.dart';

// StatusList(double width, double height, double sp) {
//   var fourStyle = TextStyle(
//     color: kgre7,
//     fontSize: 14 * sp,
//     fontWeight: kfour,
//     fontFamily: 'WorkSans',
//   );
//   var sixStyle = TextStyle(
//     color: kgre7,
//     fontSize: 14 * sp,
//     fontWeight: ksix,
//     fontFamily: 'WorkSans',
//   );
//   return List.generate(
//     10,
//     (index) => GestureDetector(
//       onTap: () {
//         index == 0
//             ? Get.toNamed(Routes.PROJECT_DETAILS)
//             : index == 1
//                 ? Get.toNamed(Routes.IN_PROGRESS)
//                 : Get.toNamed(Routes.COMPLETED);
//       },
//       child: buildProjectTitle(
//         width,
//         height,
//         sp,
//         richText: index != 1
//             ? RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(
//                       text: '20 Sept 2022, 06:23 PM',
//                       style: TextStyle(
//                         color: kgre7,
//                         fontSize: 14 * sp,
//                         fontWeight: kfour,
//                         fontFamily: 'WorkSans',
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             : RichText(
//                 text: TextSpan(
//                   children: [
//                     TextSpan(text: 'Project Timeline :   ', style: fourStyle),
//                     TextSpan(text: '10:44:20', style: sixStyle),
//                   ],
//                 ),
//               ),
//         containerText: index == 0
//             ? 'Quote'
//             : index == 1
//                 ? 'In Progress'
//                 : 'Completed',
//         containerColor: index == 0
//             ? kwarning.withOpacity(0.10)
//             : index == 1
//                 ? kinfo.withOpacity(0.10)
//                 : kcomplete.withOpacity(0.10),
//         containerTextColor: index == 0
//             ? kwarning
//             : index == 1
//                 ? kinfo
//                 : kcomplete,
//       ),
//     ),
//   );
// }
