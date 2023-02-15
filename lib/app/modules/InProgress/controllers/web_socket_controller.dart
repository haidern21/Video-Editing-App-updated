import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:video_editing_app/Utils/jwt_utils.dart';
import 'package:video_editing_app/app/modules/BottomProfile/controllers/bottom_profile_controller.dart';
import 'package:video_editing_app/app/modules/ChatView/controllers/chat_view_controller.dart';
import 'package:video_editing_app/app/modules/InProgress/controllers/in_progress_controller.dart';
import 'package:web_socket_channel/io.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../../data/models/quote_communication_model.dart';

class WebSocketController extends GetxController {

  late IOWebSocketChannel channel;
  late IO.Socket socket;
  InProgressController inProgressController = Get.put(InProgressController());
  BottomProfileController bottomProfileController = Get.find();
  ChatViewController chatViewController= Get.find();

  sendMessage(String message,int quoteId) {
    var map = {
      "message": message,
      // "user": 13,
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

  sendMessageInThread(String message) {
    var map = {
      "message": message,
      // "user": 13,
      "communication_type": "MESSAGE",
      // "quote": quoteId,
      "attachments": ["https://google.com"],
    };
    try {
      channel.sink.add(jsonEncode(map));
    } catch (e) {
      log('prob : ${e.toString()}');
    }
  }

  sendMessageIo(String message,int quoteId) {
    var map = {
      "message": message,
      // "user": 17,
      "communication_type": "MESSAGE",
      "quote": quoteId,
      "attachments": ["https://google.com"],
    };
    try {
      socket.emit('sendNewMessage', map);
    } catch (e) {
      log(e.toString());
    }
  }

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

  initWebSocketIO()async{
    String token =await JwtUtils.getJwtToken()??'';
    log('token is : $token');
    String webSocketUrl =
        'https://video-editing-app.herokuapp.com/quote-communication/?token=$token';
    socket = IO.io(webSocketUrl, <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((_) {
      print('Connection established');
    });
    socket.onDisconnect((_) => print('Connection Disconnection'));
    socket.onConnectError((err) => print(err));
    socket.onError((err) => print(err));


    socket.on('getMessageEvent', (event) {
      try {
        var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
        if (message.user?.id ==
            bottomProfileController.userModelFromApi.value?.id) {
          inProgressController.buyerMessages.add(message);
        } else {
          inProgressController.editorMessages.add(message);
        }
        log('message sent : $message');
      } catch (e) {
        log('MESSAGE NOT SENT. problem is: $e');
      }
    });

  }

  initWebSocket() async{
    String token =await JwtUtils.getJwtToken()??'';
    String webSocketUrl =
        'wss://video-editing-app.herokuapp.com/quote-communication/?token=$token';
    log('web socket url isss : ${webSocketUrl.split(' ')[1]}');
    channel = IOWebSocketChannel.connect(Uri.parse(webSocketUrl),);
    channel.stream.listen((event) {
      try {
        log('event is : $event');
        var message = QuoteCommunicationModel.fromJson(jsonDecode(event));
        if (message.user?.id ==
            bottomProfileController.userModelFromApi.value?.id) {
          inProgressController.buyerMessages.add(message);
        } else {
          inProgressController.editorMessages.add(message);
        }
        log('message sent : $message');
      } catch (e) {
        log('MESSAGE NOT SENT. problem is: $e');
      }
    });

  }
}
