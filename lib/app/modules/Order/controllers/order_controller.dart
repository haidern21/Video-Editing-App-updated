import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:video_editing_app/app/data/models/quote_model.dart';
import 'package:video_editing_app/constants/api_endpoints_constants.dart';
import '../../../../Utils/network_utils.dart';
import '../../../data/models/order_model.dart';

class OrderController extends GetxController {
  RxList<OrderModel> orders = <OrderModel>[].obs;
  RxList<OrderModel> pendingOrders = <OrderModel>[].obs;
  RxList<OrderModel> inProgressOrders = <OrderModel>[].obs;
  RxList<OrderModel> completedOrders = <OrderModel>[].obs;
  RxList<OrderModel> quotedGivenOrders = <OrderModel>[].obs;
  RxBool showLoader = false.obs;
  var selectedOrder = Rxn<QuoteModel>();

  RxInt selectedIndex = 0.obs;

  void changeColor(var index) {
    selectedIndex.value = index;
    update();
  }

  Future<List<OrderModel>> fetchAllOrders() async {
    pendingOrders.clear();
    inProgressOrders.clear();
    orders.clear();
    completedOrders.clear();
    quotedGivenOrders.clear();
    List<OrderModel> ordrs = [];
    http.Response response = await buildHttpResponse(
      getAllOrdersEndpoints,
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

    for (var order in orders) {
      if (order.getStatusDisplay == 'Quote Given') {
        quotedGivenOrders.add(order);
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
    // try {
      selectedOrder.value = await getSpecificOrder(quoteId);
    // } catch (e) {
    //   log('Problem is: ${e.toString()}');
    // }
  }

  final count = 0.obs;

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
