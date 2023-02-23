import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/BottomProfile/controllers/bottom_profile_controller.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/modules/InProgress/controllers/web_socket_controller.dart';
import 'package:video_editing_app/constants/colors.dart';
import '../../../../constants/weight.dart';
import '../../../../main.dart';
import '../../../../widgets/my_text.dart';
import '../controllers/send_message_controller.dart';

class SendMessageView extends GetView<SendMessageController> {
  const SendMessageView({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;
    ChatViewController chatViewController = Get.find();
    BottomProfileController bottomProfileController = Get.find();
    WebSocketController webSocketController = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xffF9F9FB),
          leading: GestureDetector(
            onTap: () => Get.back(),
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 15,
              color: kblack,
            ),
          ),
          title: SizedBox(
            height: height * 0.07,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FittedBox(
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(
                            controller.profileImage?.value ?? emptyUserImage),
                      ),
                      SizedBox(
                        width: width / 35,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyText(
                            text: controller.name.value,
                            size: 14 * sp,
                            weight: ksix,
                            color: kgrey8,
                          ),
                          SizedBox(height: height * 0.006),
                          MyText(
                            text: "Online",
                            size: 10 * sp,
                            weight: kfour,
                            color: kcomplete,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          actions: const [
            Icon(
              Icons.more_vert,
              color: kblack,
              size: 30,
            )
          ],
        ),
        body: Stack(
          children: [
            Obx(
              () => Padding(
                padding:  EdgeInsets.only(bottom: height * 0.098),
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Obx((){
                       return  chatViewController.messages[index].user?.id ==
                            bottomProfileController.userModelFromApi.value?.id
                            ? messageTile(height, width, sp,
                            receiveText:
                            chatViewController.messages[index].message ??
                                '',
                            profileImage: bottomProfileController
                                .userModelFromApi.value?.profilePicture ??
                                emptyUserImage)
                            : sendMsg(
                          height,
                          width,
                          sp,
                          message:
                          chatViewController.messages[index].message ??
                              '',
                        );
                      });
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: height * 0.019,
                      );
                    },
                    itemCount: chatViewController.messages.length),
              ),
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.0095, horizontal: width / 20),
                  height: height * 0.098,
                  width: width,
                  color: kwhite,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.06,
                        width: width * 0.78,
                        child: TextFormField(
                          controller: controller.msgController,
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
                            hintText: 'Type your message',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide:
                                  const BorderSide(color: kgrey3, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide:
                                  const BorderSide(color: kgrey3, width: 1.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.0),
                              borderSide:
                                  const BorderSide(color: kgrey3, width: 1.0),
                            ),
                            suffixIcon: FittedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/icons/upload.svg',
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                'assets/icons/smile.svg',
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: width * 0.022),
                      InkWell(
                          onTap: () {
                            if (controller.msgController.text.isNotEmpty) {
                              webSocketController.sendThreadMessage(
                                  message: controller.msgController.text,
                                  currentUserId: bottomProfileController
                                          .userModelFromApi.value?.id ??
                                      0,
                                  sentTo: controller.receiverId.value,
                                  threadId: controller.threadId.value);
                              controller.msgController.clear();
                            }
                          },
                          child: SvgPicture.asset('assets/icons/frwrd.svg'))
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  messageTile(
    double height,
    double width,
    double sp, {
    required String receiveText,
    required String? profileImage,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            height: height * 0.067,
            padding: EdgeInsets.symmetric(horizontal: width / 25),
            decoration: BoxDecoration(
              color: kprimaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: MyText(
                text: receiveText,
                size: 14 * sp,
                weight: kfour,
                color: kwhite,
              ),
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: NetworkImage(profileImage ?? emptyUserImage),
          )
        ],
      ),
    );
  }

  sendMsg(double height, double width, double sp, {required String message}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 15,
            backgroundImage:
                NetworkImage(controller.profileImage?.value ?? emptyUserImage),
          ),
          SizedBox(
            width: width * 0.02,
          ),
          Container(
            height: height * 0.067,
            padding: EdgeInsets.symmetric(horizontal: width / 25),
            decoration: BoxDecoration(
              color: const Color(0xffF2F4F5),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: MyText(
                text: message,
                size: 14 * sp,
                weight: kfour,
                color: kblack,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
