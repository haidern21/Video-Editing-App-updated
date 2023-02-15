import 'dart:convert';

import 'package:get/get.dart';

import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../../data/models/category_model.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  RxList<CategoryModel> categories = <CategoryModel>[].obs;

  final count = 0.obs;
  RxBool showLoader = false.obs;
  RxInt selectedCategoryId = 0.obs;

  Future<List<CategoryModel>> fetchAllCategories() async {
    List<CategoryModel> cats = [];
    http.Response response = await buildHttpResponse(
      getCategories,
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        cats.add(CategoryModel.fromJson(i));
      }
      return cats;
    } else {
      return cats;
    }
  }

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  fetchCategories() async {
    try {
      showLoader.value = true;
      categories.value = await fetchAllCategories();
      showLoader.value = false;
    } catch (e) {
      Get.snackbar('Error Occurred',
          'Something went wrong while getting categories. Please try again.');
      showLoader.value = false;
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
