// To parse this JSON data, do
//
//     final memberModel = memberModelFromJson(jsonString);

import 'dart:convert';

MemberModel memberModelFromJson(String str) =>
    MemberModel.fromJson(json.decode(str));

String memberModelToJson(MemberModel data) => json.encode(data.toJson());

List<MemberModel> memberModelFromJsonSingle(String str) =>
    json.decode(str).map((x) => MemberModel.fromJson(x));

String memberModelToJsonSingle(MemberModel data) => json.encode(data.toJson());

class MemberModel {
  MemberModel({
    this.id,
    required this.userName,
    this.userEmail,
    this.userPhone,
    this.userPassword,
    this.userAboutMe,
    this.imgPath,
    this.status,
    this.verified,
    this.facebookId,
    this.googleId,
    this.appleId,
    this.deviceType,
    this.deviceCode,
    this.deviceToken,
    this.createdDate,
    this.createdUserId,
    this.updatedDate,
    this.updatedUserId,
  });

  int? id;
  String userName;
  String? userEmail;
  String? userPhone;
  String? userPassword;
  String? userAboutMe;
  String? imgPath;
  int? status;
  int? verified;
  String? facebookId;
  String? googleId;
  String? appleId;
  String? deviceType;
  String? deviceCode;
  String? deviceToken;
  String? createdDate;
  int? createdUserId;
  String? updatedDate;
  int? updatedUserId;

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        id: json["id"],
        userName: json["user_name"],
        userEmail: json["user_email"],
        userPhone: json["user_phone"],
        userPassword: json["user_password"],
        userAboutMe: json["user_about_me"],
        imgPath: json["img_path"],
        status: json["status"],
        verified: json["verified"],
        facebookId: json["facebook_id"],
        googleId: json["google_id"],
        appleId: json["apple_id"],
        deviceType: json["device_type"],
        deviceCode: json["device_code"],
        deviceToken: json["device_token"],
        createdDate: json["created_date"],
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"],
        updatedUserId: json["updated_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_name": userName,
        "user_email": userEmail,
        "user_phone": userPhone,
        "user_password": userPassword,
        "user_about_me": userAboutMe,
        "img_path": imgPath,
        "status": status,
        "verified": verified,
        "facebook_id": facebookId,
        "google_id": googleId,
        "apple_id": appleId,
        "device_type": deviceType,
        "device_code": deviceCode,
        "device_token": deviceToken,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
      };
}
