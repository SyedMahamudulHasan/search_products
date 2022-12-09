import 'package:flutter/material.dart';
import 'package:search_products/controller/controller_helper.dart';
import 'package:search_products/model/product_model.dart';

class DataController extends ChangeNotifier {
  final connection = ConnectionHelper();
  int offsetValue = 0;
  bool isVisible = true;
   ProductsModel? products;
  final String baseUrl =
      "https://panel.supplyline.network/api/product/search-suggestions/?limit=10&offset=10&search=rice";
  Future<void> getProducts({productName, offset = 10}) async {
    isVisible = false;
    notifyListeners();
    offsetValue = (offset) + offsetValue;
    final response = await connection.getData(
        "https://panel.supplyline.network/api/product/search-suggestions/?limit=$offsetValue&offset=$offsetValue&search=$productName");

    if (response != null) {
      if (response.statusCode == 200) {
        isVisible = true;
        notifyListeners();
        products = ProductsModel.fromJson(response.data);
      }
    } else {
      throw Exception(response!.data);
    }
    isVisible = false;
    notifyListeners();
  }
}
