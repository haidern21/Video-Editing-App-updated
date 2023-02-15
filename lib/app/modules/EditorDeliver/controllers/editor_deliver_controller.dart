import 'package:get/get.dart';

class EditorDeliverController extends GetxController {
  //TODO: Implement EditorDeliverController

  bool isButtonActive = true;

  void enabledButton() {
    isButtonActive = false;
    update();
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
