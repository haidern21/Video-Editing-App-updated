import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_editing_app/app/modules/EditorChats/controllers/editor_chats_controller.dart';
import 'package:video_editing_app/app/modules/EditorProfile/controllers/editor_profile_controller.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/colors.dart';
import 'package:video_editing_app/constants/weight.dart';
import 'package:video_editing_app/widgets/my_text.dart';

class EditorChatsView extends StatefulWidget {
  const EditorChatsView({Key? key}) : super(key: key);

  @override
  State<EditorChatsView> createState() => _EditorChatsViewState();
}

class _EditorChatsViewState extends State<EditorChatsView>
    with TickerProviderStateMixin {
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
  EditorChatsController editorChatsController = Get.find();
  EditorProfileController editorProfileController = Get.find();
  double width = Get.width;
  double height = Get.height;
  final sp = Get.textScaleFactor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF9F9FB),
          leading: Padding(
            padding: EdgeInsets.only(top: height * 0.04, left: width * 0.02),
            child: Image.asset('assets/icons/smallLogo.png'),
          ),
          actions: [
            GestureDetector(
              onTap: () {
                Get.toNamed(Routes.EDITOR_NOTIFICATION);
              },
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.04, right: width / 25),
                child: SvgPicture.asset('assets/icons/notification.svg'),
              ),
            )
          ],
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: const BorderSide(width: 2.0, color: kprimaryColor),
              insets: EdgeInsets.symmetric(horizontal: width * 0.05),
            ),
            indicatorColor: kprimaryColor,
            labelStyle:
                TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
            labelColor: kprimaryColor,
            unselectedLabelColor: kgrey8,
            unselectedLabelStyle:
                TextStyle(color: kgrey8, fontWeight: ksix, fontSize: 14 * sp),
            tabs: const [
              Tab(
                text: 'Admin',
              ),
              Tab(
                text: 'Clients',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [adminChatView(), clientChatsView()],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Admin'),
          icon: const Icon(Icons.message),
          onPressed: () async {
            editorChatsController.createChatThread('admin@vea.com');
          },
        ),
      ),
    );
  }

  Widget adminChatView() {
    return RefreshIndicator(
      onRefresh: () async {
        editorChatsController.fetchChatThreadsList();
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
              () => editorChatsController.adminChatThreads.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: editorChatsController.adminChatThreads.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await editorChatsController.getMessagesList(
                                editorChatsController
                                        .adminChatThreads[index].id ??
                                    0);
                            String? name = editorChatsController
                                        .adminChatThreads[index]
                                        .firstPerson
                                        ?.id ==
                                    editorProfileController
                                        .userModelFromApi.value?.user?.id
                                ? editorChatsController.adminChatThreads[index]
                                        .secondPerson?.name ??
                                    ''
                                : editorChatsController
                                    .adminChatThreads[index].firstPerson?.name;
                            String? profileImage = editorChatsController
                                        .adminChatThreads[index]
                                        .firstPerson
                                        ?.id ==
                                    editorProfileController
                                        .userModelFromApi.value?.user?.id
                                ? editorChatsController.adminChatThreads[index]
                                        .secondPerson?.profilePicture ??
                                    ''
                                : editorChatsController.adminChatThreads[index]
                                    .firstPerson?.profilePicture;

                            int receiverId = editorChatsController
                                        .adminChatThreads[index]
                                        .firstPerson
                                        ?.id ==
                                    editorProfileController
                                        .userModelFromApi.value?.user?.id
                                ? editorChatsController.adminChatThreads[index]
                                        .secondPerson?.id ??
                                    0
                                : editorChatsController.adminChatThreads[index]
                                        .firstPerson?.id ??
                                    0;
                            int threadId = editorChatsController
                                    .adminChatThreads[index].id ??
                                0;
                            Get.toNamed(Routes.EDITOR_SEND_MESSAGE, arguments: {
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
                                            text: editorChatsController
                                                        .adminChatThreads[index]
                                                        .firstPerson
                                                        ?.id ==
                                                    editorProfileController
                                                        .userModelFromApi
                                                        .value
                                                        ?.user
                                                        ?.id
                                                ? editorChatsController
                                                        .adminChatThreads[index]
                                                        .secondPerson
                                                        ?.name ??
                                                    ''
                                                : editorChatsController
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
                                            text: editorChatsController
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
                                    text: editorChatsController
                                        .adminChatThreads[index].timestamp
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
                      child: Text('No available chats'),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget clientChatsView() {
    return RefreshIndicator(
      onRefresh: () async {
        editorChatsController.fetchChatThreadsList();
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
                  itemCount: editorChatsController.clientsChatThreads.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await editorChatsController.getMessagesList(
                            editorChatsController.clientsChatThreads[index].id ?? 0);
                        String? name = editorChatsController
                                    .clientsChatThreads[index].firstPerson?.id ==
                                editorProfileController
                                    .userModelFromApi.value?.user?.id
                            ? editorChatsController
                                    .clientsChatThreads[index].secondPerson?.name ??
                                ''
                            : editorChatsController
                                .clientsChatThreads[index].firstPerson?.name;
                        String? profileImage = editorChatsController
                                    .clientsChatThreads[index].firstPerson?.id ==
                                editorProfileController
                                    .userModelFromApi.value?.user?.id
                            ? editorChatsController.clientsChatThreads[index]
                                    .secondPerson?.profilePicture ??
                                ''
                            : editorChatsController
                                .clientsChatThreads[index].firstPerson?.profilePicture;
                        int receiverId = editorChatsController
                                    .clientsChatThreads[index].firstPerson?.id ==
                                editorProfileController
                                    .userModelFromApi.value?.user?.id
                            ? editorChatsController
                                    .clientsChatThreads[index].secondPerson?.id ??
                                0
                            : editorChatsController
                                    .clientsChatThreads[index].firstPerson?.id ??
                                0;
                        int threadId =
                            editorChatsController.clientsChatThreads[index].id ?? 0;
                        Get.toNamed(Routes.EDITOR_SEND_MESSAGE, arguments: {
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
                                    backgroundImage: AssetImage(avatars[index]),
                                  ),
                                  SizedBox(
                                    width: width / 40,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Obx(
                                        () => MyText(
                                          text: editorChatsController
                                                      .clientsChatThreads[index]
                                                      .firstPerson
                                                      ?.id ==
                                                  editorProfileController
                                                      .userModelFromApi
                                                      .value
                                                      ?.user
                                                      ?.id
                                              ? editorChatsController
                                                      .clientsChatThreads[index]
                                                      .secondPerson
                                                      ?.name ??
                                                  ''
                                              : editorChatsController
                                                  .clientsChatThreads[index]
                                                  .firstPerson
                                                  ?.name,
                                          size: 14 * sp,
                                          weight: kfour,
                                          color: const Color(0xff31383C),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.003,
                                      ),
                                      Obx(
                                        () => MyText(
                                          text: editorChatsController
                                                  .clientsChatThreads[index]
                                                  .lastMessage ??
                                              '',
                                          size: 14 * sp,
                                          weight: kfour,
                                          // weight: index == 0 ? ksix : kfour,
                                          color: const Color(0xff31383C),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            FittedBox(
                              child: MyText(
                                text: editorChatsController
                                    .clientsChatThreads[index].timestamp
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
