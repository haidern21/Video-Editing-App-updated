import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditorSignUpController extends GetxController {
  //TODO: Implement SignUpController
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();

  final count = 0.obs;
  @override
  void onDispose() {
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    accountTypeController.dispose();
  }

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
