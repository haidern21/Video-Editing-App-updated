import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:video_editing_app/Utils/debug_utils.dart';
import 'package:video_editing_app/Utils/network_utils.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';
import '../../../../Utils/jwt_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';

class BottomProfileController extends GetxController {
  final count = 0.obs;

  late UserModel userModel = UserModel();
  var userModelFromApi = Rxn<UserModel>();
  @override
  void onInit() {
    super.onInit();
    // if (sharedPreferences.containsKey('user')) {
    //
    //   userModel = UserModel.fromJson(
    //     sharedPreferences.getString('user')??'',
    //   );
    // }
    initUserModelFromApi();


  }

  initUserModelFromApi()async{
    log('being called');
    userModelFromApi.value= (await fetchProfileDataFromApi());
  }

  Future<UserModel?> fetchProfileDataFromApi() async {
    https.Response response = await buildHttpResponse(
      getUserProfileEndpoint,
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );

    debug('Response: ${response.body}');

    // if (response.statusCode != 200) {
    //   // toast('Error while fetching profile data');
    //   Get.offAndToNamed(Routes.SIGN_IN);
    // }

    sharedPreferences.setString('user', response.body);

    try {
      await JwtUtils.verifyToken();
      userModel = UserModel.fromMap(jsonDecode(response.body));
      return userModel;
    } catch (e) {
      Logger().e(e);
      return null;
    }
    // return null;

    // return jsonDecode(response.body);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
