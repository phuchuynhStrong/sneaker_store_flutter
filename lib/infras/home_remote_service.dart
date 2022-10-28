import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:model/model.dart';

class RequestException<T> implements Exception {}

class HomeRemoteService {
  HomeRemoteService({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  final http.Client _httpClient;
  static const _baseUrl = 'localhost:5001';

  Future<List<ProductTag>> fetchProductTags() async {
    final request = Uri.http(_baseUrl, '/tags');

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode != 200) {
        throw RequestException<ProductTag>();
      }

      final raw = jsonDecode(response.body) as List<dynamic>;
      return raw
          .map((e) => ProductTag.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Product>> getProductsWithCategory(String categoryId) async {
    final request = Uri.http(_baseUrl, '/product', {'cId': categoryId});

    try {
      final response = await _httpClient.get(request);

      if (response.statusCode != 200) {
        throw RequestException<ProductTag>();
      }

      final raw = jsonDecode(response.body) as List<dynamic>;
      return raw
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
