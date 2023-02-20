import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

import '../../BottomProfile/controllers/bottom_profile_controller.dart';
import '../../EditorInProgress/controllers/editor_web_socket_controller.dart';
import 'editor_tab_bar.dart';

class AdminTabBarView extends StatelessWidget {
  const AdminTabBarView({
    Key? key,
    required this.width,
    required this.height,
    required this.sp,
  }) : super(key: key);

  final double width;
  final double height;
  final double sp;

  @override
  Widget build(BuildContext context) {
    ChatViewController chatViewController = Get.find();
    BottomProfileController bottomProfileController = Get.find();
    return RefreshIndicator(
      onRefresh: () async {
        chatViewController.fetchThreadsList();
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width / 20),
        child: Column(
          children: [
            SizedBox(height: height * 0.015),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffF2F2F3),
                borderRadius: BorderRadius.circular(26),
              ),
              height: height * 0.07,
              child: Center(
                child: TextFormField(
                  textAlignVertical: TextAlignVertical.center,
                  style: TextStyle(
                    fontSize: 14 * sp,
                    fontWeight: kfour,
                    fontFamily: 'Poppins',
                    color: kblack,
                  ),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    hintStyle: TextStyle(
                      fontSize: 14 * sp,
                      fontWeight: kfour,
                      fontFamily: 'Poppins',
                      color: const Color(0xff9EA3AE),
                    ),
                    hintText: 'Search name',
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    suffixIcon: const Icon(
                      Icons.mic_none_outlined,
                      size: 20,
                      color: kgrey8,
                    ),
                    prefixIcon: const Icon(
                      Icons.search_outlined,
                      size: 20,
                      color: kgrey8,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.025),
            Obx(
              () => chatViewController.adminChatThreads.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: chatViewController.adminChatThreads.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await chatViewController.getMessagesList(
                                chatViewController.adminChatThreads[index].id ??
                                    0);
                            String? name = chatViewController
                                        .adminChatThreads[index]
                                        .firstPerson
                                        ?.id ==
                                    bottomProfileController
                                        .userModelFromApi.value?.id
                                ? chatViewController.adminChatThreads[index]
                                        .secondPerson?.name ??
                                    ''
                                : chatViewController
                                    .adminChatThreads[index].firstPerson?.name;
                            String? profileImage = chatViewController
                                        .adminChatThreads[index]
                                        .firstPerson
                                        ?.id ==
                                    bottomProfileController
                                        .userModelFromApi.value?.id
                                ? chatViewController.adminChatThreads[index]
                                        .secondPerson?.profilePicture ??
                                    ''
                                : chatViewController.adminChatThreads[index]
                                    .firstPerson?.profilePicture;
                            int receiverId = chatViewController
                                        .adminChatThreads[index]
                                        .firstPerson
                                        ?.id ==
                                    bottomProfileController
                                        .userModelFromApi.value?.id
                                ? chatViewController.adminChatThreads[index]
                                        .secondPerson?.id ??
                                    0
                                : chatViewController.adminChatThreads[index]
                                        .firstPerson?.id ??
                                    0;
                            int threadId =
                                chatViewController.adminChatThreads[index].id ??
                                    0;
                            Get.toNamed(Routes.SEND_MESSAGE, arguments: {
                              'name': name,
                              'profile_image': profileImage,
                              'receiverId': receiverId,
                              'threadId': threadId
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: height * 0.036),
                            height: height * 0.07,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FittedBox(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 20,
                                        backgroundImage:
                                            AssetImage(avatars[index]),
                                      ),
                                      SizedBox(
                                        width: width / 40,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          MyText(
                                            text: chatViewController
                                                        .adminChatThreads[index]
                                                        .firstPerson
                                                        ?.id ==
                                                    bottomProfileController
                                                        .userModelFromApi
                                                        .value
                                                        ?.id
                                                ? chatViewController
                                                        .adminChatThreads[index]
                                                        .secondPerson
                                                        ?.name ??
                                                    ''
                                                : chatViewController
                                                    .adminChatThreads[index]
                                                    .firstPerson
                                                    ?.name,
                                            size: 14 * sp,
                                            weight: kfour,
                                            color: const Color(0xff31383C),
                                          ),
                                          SizedBox(
                                            height: height * 0.003,
                                          ),
                                          MyText(
                                            text: chatViewController
                                                    .adminChatThreads[index]
                                                    .lastMessage ??
                                                '',
                                            size: 14 * sp,
                                            weight: kfour,
                                            // weight: index == 0 ? ksix : kfour,
                                            color: const Color(0xff31383C),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                FittedBox(
                                  child: MyText(
                                    text: chatViewController
                                        .chatThreads[index].lastMessageTimestamp
                                        ?.substring(0, 10),
                                    size: 12 * sp,
                                    weight: kfour,
                                    color: const Color(0xffA2A2A2),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : const Center(
                      child: Text('No chats available'),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
