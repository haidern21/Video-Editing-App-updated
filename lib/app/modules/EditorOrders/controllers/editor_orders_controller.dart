import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:get/get.dart';

import '../../../../Utils/network_utils.dart';
import '../../../../constants/api_endpoints_constants.dart';
import '../../../data/models/order_model.dart';
import '../../../data/models/quote_model.dart';

class EditorOrdersController extends GetxController {
  RxList<OrderModel> orders = <OrderModel>[].obs;
  RxList<OrderModel> pendingOrders = <OrderModel>[].obs;
  RxList<OrderModel> inProgressOrders = <OrderModel>[].obs;
  RxList<OrderModel> completedOrders = <OrderModel>[].obs;
  RxBool showLoader = false.obs;
  var selectedOrder = Rxn<QuoteModel>();
  RxInt selectedIndex = 0.obs;

  void changeColor(var index) {
    selectedIndex.value = index;
    update();
  }

  final count = 0.obs;
  Future<List<OrderModel>> fetchAllOrders() async {
    List<OrderModel> ordrs = [];
    http.Response response = await buildHttpResponse(
      getEditorOrdersEndpoints,
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    List data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        ordrs.add(OrderModel.fromJson(i));
      }
      return ordrs;
    } else {
      return ordrs;
    }
  }

  fetchOrdersList() async {
    try {
      showLoader.value = true;
      orders.value = await fetchAllOrders();
      showLoader.value = false;
    } catch (e) {
      Get.snackbar('Error Occurred',
          'Something went wrong while getting orders. Please try again.');
      showLoader.value = false;
    }
    if (orders.isNotEmpty) {
      try {
        sortAllOrders();
      } catch (e) {
        log('Unable to sort orders list');
      }
    }
  }

  sortAllOrders() {
    for (var order in orders) {
      if (order.getStatusDisplay == 'Quote Pending') {
        pendingOrders.add(order);
      }
    }

    for (var order in orders) {
      if (order.getStatusDisplay == 'In Progress') {
        inProgressOrders.add(order);
      }
    }

    for (var order in orders) {
      if (order.getStatusDisplay == 'Completed') {
        completedOrders.add(order);
      }
    }
  }

  Future<QuoteModel> getSpecificOrder(int quoteId) async {
    QuoteModel temp = QuoteModel();
    http.Response response = await buildHttpResponse(
      'https://video-editing-app.herokuapp.com/api/projects/quotes/$quoteId/',
      method: HttpMethod.GET,
      biuldAuthHeader: true,
    );
    temp = QuoteModel.fromJson(json.decode(response.body));
    return temp;
  }

  getOrderModel(int quoteId) async {
    try {
      selectedOrder.value = await getSpecificOrder(quoteId);
    }
    catch (e) {
      log('Problem is: ${e.toString()}');
    }
  }
  @override
  void onInit() {
    fetchOrdersList();
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
