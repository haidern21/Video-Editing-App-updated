import 'dart:convert';

import 'package:video_editing_app/app/data/models/user_model.dart';

class EditorModel {
  int? id;
  UserModel? user;
  String? editorTitle;
  List<String>? skills;
  String? completedOrders;

  EditorModel(
      {this.id,
        this.user,
        this.editorTitle,
        this.skills,
        this.completedOrders});

  EditorModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? UserModel.fromMap(json['user']) : null;
    editorTitle = json['editor_title'];
    skills = json['skills']!=null?json['skills'].cast<String>():[];
    completedOrders = json['completed_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (user != null) {
      data['user'] = UserModel().toJson();
    }
    data['editor_title'] = editorTitle;
    data['skills'] = skills;
    data['completed_orders'] = completedOrders;
    return data;
  }
}
