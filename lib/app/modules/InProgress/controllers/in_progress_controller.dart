import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/app/modules/BottomProfile/controllers/bottom_profile_controller.dart';
import '../../../../Utils/debug_utils.dart';
import '../../../../Utils/network_utils.dart';
import '../../../data/models/quote_communication_model.dart';

class InProgressController extends GetxController {
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  RxBool showLoader = false.obs;
  RxList<QuoteCommunicationModel> quoteCommunications =
      <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> editorMessages =
      <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> buyerMessages =
      <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> deliverMessages = <QuoteCommunicationModel>[].obs;
  RxList<QuoteCommunicationModel> revisionMessages = <QuoteCommunicationModel>[].obs;
  BottomProfileController bottomProfileController = Get.find();

  Future<List<QuoteCommunicationModel>> fetchAllQuoteCommunications(
      int quoteId) async {
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
    } catch (e) {
      Get.snackbar('Error Occurred in messages',
          'Something went wrong while getting orders. Please try again.');
      showLoader.value = false;
    }
  }

  sortCommunications() {
    for (var com in quoteCommunications) {
      if (com.user?.id == bottomProfileController.userModelFromApi.value?.id &&com.communicationType=="MESSAGE") {
        if(com.communicationType=="MESSAGE") {
          buyerMessages.add(com);
        }

      } else {
        if(com.communicationType=="MESSAGE") {
          editorMessages.add(com);
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

  completeOrder(int quoteId)async{
    try {
      http.Response response = await buildHttpResponse(
          'https://video-editing-app.herokuapp.com/api/projects/quotes/$quoteId/mark-as-completed/',
          method: HttpMethod.PUT,biuldAuthHeader: true);

      if (response.statusCode == 200) {
        Get.snackbar('Order Accepted','You have accepted the order');

        toast(
          jsonDecode(response.body),
        );
      }
    } on Exception catch (e, stack) {
      debug(
        'Caught Error $e',
        stackTrace: stack,
      );
      toast('Error $e');
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
