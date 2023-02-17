import 'dart:convert';
import 'dart:developer';
import 'package:video_editing_app/app/data/models/quote_communication_model.dart';
import 'package:video_editing_app/app/modules/EditorInProgress/controllers/editor_in_progress_controller.dart';
import 'package:get/get.dart';
import 'package:video_editing_app/app/modules/EditorOrders/controllers/editor_orders_controller.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../../Utils/jwt_utils.dart';
import '../../EditorProfile/controllers/editor_profile_controller.dart';

class EditorWebSocketController extends GetxController {
  // String token = '';
  // static const String webSocketUrl =
  //     'wss://video-editing-app.herokuapp.com/quote-communication/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc4MjU1OTk0LCJqdGkiOiIzNmJmN2ViMjkwZGQ0MDVlOTUyZjZhZmU1ZjFmNWUwMiIsInVzZXJfaWQiOjE3fQ.00xPMVqPYXAzircVkXPzLJ7JTqttQ1vkoqHD3wdEkdI';
  late WebSocketChannel channel;

  // late IO.Socket socket;
  EditorInProgressController editorInProgressController =
      Get.put(EditorInProgressController());
  EditorProfileController editorProfileController = Get.find();

  sendMessage(String message, int quoteId) {
    var map = {
      "message": message,
      // "user": 17,
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
      // "user": 17,
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


  // sendMessageIo(String message, int quoteId) {
  //   var map = {
  //     "message": message,
  //     // "user": 17,
  //     "communication_type": "MESSAGE",
  //     "quote": quoteId,
  //     "attachments": ["https://google.com"],
  //   };
  //   try {
  //     // socket.emit('sendNewMessage', map);
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  @override
  void onInit() {
    initWebSocket();
    // initWebSocketIO();
    super.onInit();
  }

  @override
  void onClose() {
    channel.sink.close().then((value) => log('stream disposed'));
  }

  // initWebSocketIO()async{
  //   String token =await JwtUtils.getJwtToken()??'';
  //   log('token is : $token');
  //   String webSocketUrl =
  //       'wss://video-editing-app.herokuapp.com/quote-communication/?token=$token';
  //   socket = IO.io(webSocketUrl);
  //   socket.connect();
  //   socket.onConnect((_) {
  //     print('Connection established');
  //   });
  //   socket.onDisconnect((_) => print('Connection Disconnection'));
  //   socket.onConnectError((err) => print(err));
  //   socket.onError((err) => print(err));
  //
  //
  //   socket.on('getMessageEvent', (event) {
  //     try {
  //       var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
  //       if (message.user?.id ==
  //           editorProfileController.userModelFromApi.value?.user?.id) {
  //         editorInProgressController.buyerMessages.add(message);
  //       } else {
  //         editorInProgressController.editorMessages.add(message);
  //       }
  //       log('message sent : $message');
  //     } catch (e) {
  //       log('MESSAGE NOT SENT. problem is: $e');
  //     }
  //   });
  // }

  initWebSocket() async {
    String token = await JwtUtils.getJwtToken() ?? '';
    String baseurl =
        "ws://video-editing-app.herokuapp.com/quote-communication/";
    Uri webSocketUrl = Uri.parse('wss://video-editing-app.herokuapp.com/quote-communication/').replace(
      queryParameters: {"token": token},
    );
    channel = WebSocketChannel.connect(webSocketUrl);
    log('The url is : $webSocketUrl');
    // channel = IOWebSocketChannel.connect(webSocketUrl);
    channel.stream.listen((event) {
      log('event is : $event');
      try {
        var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
        if (message.user?.id ==
            editorProfileController.userModelFromApi.value?.user?.id) {
          editorInProgressController.editorMessages.add(message);
        } else {
          editorInProgressController.buyerMessages.add(message);
        }
        log('message sent : $event');
      } catch (e) {
        log('MESSAGE NOT SENT. problem is: $e');
      }
    });
  }
}
// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'package:video_editing_app/app/data/models/quote_communication_model.dart';
// import 'package:video_editing_app/app/modules/EditorInProgress/controllers/editor_in_progress_controller.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:get/get.dart';
//
// import '../../../../Utils/jwt_utils.dart';
// import '../../EditorProfile/controllers/editor_profile_controller.dart';
//
// class EditorWebSocketController extends GetxController {
//   // String token = '';
//   // static const String webSocketUrl =
//   //     'wss://video-editing-app.herokuapp.com/quote-communication/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjc4MjU1OTk0LCJqdGkiOiIzNmJmN2ViMjkwZGQ0MDVlOTUyZjZhZmU1ZjFmNWUwMiIsInVzZXJfaWQiOjE3fQ.00xPMVqPYXAzircVkXPzLJ7JTqttQ1vkoqHD3wdEkdI';
//   late IOWebSocketChannel channel;
//   EditorInProgressController editorInProgressController =
//   Get.put(EditorInProgressController());
//   EditorProfileController editorProfileController = Get.find();
//
//   sendMessage(String message,int quoteId) {
//     var map = {
//       "message": message,
//       // "user": 17,
//       "communication_type": "MESSAGE",
//       "quote": quoteId,
//       "attachments": ["https://google.com"],
//     };
//     try {
//       channel.sink.add(jsonEncode(map));
//     } catch (e) {
//       log(e.toString());
//     }
//   }
//
//   @override
//   void onInit() {
//     initWebSocket();
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     channel.sink.close().then((value) => log('stream disposed'));
//   }
//
//   initWebSocket() async {
//     String token = await JwtUtils.getJwtToken() ?? '';
//     String webSocketUrl =
//         'wss://video-editing-app.herokuapp.com/quote-communication/?token=$token';
//     channel = IOWebSocketChannel.connect(Uri.parse(webSocketUrl),);
//     log('connected web url is: $webSocketUrl');
//     channel.stream.listen((event) {
//       try {
//         var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
//         if (message.user?.id ==
//             editorProfileController.userModelFromApi.value?.id) {
//           channel.sink.add(event);
//           editorInProgressController.buyerMessages.add(message);
//         } else {
//           editorInProgressController.editorMessages.add(message);
//         }
//         log('message sent : $event');
//       } catch (e) {
//         log('MESSAGE NOT SENT. problem is: $e');
//       }
//     },);
//   }
//
//
//
// }
