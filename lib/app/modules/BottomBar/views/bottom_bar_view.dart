import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/modules/ChatView/views/chat_view_view.dart';
import 'package:video_editing_app/constants/colors.dart';
import '../../../../widgets/willpop.dart';
import '../../BottomProfile/controllers/bottom_profile_controller.dart';
import '../../BottomProfile/views/bottom_profile_view.dart';
import '../../InProgress/controllers/web_socket_controller.dart';
import '../../Order/views/order_view.dart';
import '../../home/views/home_view.dart';
import '../controllers/bottom_bar_controller.dart';

class BottomBarView extends GetView<BottomBarController> {
  final TextStyle unselectedLabelStyle =
      const TextStyle(color: kgrey5, fontWeight: FontWeight.w400, fontSize: 10);
  BottomProfileController bottomProfileController = Get.put(BottomProfileController());
  ChatViewController chatViewController= Get.put(ChatViewController());
  WebSocketController webSocketController= Get.put(WebSocketController());
  final TextStyle selectedLabelStyle = const TextStyle(
      color: kprimaryColor, fontWeight: FontWeight.w400, fontSize: 10);

   BottomBarView({super.key});

  final BottomBarController landingPageController =
  Get.put(BottomBarController(), permanent: false);

  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(
      () => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          height: 79,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                blurRadius: 30,
                color: const Color(0xffD1D1D1).withOpacity(0.25),
                offset: const Offset(0, -10))
          ]),
          child: BottomNavigationBar(
            backgroundColor: kwhite,
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: landingPageController.changeTabIndex,
            currentIndex: landingPageController.tabIndex.value,
            unselectedItemColor: const Color(0xff838383),
            selectedItemColor: kprimaryColor,
            unselectedLabelStyle: unselectedLabelStyle,
            selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: const Color(0xff838383),
                  ),
                ),
                label: 'Home',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/home.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: const Color(0xff838383),
                  ),
                ),
                label: 'Chat',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/chat.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/order.svg",
                    color: const Color(0xff838383),
                  ),
                ),
                label: 'Order',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/order.svg",
                    color: kprimaryColor,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
                  child: SvgPicture.asset(
                    "assets/icons/profile.svg",
                    color: const Color(0xff838383),
                  ),
                ),
                label: 'Profile',
                backgroundColor: kwhite,
                activeIcon: Container(
                  margin: const EdgeInsets.only(bottom: 4),
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
  callFuture() async {
    final AsyncMemoizer memoizer = AsyncMemoizer();
    return memoizer.runOnce(() async {
      await landingPageController.checkTokenValidity();
    });
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return onBackButtonPressed(context);
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          bottomNavigationBar:
              buildBottomNavigationMenu(context, landingPageController),
          body: FutureBuilder<dynamic>(
              future: callFuture(),
              builder: (context, snapshot) {
                return Obx(
                  () => IndexedStack(
                    index: landingPageController.tabIndex.value,
                    children: [
                      HomeView(),
                      const ChatViewView(),
                      const OrderView(),
                       BottomProfileView()
                    ],
                  ),
                );
              }),
        ),
      ),
    );
  }
}
