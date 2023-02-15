import 'package:get/get.dart';

class EditorProjectDetailsController extends GetxController {
  //TODO: Implement ProjectDetailsController

  bool visibleContainer = false;

  void visible() {
    visibleContainer = true;
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
