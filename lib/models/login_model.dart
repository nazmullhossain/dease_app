class LoginModel {
  bool? success;
  int? status;
  Message? message;
  LoginData? data;

  LoginModel({ this.success, this.status, this.message, this.data});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    message =
    json['message'] != null ? new Message.fromJson(json['message']) : null;
    data = json['data'] != null ? new LoginData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    if (this.message != null) {
      data['message'] = this.message!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Message {
  List<String>? body;

  Message({this.body});

  Message.fromJson(Map<String, dynamic> json) {
    body = json['body'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['body'] = this.body;
    return data;
  }
}

class LoginData {
  int? id;
  String? name;
  String? email;
  Null? roleId;
  Null? emailVerifiedAt;
  String? userType;
  String? occupation;
  String? speciality;
  String? bmdcRegNo;
  Null? phone;
  String? createdAt;
  String? updatedAt;
  String? profilePic;
  String? status;
  String? fcmToken;
  Null? occupationId;
  Null? specialtyId;
  String? accessToken;

  LoginData(
      {this.id,
        this.name,
        this.email,
        this.roleId,
        this.emailVerifiedAt,
        this.userType,
        this.occupation,
        this.speciality,
        this.bmdcRegNo,
        this.phone,
        this.createdAt,
        this.updatedAt,
        this.profilePic,
        this.status,
        this.fcmToken,
        this.occupationId,
        this.specialtyId,
        this.accessToken});

  LoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    roleId = json['role_id'];
    emailVerifiedAt = json['email_verified_at'];
    userType = json['user_type'];
    occupation = json['occupation'];
    speciality = json['speciality'];
    bmdcRegNo = json['bmdc_reg_no'];
    phone = json['phone'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    profilePic = json['profile_pic'];
    status = json['status'];
    fcmToken = json['fcm_token'];
    occupationId = json['occupation_id'];
    specialtyId = json['specialty_id'];
    accessToken = json['access_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['role_id'] = this.roleId;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['user_type'] = this.userType;
    data['occupation'] = this.occupation;
    data['speciality'] = this.speciality;
    data['bmdc_reg_no'] = this.bmdcRegNo;
    data['phone'] = this.phone;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['profile_pic'] = this.profilePic;
    data['status'] = this.status;
    data['fcm_token'] = this.fcmToken;
    data['occupation_id'] = this.occupationId;
    data['specialty_id'] = this.specialtyId;
    data['access_token'] = this.accessToken;
    return data;
  }
}
