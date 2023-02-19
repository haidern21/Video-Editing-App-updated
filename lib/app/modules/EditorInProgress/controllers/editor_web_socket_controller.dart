import 'dart:convert';
import 'dart:developer';
import 'package:video_editing_app/app/modules/EditorChats/controllers/editor_chats_controller.dart';
import 'package:video_editing_app/app/modules/EditorInProgress/controllers/editor_in_progress_controller.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/EditorOrders/controllers/editor_orders_controller.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../Utils/jwt_utils.dart';
import '../../EditorProfile/controllers/editor_profile_controller.dart';

class EditorWebSocketController extends GetxController {
  late WebSocketChannel channel;
  late WebSocketChannel threadChannel;

  // late IO.Socket socket;
  EditorInProgressController editorInProgressController =
      Get.put(EditorInProgressController());
  EditorProfileController editorProfileController = Get.find();
  EditorChatsController editorChatsController = Get.find();

  sendMessage(String message, int quoteId) {
    var map = {
      "message": message,
      "communication_type": "MESSAGE",
      "quote": quoteId,
      "attachments": ["https://google.com"],
    };
    try {
      channel.sink.add(jsonEncode(map));
    } catch (e) {
      log('Problem in send message : ${e.toString()}');
    }
  }

  sendDeliveryMessage(String message, int quoteId) {
    var map = {
      "message": message,
      "communication_type": "SUBMISSION",
      "quote": quoteId,
      "attachments": ["https://google.com"],
    };
    try {
      channel.sink.add(jsonEncode(map));
    } catch (e) {
      log('Problem in send message : ${e.toString()}');
    }
  }

  sendThreadMessage(
      {required String message,
      required int currentUserId,
      required int sentTo,
      required int threadId}) {
    var map = {
      'message': message,
      'sent_by': currentUserId,
      'send_to': sentTo,
      'thread_id': threadId
    };
    try {
      threadChannel.sink.add(jsonEncode(map));
    } catch (e) {
      log('Problem in send message : ${e.toString()}');
    }
  }

  @override
  void onInit() {
    initWebSocket();
    initThreadsWebSocket();
    super.onInit();
  }

  @override
  void onClose() {
    channel.sink.close().then((value) => log('stream disposed'));
  }

  initWebSocket() async {
    String token = await JwtUtils.getJwtToken() ?? '';
    EditorOrdersController editorOrdersController = Get.find();
    String baseurl =
        "ws://video-editing-app.herokuapp.com/quote-communication/";
    Uri webSocketUrl =
        Uri.parse('wss://video-editing-app.herokuapp.com/quote-communication/')
            .replace(
      queryParameters: {"token": token},
    );
    channel = IOWebSocketChannel.connect(webSocketUrl);
    log('The url is : $webSocketUrl');
    // channel = IOWebSocketChannel.connect(webSocketUrl);
    channel.stream.listen((event) {
      log('event is : $event');
      editorInProgressController.fetchQuoteCommunicationsList(
          editorOrdersController.selectedOrder.value?.id ?? 0);
      // try {
      //   var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
      //   if (message.user?.id ==
      //       editorProfileController.userModelFromApi.value?.user?.id) {
      //     if(message.communicationType=="MESSAGE") {
      //       editorInProgressController.editorMessages.add(message);
      //     }
      //     if(message.communicationType=="SUBMISSION") {
      //       editorInProgressController.deliverMessages.add(message);
      //     }
      //     if(message.communicationType=="REVISION") {
      //       editorInProgressController.revisionMessages.add(message);
      //     }
      //   } else {
      //     if(message.communicationType=="MESSAGE") {
      //       editorInProgressController.buyerMessages.add(message);
      //     }
      //     if(message.communicationType=="SUBMISSION") {
      //       editorInProgressController.deliverMessages.add(message);
      //     }
      //     if(message.communicationType=="REVISION") {
      //       editorInProgressController.revisionMessages.add(message);
      //     }
      //   }
      //   log('message sent : $event');
    }
        // catch (e) {
        //   log('MESSAGE NOT SENT. problem is: $e');
        // }
        //   }
        );
  }

  initThreadsWebSocket() async {
    String token = await JwtUtils.getJwtToken() ?? '';
    EditorOrdersController editorOrdersController = Get.find();
    String baseurl = "ws://video-editing-app.herokuapp.com/chat/";
    Uri webSocketUrl =
        Uri.parse('wss://video-editing-app.herokuapp.com/chat/').replace(
      queryParameters: {"token": token},
    );
    threadChannel = WebSocketChannel.connect(webSocketUrl);
    log('The url is : $webSocketUrl');
    // channel = IOWebSocketChannel.connect(webSocketUrl);
    threadChannel.stream.listen((event) {
      log('event is : $event');

      // try {
      //   var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
      //   if (message.user?.id ==
      //       editorProfileController.userModelFromApi.value?.user?.id) {
      //     if(message.communicationType=="MESSAGE") {
      //       editorInProgressController.editorMessages.add(message);
      //     }
      //     if(message.communicationType=="SUBMISSION") {
      //       editorInProgressController.deliverMessages.add(message);
      //     }
      //     if(message.communicationType=="REVISION") {
      //       editorInProgressController.revisionMessages.add(message);
      //     }
      //   } else {
      //     if(message.communicationType=="MESSAGE") {
      //       editorInProgressController.buyerMessages.add(message);
      //     }
      //     if(message.communicationType=="SUBMISSION") {
      //       editorInProgressController.deliverMessages.add(message);
      //     }
      //     if(message.communicationType=="REVISION") {
      //       editorInProgressController.revisionMessages.add(message);
      //     }
      //   }
      //   log('message sent : $event');
    }
        // catch (e) {
        //   log('MESSAGE NOT SENT. problem is: $e');
        // }
        //   }
        );
  }
}
