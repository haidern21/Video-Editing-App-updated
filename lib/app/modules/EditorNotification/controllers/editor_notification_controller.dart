import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../Utils/network_utils.dart';
import '../../../data/models/notification_model.dart';

class EditorNotificationController extends GetxController {
  RxBool showLoader = false.obs;
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  final count = 0.obs;

  Future<List<NotificationModel>> fetchAllNotifications() async {
    List<NotificationModel> notis = [];
    http.Response response = await buildHttpResponse(
      'https://video-editing-app.herokuapp.com/api/notifications/notifications/',
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        notis.add(NotificationModel.fromJson(i));
      }
      return notis;
    } else {
      return notis;
    }
  }

  fetchNotificationsList() async {
    try {
      showLoader.value = true;
      notifications.value = await fetchAllNotifications();
      showLoader.value = false;
    } catch (e) {
      Get.snackbar('Error', 'Error occurred while fetching notifications');
    }
  }

  @override
  void onInit() {
    fetchNotificationsList();
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
