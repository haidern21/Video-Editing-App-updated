import 'package:get/get.dart';
import 'package:video_editing_app/app/data/models/pakage_model.dart';
import 'package:video_editing_app/app/modules/GetQuote/controllers/get_quote_controller.dart';

class GetQuoteTwoController extends GetxController {
  //TODO: Implement GetQuoteTwoController

  final count = 0.obs;
  GetQuoteController getQuoteController = Get.find();
  PackageModel packageModel = PackageModel();

  @override
  void onInit() {
    packageModel = getQuoteController.selectedPackageModel;
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
