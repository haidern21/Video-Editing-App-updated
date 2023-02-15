import 'package:video_editing_app/app/data/models/quote_model.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';

class QuoteCommunicationModel {
  int? id;
  UserModel? user;
  QuoteModel? quote;
  String? message;
  String? createdAt;
  String? communicationType;
  List<String>? attachments;

  QuoteCommunicationModel(
      {this.id,
        this.user,
        this.quote,
        this.message,
        this.createdAt,
        this.communicationType,
        this.attachments});

  QuoteCommunicationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? UserModel.fromMap(json['user']) : null;
    quote = json['quote'] != null ? QuoteModel.fromJson(json['quote']) : null;
    message = json['message'];
    createdAt = json['created_at'];
    communicationType = json['communication_type'];
    attachments = json['attachments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    final user = this.user;
    if (user != null) {
      data['user'] = user.toJson();
    }
    final quote = this.quote;
    if (quote != null) {
      data['quote'] = quote.toJson();
    }
    data['message'] = message;
    data['created_at'] = createdAt;
    data['communication_type'] = communicationType;
    data['attachments'] = attachments;
    return data;
  }
}
