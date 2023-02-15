// class QuoteModel {
//   int?id;
//   int?package;
//   String? name;
//   String? email;
//   String? phoneNumber;
//   String? projectTitle;
//   int? videoCount;
//   int? duration;
//   List<Null>? quoteVideos;
//
//   QuoteModel({this.id,
//     this.package,
//     this.name,
//     this.email,
//     this.phoneNumber,
//     this.projectTitle,
//     this.videoCount,
//     this.duration,
//     this.quoteVideos});
//
//   QuoteModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     package = json['package'];
//     name = json['name'];
//     email = json['email'];
//     phoneNumber = json['phone_number'];
//     projectTitle = json['project_title'];
//     videoCount = json['video_count'];
//     duration = json['duration'];
//     if (json['quote_videos'] != null) {
//       quoteVideos = <Null>[];
//       json['quote_videos'].forEach((v) {
//         quoteVideos.add(Null.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['package'] = this.package;
//     data['name'] = this.name;
//     data['email'] = this.email;
//     data['phone_number'] = this.phoneNumber;
//     data['project_title'] = this.projectTitle;
//     data['video_count'] = this.videoCount;
//     data['duration'] = this.duration;
//     if (this.quoteVideos != null) {
//       data['quote_videos'] = this.quoteVideos.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
//
import 'package:video_editing_app/app/data/models/pakage_model.dart';
import 'package:video_editing_app/app/data/models/user_model.dart';

import 'editor_assigned_model.dart';
import 'editor_model.dart';

class QuoteModel {
  int? id;
  UserModel? userModel;
  PackageModel? packageModel;
  int? packageId;
  String? getStatusDisplay;
  String? name;
  String? email;
  String? phoneNumber;
  String? projectTitle;
  int? videoCount;
  int? duration;
  String? quotePrice;
  EditorAssignedModel? editorAssigned;
  String? status;
  String? startedAt;
  String? completedAt;
  String? createdAt;
  List<QuoteVideos>? quoteVideos;

  QuoteModel(
      {this.id,
      this.userModel,
      this.packageModel,
      this.getStatusDisplay,
      this.name,
      this.email,
      this.phoneNumber,
      this.projectTitle,
      this.videoCount,
      this.duration,
      this.quotePrice,
      this.editorAssigned,
      this.status,
      this.startedAt,
      this.completedAt,
      this.createdAt,
      this.packageId,
      this.quoteVideos});

  QuoteModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    userModel = json['user'] != null ? UserModel.fromMap(json['user']) : null;
    packageModel =
        json['package'] != null ? PackageModel.fromJson(json['package']) : null;
    getStatusDisplay = json['get_status_display'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    projectTitle = json['project_title'];
    videoCount = json['video_count'];
    duration = json['duration'];
    quotePrice = json['quote_price'];
    editorAssigned = json['editor_assigned'] != null
        ? EditorAssignedModel.fromJson(json['editor_assigned'])
        : null;
    // editorAssigned = json['editor_assigned'] != null ? EditorModel.fromJson(json['editor_assigned']) : null;
    status = json['status'];
    startedAt = json['started_at'];
    completedAt = json['completed_at'];
    createdAt = json['created_at'];
    // packageId=json['package'];
    if (json['quote_videos'] != null) {
      quoteVideos = <QuoteVideos>[];
      json['quote_videos'].forEach((v) {
        quoteVideos?.add(QuoteVideos.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    final userModel = this.userModel;
    if (userModel != null) {
      data['user'] = userModel.toMap();
    }
    final packageModel = this.packageModel;
    if (packageModel != null) {
      data['package'] = packageModel.toJson();
    }
    data['get_status_display'] = getStatusDisplay;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['project_title'] = projectTitle;
    data['video_count'] = videoCount;
    data['duration'] = duration;
    data['quote_price'] = quotePrice;
    data['editor_assigned'] = editorAssigned;
    data['status'] = status;
    data['package'] = packageId;
    data['started_at'] = startedAt;
    data['completed_at'] = completedAt;
    data['created_at'] = createdAt;
    final quoteVideos = this.quoteVideos;
    if (quoteVideos != null) {
      data['quote_videos'] = quoteVideos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuoteVideos {
  int? id;
  int? numberOfMinutes;
  String? googleDriveLink;
  String? details;
  bool? colorGrading;
  bool? animation;
  bool? customSubtitle;
  bool? specialEffectOrVfx;
  bool? copyrightFreeMusic;
  bool? transitions;
  bool? motionGraphics;
  bool? verticalSize;
  bool? horizontalSize;
  bool? squareSize;
  bool? allSizes;
  int? quote;

  QuoteVideos(
      {this.id,
      this.numberOfMinutes,
      this.googleDriveLink,
      this.details,
      this.colorGrading,
      this.animation,
      this.customSubtitle,
      this.specialEffectOrVfx,
      this.copyrightFreeMusic,
      this.transitions,
      this.motionGraphics,
      this.verticalSize,
      this.horizontalSize,
      this.squareSize,
      this.allSizes,
      this.quote});

  QuoteVideos.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    numberOfMinutes = json['number_of_minutes'];
    googleDriveLink = json['google_drive_link'];
    details = json['details'];
    colorGrading = json['color_grading'].toString() == 'true' ? true : false;
    animation = json['animation'].toString() == 'true' ? true : false;
    customSubtitle =
        json['custom_subtitle'].toString() == 'true' ? true : false;
    specialEffectOrVfx =
        json['special_effect_or_vfx'].toString() == 'true' ? true : false;
    copyrightFreeMusic =
        json['copyright_free_music'].toString() == 'true' ? true : false;
    transitions = json['transitions'].toString() == 'true' ? true : false;
    motionGraphics =
        json['motion_graphics'].toString() == 'true' ? true : false;
    verticalSize = json['vertical_size'].toString() == 'true' ? true : false;
    horizontalSize =
        json['horizontal_size'].toString() == 'true' ? true : false;
    squareSize = json['square_size'].toString() == 'true' ? true : false;
    allSizes = json['all_sizes'].toString() == 'true' ? true : false;
    quote = json['quote'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['number_of_minutes'] = numberOfMinutes;
    data['google_drive_link'] = googleDriveLink;
    data['details'] = details;
    data['color_grading'] = colorGrading;
    data['animation'] = animation;
    data['custom_subtitle'] = customSubtitle;
    data['special_effect_or_vfx'] = specialEffectOrVfx;
    data['copyright_free_music'] = copyrightFreeMusic;
    data['transitions'] = transitions;
    data['motion_graphics'] = motionGraphics;
    data['vertical_size'] = verticalSize;
    data['horizontal_size'] = horizontalSize;
    data['square_size'] = squareSize;
    data['all_sizes'] = allSizes;
    data['quote'] = quote;
    return data;
  }
}
