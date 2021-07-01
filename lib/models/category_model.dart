// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.name,
    this.imgPath,
    required this.status,
    required this.touchCount,
    required this.createdDate,
    required this.createdUserId,
    required this.updatedDate,
    required this.updatedUserId,
  });

  int id;
  String name;
  String? imgPath;
  int status;
  int touchCount;
  String createdDate;
  int createdUserId;
  String updatedDate;
  int updatedUserId;

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        imgPath: json["img_path"] ?? "",
        status: json["status"],
        touchCount: json["touch_count"],
        createdDate: json["created_date"],
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"],
        updatedUserId: json["updated_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img_path": imgPath,
        "status": status,
        "touch_count": touchCount,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
      };
}
