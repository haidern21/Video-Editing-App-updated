import 'package:get/get.dart';

class GetQuoteNineController extends GetxController {
  //TODO: Implement GetQuoteEightController

  var selectedIndex = 1;

  void changeColor(var index) {
    selectedIndex = index;
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
