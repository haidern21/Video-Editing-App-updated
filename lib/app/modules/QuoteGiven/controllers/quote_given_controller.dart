import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:video_editing_app/app/modules/Order/views/order_view.dart';

import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../../routes/app_pages.dart';

class QuoteGivenController extends GetxController {
  RxBool visibleContainer = true.obs;

  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  quoteAccepted(int quoteId) async {
    try {
      http.Response response = await buildHttpResponse(
          'https://video-editing-app.herokuapp.com/api/projects/quotes/$quoteId/accept/',
          method: HttpMethod.PUT,
          biuldAuthHeader: true);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  quoteRejected(int quoteId) async {
    try {
      http.Response response = await buildHttpResponse(
          'https://video-editing-app.herokuapp.com/api/projects/quotes/$quoteId/reject/',
          method: HttpMethod.PUT,
          biuldAuthHeader: true);
      Get.snackbar(
          'Quote Rejected', 'A new Quote will be given to you in short');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
