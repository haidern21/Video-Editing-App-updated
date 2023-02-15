import 'package:get/get.dart';

import '../controllers/find_an_editor_controller.dart';

class FindAnEditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FindAnEditorController());
  }
}
