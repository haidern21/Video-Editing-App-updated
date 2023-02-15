import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/app/data/authentication/signup_api_handler.dart';
import 'package:video_editing_app/app/data/hive/hive_signup_data.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/api_endpoints_constants.dart';
import 'package:video_editing_app/constants/app_constants.dart';

/// add getx Controller boilerplate code
///
class OtpController extends GetxController {
  final phoneNumber = ''.obs;

  final signUpData = <String, dynamic>{
    "name":" haider",
    "role": "buyer"
  }.obs;

  final TextEditingController otpController = TextEditingController();


  @override
  void onInit() {
    super.onInit();

    try {
      debug('Here');

      /// Capture the PhoneNumber from the previous screen or Hive Db
      getTempSignUpDataFromStorage().then((Map<String, dynamic>? signUpData) {
        if (signUpData != null) {
          if (signUpData.containsKey('phone_number')) {
            phoneNumber.value = signUpData['phone_number'];

            this.signUpData.value = signUpData;

            /// Send First OTP Request and then verify the OTP

            sendOTPRequest(
              signUpData['phone_number'],
            );
          }
        }
        return null;
      });
    } on Exception catch (e, stack) {
      e.debugException(stack);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  Future<void> verifyOtp({required Map<dynamic,dynamic> userMap}) async {
    hideKeyboard(context);

    /// First Get the PhoneNumber from
    await buildHttpResponse(signupOTPVerifyEndpoint,
        method: HttpMethod.POST,
        request: {
          'phone_number': phoneNumber.value,
          'code': otpController.text,
        }).then((response) async {
      if (response.statusCode == 200) {
        // now send signup request
        //
        var signupResponse = await buildHttpResponse(
          signupUserEndpoint,
          method: HttpMethod.POST,
          request: userMap,
        );

        if (signupResponse.statusCode == 200 ||
            signupResponse.statusCode == 201) {
          toast('Signup Successful');
          Get.offAllNamed(Routes.SIGN_IN);
        }

        /// Otp Verified Successfully
        toast(
          jsonDecode(response.body)['detail'],
        );

        /// Redirect User to Verify OTP Screen
        ///
      } else {
        inspect(response.headers);
        toast(jsonDecode(response.body)['detail']);
      }
    });
  }

  @override
  void onClose() {}
}
