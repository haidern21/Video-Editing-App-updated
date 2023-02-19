import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/EditorProfile/controllers/editor_profile_controller.dart';

import '../../BottomProfile/controllers/bottom_profile_controller.dart';
import '../../EditorChats/controllers/editor_chats_controller.dart';
import '../../EditorChats/views/editor_chats_view.dart';
import '../../EditorInProgress/controllers/editor_web_socket_controller.dart';
import '../../EditorOrders/views/editor_orders_view.dart';
import '../../EditorProfile/views/editor_profile_view.dart';
import '../controllers/editor_bottom_bar_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/ChatView/views/chat_view_view.dart';
import 'package:video_editing_app/constants/colors.dart';

import '../../../../widgets/willpop.dart';
import '../../BottomProfile/views/bottom_profile_view.dart';
import '../../Order/views/order_view.dart';
import '../../Profile/views/profile_view.dart';
import '../../home/views/home_view.dart';

class EditorBottomBarView extends GetView<EditorBottomBarController> {
  EditorProfileController bottomProfileController = Get.put(EditorProfileController());
  EditorChatsController editorChatsController =
  Get.put(EditorChatsController());
  EditorWebSocketController webSocketController= Get.put(EditorWebSocketController());
  final TextStyle unselectedLabelStyle =
      const TextStyle(color: kgrey5, fontWeight: FontWeight.w400, fontSize: 10);

  final TextStyle selectedLabelStyle = const TextStyle(
      color: kprimaryColor, fontWeight: FontWeight.w400, fontSize: 10);

  EditorBottomBarView({super.key});

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          height: 79,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 30,
                color: Color(0xffD1D1D1).withOpacity(0.25),
                offset: Offset(0, -10))
          ]),
          child: BottomNavigationBar(
            backgroundColor: kwhite,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            unselectedItemColor: Color(0xff838383),
            selectedItemColor: kprimaryColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: Color(0xff838383),
                  ),
                ),
                label: 'Chat',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/order.svg",
                    color: Color(0xff838383),
                  ),
                ),
                label: 'Order',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/order.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: Color(0xff838383),
                  ),
                ),
                label: 'Profile',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final EditorBottomBarController landingPageController =
        Get.put(EditorBottomBarController(), permanent: false);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return onBackButtonPressed(context);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar:
              buildBottomNavigationMenu(context, landingPageController),
          body: Obx(
            () => IndexedStack(
              index: landingPageController.tabIndex.value,
              children: [
                const EditorChatsView(),
                EditorOrdersView(),
                EditorProfileView()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
