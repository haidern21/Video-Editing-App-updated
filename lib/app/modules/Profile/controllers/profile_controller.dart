import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';

import '../../../../constants/api_endpoints_constants.dart';

class ProfileController extends GetxController {
  final count = 0.obs;
  @override
  void onInit() {
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
