import 'package:get/get.dart';

class ChatThreadWebSocket extends GetxController{
  // late IOWebSocketChannel channel;
  // BottomProfileController bottomProfileController = Get.find();
  //
  //
  // initWebSocket() async{
  //     String token =await JwtUtils.getJwtToken()??'';
  //
  //     String webSocketUrl =
  //         'wss://video-editing-app.herokuapp.com/quote-communication/?token=$token';
  //     channel = IOWebSocketChannel.connect(Uri.parse(webSocketUrl),);
  //
  //     channel.ready.then((value) => print('Connection success'));
  //
  //     channel.stream.listen((event) {
  //       try {
  //         var message = ChatThreadModel.fromJson(jsonDecode(event));
  //         // if (message.user?.id ==
  //         //     bottomProfileController.userModelFromApi.value?.id) {
  //         //   channel.sink.add(event);
  //         //   inProgressController.buyerMessages.add(message);
  //         // } else {
  //         //   inProgressController.editorMessages.add(message);
  //         // }
  //         log('message sent : $event');
  //       } catch (e) {
  //         log('MESSAGE NOT SENT. problem is: $e');
  //       }
  //     },);}
}