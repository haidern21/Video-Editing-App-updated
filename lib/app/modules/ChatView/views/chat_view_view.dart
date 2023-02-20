import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'admin_tab_bar.dart';
import 'chat_view_app_bar.dart';
import 'editor_tab_bar.dart';


class ChatViewView extends StatefulWidget {
  const ChatViewView({Key? key}) : super(key: key);

  @override
  State<ChatViewView> createState() => _ChatViewViewState();
}

class _ChatViewViewState extends State<ChatViewView>
    with TickerProviderStateMixin {
  ChatViewController chatViewController= Get.find();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final sp = MediaQuery.of(context).textScaleFactor;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: ChatViewAppBar(height, width, sp),
        body: TabBarView(
          children: [
            AdminTabBarView(
              width: width,
              height: height,
              sp: sp,
            ),
            EditorTabBarView(
              width: width,
              height: height,
              sp: sp,
              avatars: avatars,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Admin'),
          icon: const Icon(Icons.message),
          onPressed: () async {
            chatViewController.createChatThread('admin@vea.com');
          },
        ),
      ),
    );
  }
}
