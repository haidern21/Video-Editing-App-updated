class EditorVideosModel {
  int? videoId;
  int? userId;
  String? title;
  String? description;
  String? url;

  EditorVideosModel(
      {this.title, this.description, this.userId, this.url, this.videoId});

  EditorVideosModel.fromJson(Map<dynamic, dynamic> json) {
    videoId = json['id'];
    userId = json['user'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = title;
  //   data['created_at'] = description;
  //   return data;
  // }
}
