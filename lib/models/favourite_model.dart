// To parse this JSON data, do
//
//     final favouriteModel = favouriteModelFromJson(jsonString);

import 'dart:convert';

List<FavouriteModel> favouriteModelFromJson(String str) =>
    List<FavouriteModel>.from(
        json.decode(str).map((x) => FavouriteModel.fromJson(x)));

String favouriteModelToJson(List<FavouriteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FavouriteModel {
  FavouriteModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.createdDate,
    required this.createdUserId,
    required this.updatedDate,
    required this.updatedUserId,
    required this.productName,
    required this.productImgPath,
    required this.productPrice,
    required this.currencySymbol,
  });

  int id;
  int productId;
  int userId;
  String createdDate;
  int createdUserId;
  String updatedDate;
  int updatedUserId;
  String productName;
  String productImgPath;
  double productPrice;
  String currencySymbol;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) => FavouriteModel(
        id: json["id"],
        productId: json["product_id"],
        userId: json["user_id"],
        createdDate: json["created_date"] ?? "",
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"] ?? "",
        updatedUserId: json["updated_user_id"],
        productName: json["product_name"] ?? "",
        productImgPath: json["product_img_path"] ?? "",
        productPrice: json["product_price"].toDouble(),
        currencySymbol: json["currency_symbol"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "user_id": userId,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
        "product_name": productName,
        "product_img_path": productImgPath,
        "product_price": productPrice,
        "currency_symbol": currencySymbol,
      };
}
