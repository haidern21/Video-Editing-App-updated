import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_editing_app/app/modules/EditorProfile/controllers/editor_profile_controller.dart';

import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';

class EditorProfileEditController extends GetxController {
  //TODO: Implement EditorProfileEditController
  bool state = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController editorTitle = TextEditingController();
  TextEditingController skillController = TextEditingController();
  RxList<String> skills = <String>[].obs;
  EditorProfileController editorProfileController = Get.find();
  RxString userProfileImage = ''.obs;
  RxList<File> newProfileImage=<File>[].obs;
  RxBool showLoader=false.obs;

  void changeSwitch(var value) {
    state = value;
    update();
  }

  final count = 0.obs;

  @override
  void onInit() {
    nameController.text =
        editorProfileController.userModelFromApi.value?.user?.name ??
            ' user_name';
    editorTitle.text =
        editorProfileController.userModelFromApi.value?.editorTitle ?? '';
    skills.value = editorProfileController.userModelFromApi.value?.skills ?? [];
    userProfileImage.value =
        editorProfileController.userModelFromApi.value?.user?.profilePicture ??
            '';
    super.onInit();
  }

  updateEditorProfile() async {
    editorProfileController.userModelFromApi.value?.user?.name =
        nameController.text;
    editorProfileController.userModelFromApi.value?.editorTitle =
        editorTitle.text;

    http.Response response = await buildHttpResponse(getEditorProfileEndpoint,
        method: HttpMethod.PUT,
        request: {
          "user": {
            "name": nameController.text,
            "email":
                editorProfileController.userModelFromApi.value?.user?.email ??
                    '',
            "phone_number": editorProfileController
                    .userModelFromApi.value?.user?.phoneNumber ??
                '',
            "role":
                editorProfileController.userModelFromApi.value?.user?.role ??
                    '',
            "account_type": editorProfileController
                    .userModelFromApi.value?.user?.accountType ??
                '',
            "profile_picture": editorProfileController
                    .userModelFromApi.value?.user?.profilePicture ??
                '',
            "is_superuser": editorProfileController
                    .userModelFromApi.value?.user?.isSuperuser ??
                false,
          },
          "editor_title": editorTitle.text,
          "skills": <dynamic>{
            ...skills,
            ...editorProfileController.userModelFromApi.value!.skills ?? []
          }.toList()
        },
        biuldAuthHeader: true);
    await editorProfileController.initUserModelFromApi();
  }
  updateUserProfile() async {
    try {
      showLoader.value=true;
      http.Response response =
      await buildHttpResponse(
          getUserProfileEndpoint,
          method: HttpMethod.PATCH,
          request: {
            "name": nameController.text,
            'profile_picture': userProfileImage.value
          },
          biuldAuthHeader: true);
      await editorProfileController.initUserModelFromApi();
      Get.back();
      showLoader.value=false;
    } catch(e){
      showLoader.value=false;
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
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
