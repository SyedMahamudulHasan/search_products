import 'package:flutter/material.dart';
import 'package:search_products/controller/controller_helper.dart';
import 'package:search_products/model/product_model.dart';

class DataController extends ChangeNotifier {
  final connection = ConnectionHelper();
  final String baseUrl =
      "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice";
  Future<ProductsModel?> getProducts({productName, offset = 10}) async {
    final response = await connection.getData(
        "https://panel.supplyline.network/api/product/search-suggestions/?limit=$offset&offset=$offset&search=$productName");

    if (response != null) {
      if (response.statusCode == 200) {
        return ProductsModel.fromJson(response.data);
      }
    } else {
      throw Exception(response!.data);
    }
    return null;
  }
}
