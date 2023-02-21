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

import '../../../data/models/user_model.dart';

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
        bool loggedIn=await JwtUtils.verifyToken(jwtToken: responseJson['access']);
        debug('Is UserLogged In: $loggedIn');
        http.Response response1 = await buildHttpResponse(
          getUserProfileEndpoint,
          method: HttpMethod.GET,
          biuldAuthHeader: true,
        );
        UserModel userModel= UserModel.fromMap(jsonDecode(response.body));
        // UserModel userModel= UserModel();
        await Future.delayed(const Duration(seconds: 2));

        if (loggedIn) {
          if(userModel.role=='buyer'){
            Get.offAndToNamed(Routes.BOTTOM_BAR);
          }
          else{
            Get.offAndToNamed(Routes.EDITOR_BOTTOM_BAR);
          }
          // return;
        } else {
          Get.offAndToNamed(Routes.SIGN_SELECTECTION);
          // Get.offAndToNamed(Routes.SIGN_IN);
        }
        sharedPreferences.setString('email', emailController.text);
       // Future.delayed(const Duration(seconds: 2),()=>  Get.offAllNamed(Routes.BOTTOM_BAR));
      } else {
        inspect(response);
        inspect(response.request);

        inspect(jsonDecode(response.body));
        toast('${jsonDecode(response.body)['detail']}');
      }
    } on Exception catch (e, stackTrace) {
      Get.snackbar('Error','Error in authentication');
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
