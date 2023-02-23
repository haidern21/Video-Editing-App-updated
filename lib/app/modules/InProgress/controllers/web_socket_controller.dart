// import 'dart:convert';
// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:video_editing_app/Utils/jwt_utils.dart';
// import 'package:video_editing_app/app/modules/BottomProfile/controllers/bottom_profile_controller.dart';
// import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
// import 'package:video_editing_app/app/modules/InProgress/controllers/in_progress_controller.dart';
// import 'package:web_socket_channel/io.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import '../../../data/models/quote_communication_model.dart';
//
// class WebSocketController extends GetxController {
//
//   late IOWebSocketChannel channel;
//   late IO.Socket socket;
//   InProgressController inProgressController = Get.put(InProgressController());
//   BottomProfileController bottomProfileController = Get.find();
//   ChatViewController chatViewController= Get.find();
//
//   sendMessage(String message,int quoteId) {
//     var map = {
//       "message": message,
//       // "user": 13,
//       "communication_type": "MESSAGE",
//       "quote": quoteId,
//       "attachments": ["https://google.com"],
//     };
//     try {
//       channel.sink.add(jsonEncode(map));
//     } catch (e) {
//       log('Problem in send message : ${e.toString()}');
//     }
//   }
//
//   sendMessageInThread(String message) {
//     var map = {
//       "message": message,
//       // "user": 13,
//       "communication_type": "MESSAGE",
//       // "quote": quoteId,
//       "attachments": ["https://google.com"],
//     };
//     try {
//       channel.sink.add(jsonEncode(map));
//     } catch (e) {
//       log('prob : ${e.toString()}');
//     }
//   }
//
//   sendMessageIo(String message,int quoteId) {
//     var map = {
//       "message": message,
//       // "user": 17,
//       "communication_type": "MESSAGE",
//       "quote": quoteId,
//       "attachments": ["https://google.com"],
//     };
//     try {
//       socket.emit('sendNewMessage', map);
//     } catch (e) {
//       log(e.toString());
//     }
//   }
//
//   @override
//   void onInit() {
//     // initWebSocket();
//     initWebSocketIO();
//     super.onInit();
//   }
//
//   @override
//   void onClose() {
//     channel.sink.close().then((value) => log('stream disposed'));
//   }
//
//   initWebSocketIO()async{
//     String token =await JwtUtils.getJwtToken()??'';
//     log('token is : $token');
//     String webSocketUrl =
//         'wss://video-editing-app.herokuapp.com/quote-communication/?token=$token';
//     socket = IO.io(webSocketUrl, <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': false,
//     });
//     socket.connect();
//     socket.onConnect((_) {
//       print('Connection established');
//     });
//     socket.onDisconnect((_) => print('Connection Disconnection'));
//     socket.onConnectError((err) => print(err));
//     socket.onError((err) => print(err));
//
//
//     socket.on('getMessageEvent', (event) {
//       try {
//         var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
//         if (message.user?.id ==
//             bottomProfileController.userModelFromApi.value?.id) {
//           inProgressController.buyerMessages.add(message);
//         } else {
//           inProgressController.editorMessages.add(message);
//         }
//         log('message sent : $message');
//       } catch (e) {
//         log('MESSAGE NOT SENT. problem is: $e');
//       }
//     });
//
//   }
//
//   initWebSocket() async{
//     String token =await JwtUtils.getJwtToken()??'';
//     String webSocketUrl =
//         'wss://video-editing-app.herokuapp.com/quote-communication/?token=$token';
//     log('web socket url isss : ${webSocketUrl.split(' ')[1]}');
//     channel = IOWebSocketChannel.connect(Uri.parse(webSocketUrl));
//     channel.stream.listen((event) {
//       try {
//         log('event is : $event');
//         var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
//         if (message.user?.id ==
//             bottomProfileController.userModelFromApi.value?.id) {
//           inProgressController.buyerMessages.add(message);
//         } else {
//           inProgressController.editorMessages.add(message);
//         }
//         log('message sent : $message');
//       } catch (e) {
//         log('MESSAGE NOT SENT. problem is: $e');
//       }
//     });
//
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:video_editing_app/Utils/jwt_utils.dart';
import 'package:video_editing_app/app/data/models/messages_model.dart';
import 'package:video_editing_app/app/modules/BottomProfile/controllers/bottom_profile_controller.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/modules/InProgress/controllers/in_progress_controller.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../../data/models/quote_communication_model.dart';

class WebSocketController extends GetxController {
  late WebSocketChannel channel;
  late WebSocketChannel threadChannel;
  InProgressController inProgressController = Get.put(InProgressController());
  BottomProfileController bottomProfileController = Get.find();
  ChatViewController chatViewController= Get.find();

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
      log(e.toString());
    }
  }

  sendRevisionMessage(String message, int quoteId) {
    var map = {
      "message": message,
      // "user": 13,
      "communication_type": "REVISION",
      "quote": quoteId,
      "attachments": ["https://google.com"],
    };
    try {
      channel.sink.add(jsonEncode(map));
    } catch (e) {
      log(e.toString());
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
    initThreadWebSocket();
    super.onInit();
  }

  @override
  void onClose() {
    channel.sink.close().then((value) => log('stream disposed'));
  }
  initWebSocket() async {
    try {
      String token = await JwtUtils.getJwtToken() ?? '';

      var webSocketUrl = Uri.parse(
              'wss://video-editing-app.herokuapp.com/quote-communication/')
          .replace(queryParameters: {"token": token});
      log('The url is : $webSocketUrl');
      channel =WebSocketChannel.connect(webSocketUrl);
      channel.ready.then((value) => print('Connection success'));
      channel.stream.listen((event) {
        // inProgressController.fetchQuoteCommunicationsList(
        //     orderController.selectedOrder.value?.id ?? 0);
        try {
          var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
          if (message.user?.id ==
              bottomProfileController.userModelFromApi.value?.id) {
            if (message.communicationType == "MESSAGE") {
              inProgressController.buyerMessages.add(message);
            }
            if (message.communicationType == "SUBMISSION") {
              inProgressController.deliverMessages.add(message);
            }
            if (message.communicationType == "REVISION") {
              inProgressController.revisionMessages.add(message);
            }
          } else {
            if (message.communicationType == "MESSAGE") {
              inProgressController.editorMessages.add(message);
            }
            if (message.communicationType == "SUBMISSION") {
              inProgressController.deliverMessages.add(message);
            }
            if (message.communicationType == "REVISION") {
              inProgressController.revisionMessages.add(message);
            }
          }
        } catch (e) {
          log('MESSAGE NOT SENT. problem is: $e');
        }
      });
    } catch (e) {
      print('Couldnt fetch token');
    }
  }


  initThreadWebSocket() async {
    try {
      String token = await JwtUtils.getJwtToken() ?? '';

      var webSocketUrl = Uri.parse(
          'wss://video-editing-app.herokuapp.com/chat/')
          .replace(queryParameters: {"token": token});
      log('The url is : $webSocketUrl');
      threadChannel = WebSocketChannel.connect(webSocketUrl);
      threadChannel.ready.then((value) => print('Connection success'));
      threadChannel.stream.listen((event) {
        var message = MessageModel.fromJson(jsonDecode(event));
        // print('message is ; $message');
        // log('event is : $event');
        // MessageModel messageModel= MessageModel();
        // messageModel.message= jsonDecode(event)['message'];
        // messageModel.thread= jsonDecode(event)['thread_id'];
        // messageModel.user?.id=jsonDecode(event)['sent_by'];
        chatViewController.messages.add(message);
        // chatViewController.getTwoUsersChat(threadId);
      });
    } catch (e) {
      print('Couldnt fetch token');
    }
  }
}
