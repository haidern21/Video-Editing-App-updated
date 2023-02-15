import 'package:get/get.dart';

class PaymentAndDepositController extends GetxController {
  //TODO: Implement PaymentAndDepositController

  var selectedShipment = ''.obs;

  void onChange(var shipment) {
    selectedShipment.value = shipment;
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
