import 'package:get/get.dart';

class EditorNotificationController extends GetxController {
  //TODO: Implement EditorNotificationController

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
