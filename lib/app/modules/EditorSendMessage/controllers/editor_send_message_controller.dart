import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditorSendMessageController extends GetxController {
  TextEditingController msgController = TextEditingController();
  RxString profileImage=''.obs;
  RxString name=''.obs;
  RxInt receiverId=0.obs;
  RxInt threadId=0.obs;
  final count = 0.obs;
  @override
  void onDispose() {
    msgController.dispose();
  }

  @override
  void onInit() {
    getArguments();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getArguments(){
    var args= Get.arguments;
    profileImage.value= args['profile_image']??'';
    name.value=args['name']??'';
    receiverId.value=args['receiverId'];
    threadId.value=args['threadId'];
  }
}
