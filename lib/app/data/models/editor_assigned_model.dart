class EditorAssignedModel {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? role;
  String? accountType;
  String? getAccountTypeDisplay;
  String? profilePicture;
  String? dateJoined;
  String? lastLogin;
  bool? isSuperuser;

  EditorAssignedModel(
      {this.id,
        this.name,
        this.email,
        this.phoneNumber,
        this.role,
        this.accountType,
        this.getAccountTypeDisplay,
        this.profilePicture,
        this.dateJoined,
        this.lastLogin,
        this.isSuperuser});

  EditorAssignedModel.fromJson(Map<dynamic, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    accountType = json['account_type'];
    getAccountTypeDisplay = json['get_account_type_display'];
    profilePicture = json['profile_picture'];
    dateJoined = json['date_joined'];
    lastLogin = json['last_login'];
    isSuperuser = json['is_superuser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['role'] = role;
    data['account_type'] = accountType;
    data['get_account_type_display'] = getAccountTypeDisplay;
    data['profile_picture'] = profilePicture;
    data['date_joined'] = dateJoined;
    data['last_login'] = lastLogin;
    data['is_superuser'] = isSuperuser;
    return data;
  }
}
