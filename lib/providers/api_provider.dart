import 'dart:convert';

import 'package:leeta/models/address_model.dart';
import 'package:leeta/models/cart_model.dart';
import 'package:leeta/models/category_model.dart';
import 'package:leeta/models/favourite_model.dart';
import 'package:leeta/models/member_model.dart';
import 'package:leeta/models/order_modal.dart';
import 'package:leeta/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:leeta/models/user_model.dart';
import 'package:leeta/widgets/variables.dart';

class ApiProvider {
  static String tokenUrl =
      'https://leeta.azurewebsites.net/api/token/Authenticate';
  static String tokenUser = 'leeta_sa';
  static String tokenPass = 'Le2021..';
  static String url = 'https://leeta.azurewebsites.net/api/v1';
  static var client = http.Client();

  static Future<void> getToken() async {
    var response = await client.post(Uri.parse(tokenUrl),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "user_name": "leeta_sa",
          "user_password": "Le2021..",
          "role": "admin"
        }));
    if (response.statusCode == 200) {
      var decodeList = json.decode(response.body);
      ACCESS_TOKEN = decodeList["token"];
    }
  }

  static Future<MemberModel?> getProfile() async {
    var response = await client.get(
        Uri.parse(url + '/GetMemberProfile?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return memberModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<String> updateProfile(MemberModel model) async {
    var response = await client.post(Uri.parse(url + '/UpdateMemberProfile'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        },
        body: memberModelToJsonSingle(model));
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else if (response.statusCode == 500) {
      return json.decode(response.body)["error"];
    } else {
      return "err:Service error.";
    }
  }

  static Future<String> changePassword(oldPassword, newPassword) async {
    var response = await client.get(
        Uri.parse(url +
            '/ChangeMemberPassword?userId=' +
            USER_ID.toString() +
            '&oldPassword=' +
            oldPassword +
            '&newPassword=' +
            newPassword),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else if (response.statusCode == 500) {
      return json.decode(response.body)["error"];
    } else {
      return "err:Service error.";
    }
  }

  static Future<String?> uploadProfilePhoto(
      String filename, String path) async {
    var request = http.MultipartRequest('POST',
        Uri.parse(url + '/UpdateProfilePhoto?userId=' + USER_ID.toString()));
    request.headers["Authorization"] = "bearer " + ACCESS_TOKEN!;
    request.files.add(await http.MultipartFile.fromPath(filename, path));
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    return response.reasonPhrase.toString();
  }

  static Future<List<CategoryModel>?> fetchCategories() async {
    var response = await client.get(Uri.parse(url + '/GetCategories'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<ProductModel>?> fetchProducts(String catId) async {
    var response = await client.get(
        Uri.parse(url +
            '/GetProducts?userId=' +
            USER_ID.toString() +
            '&catId=' +
            catId),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<ProductModel?> getProductById(String id) async {
    var response = await client.get(
        Uri.parse(
            url + '/GetProductById?userId=' + USER_ID.toString() + '&id=' + id),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      var list = productModelFromJson(response.body);
      if (list.length > 0)
        return list[0];
      else
        return null;
    } else {
      return null;
    }
  }

  static Future<String> setFavourite(String productId) async {
    var response = await client.get(
        Uri.parse(url +
            '/SetFavourite?userId=' +
            USER_ID.toString() +
            '&productId=' +
            productId),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Service error.";
    }
  }

  static Future<List<CartModel>?> fetchCartItems() async {
    var response = await client.get(
        Uri.parse(url + '/GetCartItems?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<String> setCart(String productId, String qty) async {
    var response = await client.get(
        Uri.parse(url +
            '/SetCart?userId=' +
            USER_ID.toString() +
            '&productId=' +
            productId +
            '&qty=' +
            qty),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Service error.";
    }
  }

  static Future<String> removeFromCart(String id) async {
    var response = await client.get(Uri.parse(url + '/RemoveFromCart?id=' + id),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Service error.";
    }
  }

  static Future<String> clearCart() async {
    var response = await client.get(
        Uri.parse(url + '/ClearCart?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Service error.";
    }
  }

  static Future<String> completeOrder(OrderModel model) async {
    var response = await client.post(Uri.parse(url + '/CompleteOrder'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        },
        body: orderModelToJsonSingle(model));
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Service error.";
    }
  }

  static Future<List<FavouriteModel>?> fetchFavourites() async {
    var response = await client.get(
        Uri.parse(url + '/GetFavourites?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return favouriteModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<OrderModel>?> fetchOrders() async {
    var response = await client.get(
        Uri.parse(url + '/GetOrders?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return orderModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<AddressModel>?> fetchAddress() async {
    var response = await client.get(
        Uri.parse(url + '/GetAddress?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return addressModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<String> addAddress(String adrName, String fullAddress) async {
    var response = await client.get(
        Uri.parse(url +
            '/AddAddress?userId=' +
            USER_ID.toString() +
            '&adrName=' +
            adrName +
            '&fullAddress=' +
            fullAddress),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Service error.";
    }
  }

  static Future<String> delAddress(String id) async {
    var response = await client.get(Uri.parse(url + '/DelAddress?id=' + id),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'bearer ' + ACCESS_TOKEN!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Service error.";
    }
  }
}
