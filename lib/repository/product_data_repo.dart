import 'dart:convert';
import 'package:flutter_trainee_test/model/ProductDataModel.dart';
import 'package:http/http.dart' as http;

class FakeStoreApiService {
  static const String apiUrl = 'https://fakestoreapi.com/products';

  Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Iterable jsonResponse = json.decode(response.body);
      return jsonResponse.map((product) => Product.fromJson(product)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
