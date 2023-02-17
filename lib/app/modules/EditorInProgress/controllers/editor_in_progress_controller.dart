import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_editing_app/app/modules/EditorProfile/controllers/editor_profile_controller.dart';
import '../../../../Utils/network_utils.dart';
import '../../../data/models/quote_communication_model.dart';

class EditorInProgressController extends GetxController {
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  RxBool showLoader= false.obs;
  RxList<QuoteCommunicationModel> quoteCommunications = <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> editorMessages = <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> buyerMessages = <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> deliverMessages = <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> revisionMessages = <QuoteCommunicationModel>[].obs;
  EditorProfileController editorProfileController= Get.find();



  Future<List<QuoteCommunicationModel>> fetchAllQuoteCommunications(int quoteId) async {
    List<QuoteCommunicationModel> quoteComs = [];
    http.Response response = await buildHttpResponse(
      'https://video-editing-app.herokuapp.com/api/projects/quotes/$quoteId/communications/',
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        quoteComs.add(QuoteCommunicationModel.fromJson(i));
      }
      return quoteComs;
    } else {
      return quoteComs;
    }
  }

  fetchQuoteCommunicationsList(int quoteId) async {
    try {
      quoteCommunications.clear();
      buyerMessages.clear();
      editorMessages.clear();
      revisionMessages.clear();
      deliverMessages.clear();
      showLoader.value = true;
      quoteCommunications.value = await fetchAllQuoteCommunications(quoteId);
      sortCommunications();
      showLoader.value = false;

      log('quote comm length is: ${quoteCommunications.length}');
    } catch (e) {
      Get.snackbar('Error Occurred in messages',
          'Something went wrong while getting orders. Please try again.');
      showLoader.value = false;
    }
  }

  sortCommunications(){

    for (var com in quoteCommunications){
      if(com.user?.id==editorProfileController.userModelFromApi.value!.user!.id){
        if(com.communicationType=="MESSAGE") {
          editorMessages.add(com);
        }
      }
      else{
        if(com.communicationType=="MESSAGE") {
          buyerMessages.add(com);
        }

      }
    }
    for (var element in quoteCommunications) {
      if(element.communicationType=="SUBMISSION"){
        deliverMessages.add(element);
      }else if (element.communicationType=="REVISION"){
        revisionMessages.add(element);
      }
    }

  }
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
