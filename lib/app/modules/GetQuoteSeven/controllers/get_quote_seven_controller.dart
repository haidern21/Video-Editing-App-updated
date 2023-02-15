import 'package:get/get.dart';

class GetQuoteSevenController extends GetxController {
  RxBool colorGrading=false.obs;
  RxBool animations=false.obs;
  RxBool customSubtitles=false.obs;
  RxBool specialEffects=false.obs;
  RxBool copyrightFree=false.obs;
  RxBool transition=false.obs;
  RxBool motionGraphics=false.obs;



  final count = 0.obs;
  @override
  void onInit() {
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
