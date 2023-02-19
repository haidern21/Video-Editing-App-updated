import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/BottomProfile/controllers/bottom_profile_controller.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/modules/EditorInProgress/controllers/editor_web_socket_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

List<String> avatars = [
  'assets/icons/josh.png',
  'assets/icons/circle2.png',
  'assets/icons/circle3.png',
  'assets/icons/circle4.png',
  'assets/icons/circle5.png',
  'assets/icons/circle6.png',
  'assets/icons/circle7.png',
  'assets/icons/circle8.png',
];

class EditorTabBarView extends StatelessWidget {
  const EditorTabBarView({
    Key? key,
    required this.width,
    required this.height,
    required this.sp,
    required this.avatars,
  }) : super(key: key);

  final double width;
  final double height;
  final double sp;
  final List<String> avatars;

  @override
  Widget build(BuildContext context) {
    ChatViewController chatViewController = Get.find();
    BottomProfileController bottomProfileController = Get.find();
    return RefreshIndicator(
      onRefresh: ()async{
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
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: chatViewController.chatThreads.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await chatViewController.getMessagesList(
                            chatViewController.chatThreads[index].id ?? 0);
                        String? name = chatViewController
                                    .chatThreads[index].firstPerson?.id ==
                                bottomProfileController.userModelFromApi.value?.id
                            ? chatViewController
                                    .chatThreads[index].secondPerson?.name ??
                                ''
                            : chatViewController
                                .chatThreads[index].firstPerson?.name;
                        String? profileImage = chatViewController
                                    .chatThreads[index].firstPerson?.id ==
                                bottomProfileController.userModelFromApi.value?.id
                            ? chatViewController.chatThreads[index].secondPerson
                                    ?.profilePicture ??
                                ''
                            : chatViewController
                                .chatThreads[index].firstPerson?.profilePicture;
                        int receiverId=chatViewController
                            .chatThreads[index].firstPerson?.id ==
                            bottomProfileController
                                .userModelFromApi.value?.id
                            ? chatViewController.chatThreads[index].secondPerson
                            ?.id ??
                            0
                            : chatViewController
                            .chatThreads[index].firstPerson?.id??0;
                        int threadId= chatViewController.chatThreads[index].id ?? 0;
                        Get.toNamed(Routes.SEND_MESSAGE,arguments: {
                          'name': name,
                          'profile_image': profileImage,
                          'receiverId':receiverId,
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
                                    backgroundImage: AssetImage(avatars[index]),
                                  ),
                                  SizedBox(
                                    width: width / 40,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      MyText(
                                        text: chatViewController
                                                    .chatThreads[index]
                                                    .firstPerson
                                                    ?.id ==
                                                bottomProfileController
                                                    .userModelFromApi.value?.id
                                            ? chatViewController
                                                    .chatThreads[index]
                                                    .secondPerson
                                                    ?.name ??
                                                ''
                                            : chatViewController
                                                .chatThreads[index]
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
                                                .chatThreads[index].lastMessage ??
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
