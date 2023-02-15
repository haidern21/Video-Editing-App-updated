import 'package:get/get.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/jwt_utils.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

class BottomBarController extends GetxController {
  //TODO: Implement BottomBarController

  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    JwtUtils.verifyJwtTokenApi();
  }

  Future<dynamic> checkTokenValidity() async {
    try {
      String? token = await JwtUtils.getJwtToken();
      if (token == null) {
        // Get.offAllNamed(
        //   Routes.SIGN_IN,
        // );
      } else {
        // bool isTokenValid = await JwtUtils.verifyToken();
        // if (!isTokenValid) {
        //   Get.offAllNamed(
        //     Routes.SIGN_IN,
        //   );
        // }
      }
    } catch (e) {
      debug('Error while checking token validity $e');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }
}
