class NotificationModel {
  int? id;
  int? user;
  String? title;
  String? message;
  String? createdAt;

  NotificationModel(
      {this.id, this.user, this.title, this.message, this.createdAt});

  NotificationModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    user = json['user'];
    title = json['title'];
    message = json['message'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['title'] = title;
    data['message'] = message;
    data['created_at'] = createdAt;
    return data;
  }
}
