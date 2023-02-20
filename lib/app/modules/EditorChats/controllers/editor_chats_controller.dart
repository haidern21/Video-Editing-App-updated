import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/app/data/models/chat_thread_model.dart';

import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../../data/models/messages_model.dart';

class EditorChatsController extends GetxController {
  final count = 0.obs;
  RxList<ChatThreadModel> chatThreads = <ChatThreadModel>[].obs;
  RxList<ChatThreadModel> adminChatThreads = <ChatThreadModel>[].obs;
  RxList<ChatThreadModel> clientsChatThreads = <ChatThreadModel>[].obs;
  RxList<MessageModel> messages = <MessageModel>[].obs;
  RxBool showLoader = false.obs;

  Future<List<ChatThreadModel>> fetchAllChatThreads() async {
    List<ChatThreadModel> tempThreads = [];
    http.Response response = await buildHttpResponse(
      getChatThreads,
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        tempThreads.add(ChatThreadModel.fromJson(i));
      }
      return tempThreads;
    } else {
      return tempThreads;
    }
  }

  fetchChatThreadsList() async {
    try {
      showLoader.value = true;
      chatThreads.value = await fetchAllChatThreads();
      sortChatThreads();
      showLoader.value = false;

      log('The length of chat thread  is ; ${chatThreads.length}');
    } catch (e) {
      Get.snackbar('Error Occurred',
          'Something went wrong while getting orders. Please try again.');
      showLoader.value = false;
    }
  }

  Future<List<MessageModel>> getTwoUsersChat(int threadId) async {
    List<MessageModel> msgs = [];
    http.Response response = await buildHttpResponse(
      'https://video-editing-app.herokuapp.com/api/chat/threads/$threadId/',
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        msgs.add(MessageModel.fromJson(i));
      }
      return msgs;
    } else {
      return msgs;
    }
  }

  getMessagesList(int threadId) async {
    try {
    showLoader.value = true;
    messages.value = await getTwoUsersChat(threadId);
    showLoader.value = false;

    } catch (e) {
      Get.snackbar('Error Occurred',
          'Something went wrong while getting messages. Please try again.');
      showLoader.value = false;
    }
  }

  sortChatThreads(){
    adminChatThreads.clear();
    clientsChatThreads.clear();
    for(var element in chatThreads){
      if(element.isWithAdmin==true){
        adminChatThreads.add(element);
      }
      else{
        clientsChatThreads.add(element);
      }
    }
  }

  createChatThread(String email) async {
    http.Response response = await buildHttpResponse(
      'https://video-editing-app.herokuapp.com/api/chat/get-thread/$email/',
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    if (response.statusCode == 200) {
      Fluttertoast.showToast(msg: 'Thread created');
    } else {
      // var body = jsonDecode(response.body);
      // Fluttertoast.showToast(msg: body['details']);
    }
    fetchChatThreadsList();
  }

  @override
  void onInit() {
    fetchChatThreadsList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
