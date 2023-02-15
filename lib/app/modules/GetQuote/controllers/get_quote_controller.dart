import 'dart:convert';
import 'package:get/get.dart';
import 'package:video_editing_app/app/data/models/pakage_model.dart';
import 'package:http/http.dart' as http;
import '../../../../Utils/network_utils.dart';
import '../views/get_quote_view.dart';

class GetQuoteController extends GetxController {
  RxList<PackageModel> packages = <PackageModel>[].obs;
  RxBool showLoader= false.obs;
  final count = 0.obs;
  PackageModel selectedPackageModel= PackageModel();

  Future<List<PackageModel>> fetchPackageForCategory(int categoryId) async {
    List<PackageModel> pkgs = [];
    http.Response response = await buildHttpResponse(
      'https://video-editing-app.herokuapp.com/api/projects/${categoryId.toString()}/packages/',
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        pkgs.add(PackageModel.fromJson(i));
      }
      return pkgs;
    } else {
      return pkgs;
    }
  }

  @override
  void onInit() {
    getPackagesList(
        homeController.selectedCategoryId.value);
    super.onInit();
  }

  getPackagesList(int id) async {
    try{
      showLoader.value=true;
      packages.value = await fetchPackageForCategory(id);
      showLoader.value=false;
    }catch(e){
      showLoader.value=false;
      Get.snackbar('Error Occurred', 'Something went wrong while getting package. Please try again.');
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
