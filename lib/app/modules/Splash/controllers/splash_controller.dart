import 'dart:convert';

import 'package:get/get.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/jwt_utils.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';
import 'package:http/http.dart' as http;
import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';

class SplashController extends GetxController {

  final count = 0.obs;
  @override
  void onInit() async {

    /// Verify this TOken and let user go Home Page
    bool loggedIn = await JwtUtils.verifyToken();

    debug('Is UserLogged In: $loggedIn');
    http.Response response = await buildHttpResponse(
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
