import 'package:leeta/models/category_model.dart';
import 'package:leeta/models/product_model.dart';
import 'package:http/http.dart' as http;

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
      // 'Authorization': 'bearer ' + Variables.accessToken!
    });
    if (response.statusCode == 200) {
      return categoryModelFromJson(response.body);
    } else {
      return null;
    }
  }

  static Future<List<ProductModel>?> fetchProducts() async {
    var response = await client.get(Uri.parse(url + '/GetProducts'), headers: {
      'Accept': 'application/json',
      // 'Authorization': 'bearer ' + Variables.accessToken!
    });
    if (response.statusCode == 200) {
      return productModelFromJson(response.body);
    } else {
      return null;
    }
  }
}
