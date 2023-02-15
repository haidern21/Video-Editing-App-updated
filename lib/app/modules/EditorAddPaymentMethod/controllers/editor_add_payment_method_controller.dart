import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditorAddPaymentMethodController extends GetxController {
  //TODO: Implement EditorAddPaymentMethodController
  TextEditingController accountypecontroller = TextEditingController();
  TextEditingController accountnumbercontroller = TextEditingController();
  TextEditingController districtcontroller = TextEditingController();
  TextEditingController branchcontroller = TextEditingController();

  String? selectedValue;

  var selectedIndex = -1;

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
  void onDispose() {
    accountypecontroller.dispose();
    accountnumbercontroller.dispose();
    districtcontroller.dispose();
    branchcontroller.dispose();
    super.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
