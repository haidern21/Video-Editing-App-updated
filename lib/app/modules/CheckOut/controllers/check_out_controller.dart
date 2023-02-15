import 'package:get/get.dart';

class CheckOutController extends GetxController {
  var selectedShipment = ''.obs;
  var selectedShipmenttwo = ''.obs;

  String _orderType = 'home delivery';
  String get orderType => _orderType;

  void setOrderType(String type) {
    _orderType = type;
    update();
  }

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
