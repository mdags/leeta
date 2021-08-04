// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  ProductModel({
    required this.id,
    required this.catId,
    required this.name,
    this.description,
    required this.productUnit,
    required this.unitPrice,
    this.originalPrice,
    this.imgPath,
    this.searchTag,
    this.highlightInformation,
    this.isDiscount,
    this.overallRating,
    this.touchCount,
    this.favouriteCount,
    this.likeCount,
    required this.status,
    this.createdDate,
    this.createdUserId,
    this.updatedDate,
    this.updatedUserId,
    this.currencySymbol,
    this.isFavourite,
    this.cartCount,
  });

  int id;
  int catId;
  String name;
  String? description;
  String productUnit;
  double unitPrice;
  double? originalPrice;
  String? imgPath;
  String? searchTag;
  String? highlightInformation;
  int? isDiscount;
  double? overallRating;
  int? touchCount;
  int? favouriteCount;
  int? likeCount;
  int status;
  String? createdDate;
  int? createdUserId;
  String? updatedDate;
  int? updatedUserId;
  String? currencySymbol;
  int? isFavourite;
  int? cartCount;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        catId: json["cat_id"],
        name: json["name"] ?? "",
        description: json["description"] ?? "",
        productUnit: json["product_unit"],
        unitPrice: json["unit_price"].toDouble(),
        originalPrice: json["original_price"].toDouble(),
        imgPath: json["img_path"] ?? "",
        searchTag: json["search_tag"] ?? "",
        highlightInformation: json["highlight_information"] ?? "",
        isDiscount: json["is_discount"],
        overallRating: json["overall_rating"].toDouble(),
        touchCount: json["touch_count"],
        favouriteCount: json["favourite_count"],
        likeCount: json["like_count"],
        status: json["status"],
        createdDate: json["created_date"] ?? "",
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"] ?? "",
        updatedUserId: json["updated_user_id"],
        currencySymbol: json["currency_symbol"] ?? "",
        isFavourite: json["is_favourite"],
        cartCount: json["cart_count"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cat_id": catId,
        "name": name,
        "description": description,
        "product_unit": productUnit,
        "unit_price": unitPrice,
        "original_price": originalPrice,
        "img_path": imgPath,
        "search_tag": searchTag,
        "highlight_information": highlightInformation,
        "is_discount": isDiscount,
        "overall_rating": overallRating,
        "touch_count": touchCount,
        "favourite_count": favouriteCount,
        "like_count": likeCount,
        "status": status,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
        "currency_symbol": currencySymbol,
        "is_favourite": isFavourite,
        "cart_count": cartCount,
      };
}
