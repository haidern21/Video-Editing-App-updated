import 'dart:convert';

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.accountType,
    this.getAccountTypeDisplay,
    this.profilePicture,
    this.dateJoined,
    this.lastLogin,
    this.isSuperuser,
    this.points,
  });

   int? id;
   String? name;
   String? email;
   String? phoneNumber;
   String? role;
   String? accountType;
   String? getAccountTypeDisplay;
   String? profilePicture;
   DateTime? dateJoined;
   DateTime? lastLogin;
   bool? isSuperuser;
   int? points;

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<dynamic, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        role: json["role"],
        accountType: json["account_type"],
        getAccountTypeDisplay: json["get_account_type_display"],
        profilePicture: json["profile_picture"],
        dateJoined: json["date_joined"] == null
            ? null
            : DateTime.parse(json["date_joined"]),
        lastLogin: json["last_login"] == null
            ? null
            : DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
    points: json["points"]??0
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "role": role,
        "account_type": accountType,
        "get_account_type_display": getAccountTypeDisplay,
        "profile_picture": profilePicture,
        "date_joined": dateJoined?.toIso8601String(),
        "last_login": lastLogin?.toIso8601String(),
        "is_superuser": isSuperuser,
      };
}
