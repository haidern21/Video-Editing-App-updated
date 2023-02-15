import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';

class GetQuoteThreeController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();

  RxString userName=''.obs;
  RxString userPhone=''.obs;
  RxString userEmail=''.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();

    try {
      if (sharedPreferences.get('user') != null) {
        UserModel? user =
            UserModel.fromJson(sharedPreferences.getString('user')!);
        emailController.text = user.email ?? '';
        phoneNumberController.text = user.phoneNumber ?? '';
        nameController.text = user.name ?? '';
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
