import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_editing_app/app/data/models/chat_thread_model.dart';
import 'package:video_editing_app/app/data/models/messages_model.dart';

import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../../routes/app_pages.dart';

class ChatViewController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxList<ChatThreadModel> chatThreads = <ChatThreadModel>[].obs;
  RxList<MessageModel> messages = <MessageModel>[].obs;
  RxBool showLoader = false.obs;

  final count = 0.obs;

  @override
  void onInit() {
    fetchThreadsList();
    super.onInit();
  }

  @override
  void onDispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<List<ChatThreadModel>> fetchAllThreads() async {
    List<ChatThreadModel> ordrs = [];
    http.Response response = await buildHttpResponse(
      getAllThreadsEndpoint,
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        ordrs.add(ChatThreadModel.fromJson(i));
      }
      return ordrs;
    } else {
      return ordrs;
    }
  }

  fetchThreadsList() async {
    try {
      showLoader.value = true;
      chatThreads.value = await fetchAllThreads();
      showLoader.value = false;
    } catch (e) {
      Get.snackbar('Error Occurred',
          'Something went wrong while getting Chat threads. Please try again.');
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

  @override
  void onClose() {}

  void increment() => count.value++;
}
