import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_api_app/products/product.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:developer' as developer;

class ApiService {
  List<Product> temporaryProducts = [];
  int _nextProductId = 1;

  Future<List<Product>> fetchProducts() async {
    try {
      final jsonString = await rootBundle.loadString('assets/mock_data.json');

      final List<dynamic> data = json.decode(jsonString);
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Đã xảy ra lỗi khi đọc dữ liệu từ tệp mock_data.json: $e');
    }
  }

  Future<Product> addProduct(NewProduct newProduct) async {
    final addedProduct = Product(
      id: _nextProductId,
      name: newProduct.name,
      price: newProduct.price,
    );
    temporaryProducts.add(addedProduct);
    _nextProductId++;

    return addedProduct;
  }
}
