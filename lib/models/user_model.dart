// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<UserModel> userModelFromJsonSingle(String str) =>
    json.decode(str).map((x) => UserModel.fromJson(x));

String userModelToJsonSingle(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.userId,
    required this.userName,
    this.userEmail,
    required this.userPhone,
    this.userPassword,
    this.userAboutMe,
    this.imgPath,
    this.status,
    this.role,
    this.verified,
    this.facebookId,
    this.googleId,
    this.phoneId,
    this.appleId,
    this.deviceToken,
    this.deviceCode,
    this.userAddress,
    this.userAreaId,
    this.userLat,
    this.userLng,
    this.createdDate,
    this.createdUserId,
    this.updatedDate,
    this.updatedUserId,
  });

  int userId;
  String userName;
  String? userEmail;
  String userPhone;
  String? userPassword;
  String? userAboutMe;
  String? imgPath;
  int? status;
  String? role;
  int? verified;
  String? facebookId;
  String? googleId;
  String? phoneId;
  String? appleId;
  String? deviceToken;
  String? deviceCode;
  String? userAddress;
  String? userAreaId;
  double? userLat;
  double? userLng;
  String? createdDate;
  int? createdUserId;
  String? updatedDate;
  int? updatedUserId;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userId: json["user_id"],
        userName: json["user_name"],
        userEmail: json["user_email"] ?? "",
        userPhone: json["user_phone"],
        userPassword: json["user_password"],
        userAboutMe: json["user_about_me"],
        imgPath: json["img_path"] ?? "",
        status: json["status"],
        role: json["role"],
        verified: json["verified"],
        facebookId: json["facebook_id"] ?? "",
        googleId: json["google_id"] ?? "",
        phoneId: json["phone_id"] ?? "",
        appleId: json["apple_id"] ?? "",
        deviceToken: json["device_token"] ?? "",
        deviceCode: json["device_code"] ?? "",
        userAddress: json["user_address"] ?? "",
        userAreaId: json["user_area_id"] ?? "",
        userLat: json["user_lat"],
        userLng: json["user_lng"],
        createdDate: json["created_date"] ?? "",
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"] ?? "",
        updatedUserId: json["updated_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "user_name": userName,
        "user_email": userEmail,
        "user_phone": userPhone,
        "user_password": userPassword,
        "user_about_me": userAboutMe,
        "img_path": imgPath,
        "status": status,
        "role": role,
        "verified": verified,
        "facebook_id": facebookId,
        "google_id": googleId,
        "phone_id": phoneId,
        "apple_id": appleId,
        "device_token": deviceToken,
        "device_code": deviceCode,
        "user_address": userAddress,
        "user_area_id": userAreaId,
        "user_lat": userLat,
        "user_lng": userLng,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
      };
}
