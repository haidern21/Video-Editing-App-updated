import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/api_endpoints_constants.dart';

class ForgotPasswordController extends GetxController {
  //TODO: Implement ForgotPasswordController
  TextEditingController phoneNumberController = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onDispose() {
    phoneNumberController.dispose();
  }

  Future<void> sendOTPRequest({bool isDebug = false}) async {
    try {
      var phoneNumber = phoneNumberController.text;
      if (isDebug) {
        debug('Phone Number: $phoneNumber');
      }
      var response = await buildHttpResponse(
        passwordResetOtpEndpoint,
        request: {
          'phone_number': phoneNumber,
        },
        method: HttpMethod.POST,
      );

      if (isDebug) {
        inspect(jsonDecode(response.body));
      }

      if (response.statusCode == 200) {
        toast('OTP Sent Successfully');
      } else {
        toast('Error While Sending OTP');
      }
    } catch (e, stackTrace) {
      debug('Error $e', stackTrace: stackTrace);
      toast('Error While Sending OTP $e');
      return;
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
