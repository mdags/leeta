// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

List<CartModel> cartModelFromJson(String str) =>
    List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel {
  CartModel({
    this.id,
    required this.userId,
    required this.productId,
    required this.qty,
    this.createdDate,
    this.createdUserId,
    this.updatedDate,
    this.updatedUserId,
    this.productName,
    this.productImgPath,
    this.currencySymbol,
    this.totalAmount,
  });

  int? id;
  int userId;
  int productId;
  int qty;
  String? createdDate;
  int? createdUserId;
  String? updatedDate;
  int? updatedUserId;
  String? productName;
  String? productImgPath;
  String? currencySymbol;
  double? totalAmount;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        userId: json["user_id"],
        productId: json["product_id"],
        qty: json["qty"],
        createdDate: json["created_date"] ?? "",
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"] ?? "",
        updatedUserId: json["updated_user_id"],
        productName: json["product_name"] ?? "",
        productImgPath: json["product_img_path"] ?? "",
        currencySymbol: json["currency_symbol"] ?? "",
        totalAmount: json["total_amount"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "product_id": productId,
        "qty": qty,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
        "product_name": productName,
        "product_img_path": productImgPath,
        "currency_symbol": currencySymbol,
        "total_amount": totalAmount,
      };
}
