import 'package:get/get.dart';

class ProjectDetailsController extends GetxController {
  //TODO: Implement ProjectDetailsController

  RxBool visibleContainer = false.obs;

  void visible() {
    visibleContainer.value = true;
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
