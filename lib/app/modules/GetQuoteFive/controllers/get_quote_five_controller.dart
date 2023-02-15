// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';

import '../../../data/models/quote_model.dart';

class GetQuoteFiveController extends GetxController {
  int totalVideos = 1.obs.value;

  int selectedIndex = -1;
  List<int> selectedVideos = [];
  bool click = false;
  Map<String, dynamic> getQuoteDate = {};
  RxList<QuoteVideos> quoteVideos=<QuoteVideos>[].obs;

  // void onInit() {
  @override
  void onInit() {
    super.onInit();

    debug('GetQuoteFiveController onInit() called');

    try {
      if (Get.arguments != null) {
        getQuoteDate.addAll(Get.arguments);

        debug(
            'Arguments: $getQuoteDate and type is ${getQuoteDate.runtimeType}');
        // if (getQuoteFourData is Map) {

        debug('Email is ${getQuoteDate['email']}');
        // totolVideosController.text = getQuoteFourData['video_count'];
        // }

        totalVideos = int.parse(getQuoteDate['video_count']);
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

  void changeIconMethod() {
    update();
  }

  void changeColor(var index) {
    selectedIndex = index;
    selectedVideos.add(selectedIndex);
    selectedVideos.toSet().toList();
    click = !click;
    update();
  }

  final count = 0.obs;
}
