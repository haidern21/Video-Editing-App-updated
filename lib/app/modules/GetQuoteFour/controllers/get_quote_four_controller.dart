import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';

class GetQuoteFourController extends GetxController {
  final TextEditingController projectTitleController = TextEditingController();
  final TextEditingController totalVideosController = TextEditingController();
  RxString projectTitle=''.obs;
  RxString videosCount=''.obs;



  Map<String, dynamic> getQuoteFourData = {
    'project_title': null,
    'video_count': null,
  };

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    try {
      if (Get.arguments != null) {
        getQuoteFourData.addAll(Get.arguments);


        debug(
            'Arguments: $getQuoteFourData and type is ${getQuoteFourData.runtimeType}');
        // if (getQuoteFourData is Map) {

        debug('Email is ${getQuoteFourData['email']}');
        // totolVideosController.text = getQuoteFourData['video_count'];
        // }
      }
    } catch (e) {
      debug('Error $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
