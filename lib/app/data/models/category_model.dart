class CategoryModel {
  int? id;
  String? name;
  String? createdAt;

  CategoryModel({this.id, this.name, this.createdAt});

  CategoryModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    return data;
  }
}