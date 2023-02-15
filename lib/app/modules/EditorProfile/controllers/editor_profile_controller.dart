import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart'as https;
import 'package:nb_utils/nb_utils.dart';
import '../../../../Utils/debug_utils.dart';
import '../../../../Utils/jwt_utils.dart';
import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../../data/models/editor_model.dart';
import '../../../data/models/user_model.dart';

class EditorProfileController extends GetxController {
  //TODO: Implement EditorProfileController

  bool state = false;
  var changeIcon = false.obs;
  EditorModel userModel= EditorModel();
  var userModelFromApi = Rxn<EditorModel>();
  // void changeState() {
  //   changeIcon = !changeIcon;
  // }

  void changeSwitch(var value) {
    state = value;
    update();
  }

  final count = 0.obs;
  @override
  void onInit() {
    initUserModelFromApi();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  initUserModelFromApi()async{
    try{
      log('being called');
      userModelFromApi.value= (await fetchProfileDataFromApi());
    }catch(e){
      log('No data Available');
    }
  }

  Future<EditorModel?> fetchProfileDataFromApi() async {
    https.Response response = await buildHttpResponse(
      getEditorProfileEndpoint,
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );

    debug('Response: ${response.body}');


    sharedPreferences.setString('user', response.body);

    // try {
    //   await JwtUtils.verifyToken();
      userModel = EditorModel.fromJson(jsonDecode(response.body));
      return userModel;
    // } catch (e) {
    //   Logger().e(e);
    //   return null;
    // }
    // return null;

    // return jsonDecode(response.body);
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
