import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetQuoteEightController extends GetxController {
  RxBool vertical=false.obs;
  RxBool horizontal=false.obs;
  RxBool square=false.obs;
  RxBool allOfAbove=false.obs;

  String getValue = '';
  loadData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    getValue = sp.getString('buttonText') ?? '';
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
