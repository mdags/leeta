// To parse this JSON data, do
//
//     final OrderModel = OrderModelFromJson(jsonString);

import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) =>
    List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<OrderModel> orderModelFromJsonSingle(String str) =>
    json.decode(str).map((x) => OrderModel.fromJson(x));
String orderModelToJsonSingle(OrderModel data) => json.encode(data.toJson());

class OrderModel {
  OrderModel({
    required this.id,
    required this.userId,
    this.subTotalAmount,
    this.discountAmount,
    this.taxAmount,
    this.taxPercent,
    this.shippingAmount,
    this.totalAmount,
    this.totalItemCount,
    this.contactName,
    this.contactPhone,
    this.contactEmail,
    this.userAddressId,
    this.contactAddress,
    this.contactAreaId,
    this.deliveryType,
    this.paymentMethod,
    this.paymentStatus,
    this.orderNote,
    this.transLat,
    this.transLng,
    this.deliveryPickupDate,
    this.createdDate,
    this.createdUserId,
    this.updatedDate,
    this.updatedUserId,
    this.orderDetails,
  });

  int id;
  int userId;
  double? subTotalAmount;
  double? discountAmount;
  double? taxAmount;
  double? taxPercent;
  double? shippingAmount;
  double? totalAmount;
  int? totalItemCount;
  String? contactName;
  String? contactPhone;
  String? contactEmail;
  int? userAddressId;
  String? contactAddress;
  String? contactAreaId;
  String? deliveryType;
  String? paymentMethod;
  int? paymentStatus;
  String? orderNote;
  int? transLat;
  int? transLng;
  String? deliveryPickupDate;
  String? createdDate;
  int? createdUserId;
  String? updatedDate;
  int? updatedUserId;
  List<OrderDetail>? orderDetails;

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json["id"],
        userId: json["user_id"],
        subTotalAmount: json["sub_total_amount"],
        discountAmount: json["discount_amount"],
        taxAmount: json["tax_amount"],
        taxPercent: json["tax_percent"],
        shippingAmount: json["shipping_amount"],
        totalAmount: json["total_amount"],
        totalItemCount: json["total_item_count"],
        contactName: json["contact_name"] ?? "",
        contactPhone: json["contact_phone"] ?? "",
        contactEmail: json["contact_email"] ?? "",
        userAddressId: json["user_address_id"],
        contactAddress: json["contact_address"] ?? "",
        contactAreaId: json["contact_area_id"],
        deliveryType: json["delivery_type"] ?? "",
        paymentMethod: json["payment_method"] ?? "",
        paymentStatus: json["payment_status"],
        orderNote: json["order_note"] ?? "",
        transLat: json["trans_lat"],
        transLng: json["trans_lng"],
        deliveryPickupDate: json["delivery_pickup_date"] ?? "",
        createdDate: json["created_date"] ?? "",
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"] ?? "",
        updatedUserId: json["updated_user_id"],
        orderDetails: List<OrderDetail>.from(
            json["order_details"].map((x) => OrderDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "sub_total_amount": subTotalAmount,
        "discount_amount": discountAmount,
        "tax_amount": taxAmount,
        "tax_percent": taxPercent,
        "shipping_amount": shippingAmount,
        "total_amount": totalAmount,
        "total_item_count": totalItemCount,
        "contact_name": contactName,
        "contact_phone": contactPhone,
        "contact_email": contactEmail,
        "user_address_id": userAddressId,
        "contact_address": contactAddress,
        "contact_area_id": contactAreaId,
        "delivery_type": deliveryType,
        "payment_method": paymentMethod,
        "payment_status": paymentStatus,
        "order_note": orderNote,
        "trans_lat": transLat,
        "trans_lng": transLng,
        "delivery_pickup_date": deliveryPickupDate,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
        "order_details":
            List<dynamic>.from(orderDetails!.map((x) => x.toJson())),
      };
}

class OrderDetail {
  OrderDetail({
    required this.id,
    required this.orderId,
    required this.orderStatusId,
    required this.shopId,
    required this.productId,
    required this.qty,
    required this.price,
    this.discountAmount,
    this.discountPercent,
    required this.totalAmount,
    this.createdDate,
    this.createdUserId,
    this.updatedDate,
    this.updatedUserId,
  });

  int id;
  int orderId;
  int orderStatusId;
  int shopId;
  int productId;
  int qty;
  double price;
  double? discountAmount;
  double? discountPercent;
  double totalAmount;
  String? createdDate;
  int? createdUserId;
  String? updatedDate;
  int? updatedUserId;

  factory OrderDetail.fromJson(Map<String, dynamic> json) => OrderDetail(
        id: json["id"],
        orderId: json["order_id"],
        orderStatusId: json["order_status_id"],
        shopId: json["shop_id"],
        productId: json["product_id"],
        qty: json["qty"],
        price: json["price"],
        discountAmount: json["discount_amount"],
        discountPercent: json["discount_percent"],
        totalAmount: json["total_amount"],
        createdDate: json["created_date"] ?? "",
        createdUserId: json["created_user_id"],
        updatedDate: json["updated_date"] ?? "",
        updatedUserId: json["updated_user_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "order_status_id": orderStatusId,
        "shop_id": shopId,
        "product_id": productId,
        "qty": qty,
        "price": price,
        "discount_amount": discountAmount,
        "discount_percent": discountPercent,
        "total_amount": totalAmount,
        "created_date": createdDate,
        "created_user_id": createdUserId,
        "updated_date": updatedDate,
        "updated_user_id": updatedUserId,
      };
}
