import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddNewCardController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController cardnumberController = TextEditingController();
  TextEditingController expirydateController = TextEditingController();
  TextEditingController cvvnumberController = TextEditingController();
  TextEditingController expiry = TextEditingController();
  RxBool showLoader=false.obs;

  var checkbool = false.obs;

  void dobChanged(DateTime? date) {
    if (date != null) {
      expiry.text = date.toString().split(' ')[0];
    }
    update();
  }

  final count = 0.obs;
  @override
  void onDispose() {
    cardnumberController.dispose();
    cvvnumberController.dispose();
    cardNameController.dispose();

    expirydateController.dispose();
    cvvnumberController.dispose();
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
  void onClose() {
    super.onClose();
  }
}
