import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/GetQuoteFive/controllers/get_quote_five_controller.dart';
import '../../../data/models/quote_model.dart';

class GetQuoteSixController extends GetxController {
  TextEditingController videoDurationController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  TextEditingController descripController = TextEditingController();
  GetQuoteFiveController getQuoteFiveController = Get.find();

  final count = Get.arguments ?? 0.obs;

  // List<QuoteVideos> quoteVideos = [];
  RxInt selectedIndex = 0.obs;
  Map<String, dynamic> getQuoteSixData = {
    'index': null,
    'url': null,
    'description': null,
    'time': null,
  };

  @override
  void onInit() {
    loadData();
    super.onInit();
  }

  loadData() {
    log('load datasss ');
    var data = Get.arguments;
    log('data : $data');
    int index = data;
    log('index : $index');
    int selectedVideoIndex =index;
    videoDurationController.text = getQuoteFiveController.quoteVideos
            .asMap()
            .containsKey(selectedVideoIndex)
        ? getQuoteFiveController.quoteVideos[selectedVideoIndex].numberOfMinutes
            .toString()
        : '';

    urlController.text = getQuoteFiveController.quoteVideos
            .asMap()
            .containsKey(selectedVideoIndex)
        ? getQuoteFiveController.quoteVideos[selectedVideoIndex].googleDriveLink
            .toString()
        : '';

    descripController.text = getQuoteFiveController.quoteVideos
        .asMap()
        .containsKey(selectedVideoIndex)
        ? getQuoteFiveController.quoteVideos[selectedVideoIndex].details
        .toString()
        : '';


    // log('load data ');
    // var data = Get.arguments;
    // int selectedVideoIndex=getQuoteFiveController.quoteVideos.asMap().containsKey(0)?0: -1;
    // // log(getQuoteFiveController.quoteVideos[selectedVideoIndex].numberOfMinutes.toString() );
    //
    //
    // videoDurationController.text =
    //     getQuoteFiveController.quoteVideos.asMap().containsKey(selectedVideoIndex)
    //         ? getQuoteFiveController.quoteVideos[selectedVideoIndex]
    //             .numberOfMinutes
    //             .toString()
    //         : '';
    // urlController.text =
    // getQuoteFiveController.quoteVideos.asMap().containsKey(selectedVideoIndex)
    //     ?getQuoteFiveController. quoteVideos[selectedVideoIndex]
    //     .googleDriveLink
    //     .toString()
    //     : '';
    // log('controller : ${videoDurationController.text}');

    // log( quoteVideos[selectedVideoIndex]
    //     .googleDriveLink
    //     .toString());
  }

  //
  // loadData(){
  //   try {
  //     if (Get.arguments != null) {
  //       getQuoteSixData.addAll(Get.arguments);
  //
  //       videoDurationController.text=getQuoteSixData['time'];
  //       urlController.text=getQuoteSixData['url'];
  //       print(getQuoteSixData['index']);
  //       descripController.text=getQuoteSixData['description'];
  //       debug(
  //           'Arguments: $getQuoteSixData and type is ${getQuoteSixData.runtimeType}');
  //       // if (getQuoteFourData is Map) {
  //
  //       debug('Email is ${getQuoteSixData['email']}');
  //       // totolVideosController.text = getQuoteFourData['video_count'];
  //       // }
  //     }
  //   } catch (e) {
  //     debug('Error $e');
  //   }
  // }

  @override
  void onDispose() {
    videoDurationController.dispose();
    urlController.dispose();
    descripController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
