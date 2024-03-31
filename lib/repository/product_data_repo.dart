import 'dart:convert';
import 'package:flutter_trainee_test/model/product/product.dart';
import 'package:http/http.dart' as http;

class FakeStoreApiService {
  static const String apiUrl = 'https://fakestoreapi.com/products';

  List<Product> productList = [];
  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    Iterable jsonResponse = json.decode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in jsonResponse) {
        productList.add(Product.fromJson(i));
      }
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
