import 'package:get/get.dart';
import 'package:video_editing_app/app/routes/app_pages.dart';

class FindAnEditorController extends GetxController {
  //TODO: Implement FindAnEditorController

  final count = 0.obs;
  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration(seconds: 1));
    Get.offAndToNamed(Routes.EDITOR_ALOTTED);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
