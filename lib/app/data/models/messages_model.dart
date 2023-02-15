import 'package:video_editing_app/app/data/models/user_model.dart';

class MessageModel {
  int? id;
  int? thread;
  UserModel? user;
  String? message;
  String? timestamp;

  MessageModel({this.id, this.thread, this.user, this.message, this.timestamp});

  MessageModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    thread = json['thread'];
    user = json['user'] != null ? UserModel.fromMap(json['user']) : null;
    message = json['message'];
    timestamp = json['timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['thread'] = thread;
    if (user != null) {
      data['user'] = user?.toJson();
    }
    data['message'] = message;
    data['timestamp'] = timestamp;
    return data;
  }
}

