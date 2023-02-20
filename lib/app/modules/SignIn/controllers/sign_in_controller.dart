import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/src/response.dart' as http;
import 'package:nb_utils/nb_utils.dart';

// import 'package:http/src/response.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/jwt_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:video_editing_app/constants/api_endpoints_constants.dart';

class SignInController extends GetxController {
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

  Future<void> signIn() async {
    try {
      http.Response response = await buildHttpResponse(
        loginUserEndpoint,
        method: HttpMethod.POST,
        request: {
          'email': emailController.text,
          'password': passworController.text,
        },
      );
      if (response.statusCode == 200) {
        debug('Success');
        debug('Response Body For Sign in is ${response.body}');
        var responseJson = jsonDecode(response.body);
        JwtUtils.jwtToken=responseJson['access'];
        await JwtUtils.setJwtToken(responseJson['access']);
        await JwtUtils.setRefreshToken(responseJson['refresh']);
        await JwtUtils.verifyToken(jwtToken: responseJson['access']);
        sharedPreferences.setString('email', emailController.text);
       Future.delayed(const Duration(seconds: 2),()=>  Get.offAllNamed(Routes.BOTTOM_BAR));
      } else {
        inspect(response);
        inspect(response.request);

        inspect(jsonDecode(response.body));
        toast('${jsonDecode(response.body)['detail']}');
      }
    } on Exception catch (e, stackTrace) {
      e.debugException(stackTrace);
    }
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
