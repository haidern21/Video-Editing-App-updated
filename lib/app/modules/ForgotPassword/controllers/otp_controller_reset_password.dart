import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/api_endpoints_constants.dart';

/// Create Getx Controller for this screen
///
class OtpResetPasswordController extends GetxController {
  final TextEditingController otpController = TextEditingController();
  final phoneNumber = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> verifyOtp({bool isDebug = false}) async {
    try {
      // String phoneNumber = Get.arguments;
      var response = await buildHttpResponse(
        passwordResetOtpVerifyEndpoint,
        request: {
          'phone_number': phoneNumber,
          'code': otpController.text,
        },
        method: HttpMethod.POST,
      );

      if (isDebug) {
        inspect(jsonDecode(response.body));
      }

      if (response.statusCode == 200) {
        Get.toNamed(
          Routes.CHANGE_PASSWORD,
          arguments: phoneNumber,
        );
      } else {
        toast(jsonDecode(response.body)['detail']);
      }
    } on Exception catch (e, stackTrace) {
      e.debugException(stackTrace);
    }
  }

  @override
  void onClose() {
    otpController.dispose();
  }
}
