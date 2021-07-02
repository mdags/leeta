import 'package:leeta/models/cart_model.dart';
import 'package:leeta/models/category_model.dart';
import 'package:leeta/models/order_modal.dart';
import 'package:leeta/models/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:leeta/widgets/variables.dart';

class ApiProvider {
  static Uri tokenUrl = Uri.parse('http://leeta.akillisirketler.com/api/token');
  static String tokenUser = 'leeta_sa';
  static String tokenPass = 'Le2021..';
  static String url = 'http://leeta.akillisirketler.com/api/v1';
  static var client = http.Client();

  static Future<List<CategoryModel>?> fetchCategories() async {
    var response =
        await client.get(Uri.parse(url + '/GetCategories'), headers: {
      'Accept': 'application/json',
      //'Authorization': 'bearer ' + TOKEN_KEY!
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
          //'Authorization': 'bearer ' + TOKEN_KEY!
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
          //'Authorization': 'bearer ' + TOKEN_KEY!
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
          //'Authorization': 'bearer ' + TOKEN_KEY!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Servis çağırılamadı.";
    }
  }

  static Future<List<CartModel>?> fetchCartItems() async {
    var response = await client.get(
        Uri.parse(url + '/GetCartItems?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          //'Authorization': 'bearer ' + TOKEN_KEY!
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
          //'Authorization': 'bearer ' + TOKEN_KEY!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Servis çağırılamadı.";
    }
  }

  static Future<String> removeFromCart(String id) async {
    var response =
        await client.get(Uri.parse(url + '/RemoveFromCart?id=' + id), headers: {
      'Accept': 'application/json',
      //'Authorization': 'bearer ' + TOKEN_KEY!
    });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Servis çağırılamadı.";
    }
  }

  static Future<String> clearCart() async {
    var response = await client.get(
        Uri.parse(url + '/ClearCart?userId=' + USER_ID.toString()),
        headers: {
          'Accept': 'application/json',
          //'Authorization': 'bearer ' + TOKEN_KEY!
        });
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Servis çağırılamadı.";
    }
  }

  static Future<String> completeOrder(OrderModel model) async {
    var response = await client.post(Uri.parse(url + '/CompleteOrder'),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          // 'Authorization': 'bearer ' + Variables.accessToken
        },
        body: orderModelToJsonSingle(model));
    if (response.statusCode == 200) {
      return response.body.split('"').join('');
    } else {
      return "err:Servis çağırılamadı.";
    }
  }
}
