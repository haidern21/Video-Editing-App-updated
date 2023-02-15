import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/api_endpoints_constants.dart';

class ChangePasswordController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  final phoneNumber = Get.arguments;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {
    passwordController.dispose();
    confirmpasswordController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> changePassword({bool isDebug = false}) async {
    try {
      String phoneNumber = Get.arguments;
      var response = await buildHttpResponse(
        passwordResetEndpoint,
        request: {
          'phone_number': phoneNumber,
          'password': passwordController.text,
        },
        method: HttpMethod.POST,
      );

      if (isDebug) {
        inspect(jsonDecode(response.body));
      }

      if (response.statusCode == 200) {
        // Remove all screens and navigate to login screen
        // Get.offAllNamed(Routes.ACCOUNT_CREATE_SUCCESS);
        Get.offAllNamed(
          Routes.SIGN_IN,
          // arguments: phoneNumber,
        );
      } else {
        toast(jsonDecode(response.body)['detail']);
      }
    } on Exception catch (e, stackTrace) {
      e.debugException(stackTrace);
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
