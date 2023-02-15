import 'package:video_editing_app/app/data/models/user_model.dart';

class ChatThreadModel {
  int? id;
  UserModel? firstPerson;
  UserModel? secondPerson;
  String? updated;
  String? timestamp;
  String? lastMessage;
  String? lastMessageTimestamp;
  bool? isBlocked;
  int? blockedBy;
  bool? isWithAdmin;

  ChatThreadModel(
      {this.id,
        this.firstPerson,
        this.secondPerson,
        this.updated,
        this.timestamp,
        this.lastMessage,
        this.lastMessageTimestamp,
        this.isBlocked,
        this.blockedBy,
        this.isWithAdmin});

  ChatThreadModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    firstPerson = json['first_person'] != null
        ? UserModel.fromMap(json['first_person'])
        : null;
    secondPerson = json['second_person'] != null
        ? UserModel.fromMap(json['second_person'])
        : null;
    updated = json['updated'];
    timestamp = json['timestamp'];
    lastMessage = json['last_message'];
    lastMessageTimestamp = json['last_message_timestamp'];
    isBlocked = json['is_blocked'];
    blockedBy = json['blocked_by'];
    isWithAdmin = json['is_with_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (firstPerson != null) {
      data['first_person'] = firstPerson!.toJson();
    }
    if (secondPerson != null) {
      data['second_person'] = secondPerson!.toJson();
    }
    data['updated'] = updated;
    data['timestamp'] = timestamp;
    data['last_message'] = lastMessage;
    data['last_message_timestamp'] = lastMessageTimestamp;
    data['is_blocked'] = isBlocked;
    data['blocked_by'] = blockedBy;
    data['is_with_admin'] = isWithAdmin;
    return data;
  }
}

