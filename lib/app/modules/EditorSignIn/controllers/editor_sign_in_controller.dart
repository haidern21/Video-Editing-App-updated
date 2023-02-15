import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditorSignInController extends GetxController {
  //TODO: Implement SignInController
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passworController = TextEditingController();

  final count = 0.obs;
  @override
  void onDispose() {
    emailController.dispose();
    passworController.dispose();
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
