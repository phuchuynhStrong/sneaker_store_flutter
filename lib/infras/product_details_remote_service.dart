import 'dart:convert';

import 'package:androidker_sneaker/infras/home_remote_service.dart';
import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class ProductDetailsRemoteService {
  ProductDetailsRemoteService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseUrl = 'localhost:5001';

  Future<Product> getProductDetails(String id) async {
    final request = Uri.http(_baseUrl, '/product/$id');

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode != 200) {
        throw RequestException<Product>();
      }

      final raw = jsonDecode(response.body) as Map<String, dynamic>;
      return Product.fromJson(raw);
    } catch (e) {
      rethrow;
    }
  }
}
