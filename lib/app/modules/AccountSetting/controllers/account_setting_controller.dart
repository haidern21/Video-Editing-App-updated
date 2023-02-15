import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../BottomProfile/controllers/bottom_profile_controller.dart';

class AccountSettingController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  RxBool showLoader = false.obs;
  String? selectedValue;
  BottomProfileController profileController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final count = 0.obs;

  @override
  void onInit() {
    userNameController.text = profileController.userModelFromApi.value!.name ?? '';
    accountTypeController.text =
        profileController.userModelFromApi.value!.accountType ?? '';
    phoneNumberController.text =
        profileController.userModelFromApi.value!.phoneNumber ?? '';
    super.onInit();
  }

  @override
  void onDispose() {
    super.dispose();
    userNameController.dispose();
    accountTypeController.dispose();
    phoneNumberController.dispose();
    newPasswordController.dispose();
    confirmController.dispose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  updateUserProfile() async {
    http.Response response =
    await buildHttpResponse(
        getUserProfileEndpoint,
        method: HttpMethod.PATCH,
        request: {
          "name":userNameController.text,
          "account_type":accountTypeController.text,
          "phone_number":phoneNumberController.text,
          "password":newPasswordController.text,
        },
        biuldAuthHeader: true);
    await profileController.initUserModelFromApi();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
