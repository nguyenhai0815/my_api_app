import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_api_app/products/product.dart';
import 'package:flutter/services.dart' show rootBundle;

class ApiService {
  Future<List<Product>> fetchProducts() async {
    try {
      final jsonString = await rootBundle.loadString('assets/mock_data.json');

      final List<dynamic> data = json.decode(jsonString);
      return data.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Đã xảy ra lỗi khi đọc dữ liệu từ tệp mock_data.json: $e');
    }
  }
}