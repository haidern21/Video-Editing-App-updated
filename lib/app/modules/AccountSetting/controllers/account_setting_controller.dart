import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_editing_app/main.dart';
import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../BottomProfile/controllers/bottom_profile_controller.dart';

class AccountSettingController extends GetxController {
  TextEditingController userNameController = TextEditingController();
  TextEditingController accountTypeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
  RxString userProfileImage = ''.obs;
  RxBool showLoader = false.obs;
  String? selectedValue;
  BottomProfileController profileController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxList<File> newProfileImage=<File>[].obs;

  final count = 0.obs;

  @override
  void onInit() {
    userNameController.text =
        profileController.userModelFromApi.value!.name ?? '';
    accountTypeController.text =
        profileController.userModelFromApi.value!.accountType ?? '';
    phoneNumberController.text =
        profileController.userModelFromApi.value!.phoneNumber ?? '';
    userProfileImage.value =
        profileController.userModelFromApi.value!.profilePicture ??
            emptyUserImage;
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
    try {
      showLoader.value = true;
      http.Response response = await buildHttpResponse(getUserProfileEndpoint,
          method: HttpMethod.PATCH,
          request: {
            "name": userNameController.text,
            "account_type": accountTypeController.text,
            "phone_number": phoneNumberController.text,
            "password": newPasswordController.text,
            "profile_picture": userProfileImage.value
          },
          biuldAuthHeader: true);
      await profileController.initUserModelFromApi();
      Get.back();
      showLoader.value = false;
    } catch (e) {
      showLoader.value = false;
      Get.snackbar('Error', 'Error in updating profile');
    }
  }

  Future<String> uploadImageAndGetDownloadUrl(File image) async {
    var reference = FirebaseStorage.instance.ref(
        'users/profile-images/');
    await reference.putFile(image);
    String download = await reference.getDownloadURL();
    return download;
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
