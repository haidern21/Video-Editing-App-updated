class OrderModel {
  int? id;
  String? projectTitle;
  String? status;
  String? getStatusDisplay;
  String? createdAt;

  OrderModel(
      {this.id,
      this.projectTitle,
      this.status,
      this.getStatusDisplay,
      this.createdAt});

  OrderModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    projectTitle = json['project_title'];
    status = json['status'];
    getStatusDisplay = json['get_status_display'];
    createdAt = json['created_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['project_title'] = projectTitle;
    data['status'] = status;
    data['get_status_display'] = getStatusDisplay;
    data['created_at'] = createdAt;
    return data;
  }
}
