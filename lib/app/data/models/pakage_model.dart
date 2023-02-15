class PackageModel {
  int? id;
  String? name;
  String? price;
  int? videoCount;
  int? category;
  List<String>? offerings;
  String? createdAt;

  PackageModel(
      {this.id,
      this.name,
      this.price,
      this.videoCount,
      this.category,
      this.offerings,
      this.createdAt});

  PackageModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    videoCount = json['video_count'];
    category = json['category'];
    offerings = json['offerings'].cast<String>();
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['video_count'] = videoCount;
    data['category'] = category;
    data['offerings'] = offerings;
    data['created_at'] = createdAt;
    return data;
  }
}
