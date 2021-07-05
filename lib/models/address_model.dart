// To parse this JSON data, do
//
//     final addressModel = addressModelFromJson(jsonString);

import 'dart:convert';

List<AddressModel> addressModelFromJson(String str) => List<AddressModel>.from(
    json.decode(str).map((x) => AddressModel.fromJson(x)));

String addressModelToJson(List<AddressModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddressModel {
  AddressModel({
    required this.id,
    required this.userId,
    this.adrName,
    required this.fullAddress,
    this.placeId,
    this.createdDate,
    required this.createdUserId,
    this.updatedDate,
    required this.updatedUserId,
  });

  int id;
  int userId;
  String? adrName;
  String fullAddress;
  String? placeId;
  String? createdDate;
  int createdUserId;
  String? updatedDate;
  int updatedUserId;

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"],
        userId: json["user_id"],
        adrName: json["adr_name"] ?? "",
        fullAddress: json["full_address"],
        placeId: json["place_id"] ?? "",
        createdDate: json["created_date"] ?? "",
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"] ?? "",
        updatedUserId: json["updated_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "adr_name": adrName,
        "full_address": fullAddress,
        "place_id": placeId,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
      };
}
