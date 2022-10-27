import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_api_flutter_course/consts/api_const.dart';
import 'package:store_api_flutter_course/models/categories_model.dart';
import 'package:store_api_flutter_course/models/product_model.dart';
import 'package:store_api_flutter_course/models/users_model.dart';

class APIHandler {
  static Future<List<dynamic>> getData({required String target}) async {
    var uri = Uri.https(BASE_URL, "api/v1/$target");
    var response = await http.get(uri);

    //print("response ${jsonDecode(response.body)}");

    var data = jsonDecode(response.body);

    List tempList = [];
    for (var v in data) {
      tempList.add(v);

      //print("V $v \n\n");
    }
    return tempList;
  }

  static Future<List<ProductModel>> getAllProducts() async {
    List temp = await getData(target: "products");
    return ProductModel.productFromSnapshot((temp));
  }

  static Future<List<CategoriesModel>> getAllCategories() async {
    List temp = await getData(target: "categories");
    return CategoriesModel.categriesFromSnapshot((temp));
  }

  static Future<List<UsersModel>> getAllUsers() async {
    List temp = await getData(target: "users");
    return UsersModel.usersFromSnapshot((temp));
  }
}
