import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../core/api_config.dart';
import '../models/dropoff_point.dart';
import '../models/product.dart';

class MarketplaceService {
  MarketplaceService({http.Client? client}) : _client = client ?? http.Client();

  final http.Client _client;
  static const _base = '/api/v1/marketplace';

  Future<List<Product>> fetchProducts({
    String query = '',
    String category = '',
    String sort = 'newest',
  }) async {
    final data = await _getList('$_base/products/', {
      'q': query,
      'category': category,
      'sort': sort,
    });
    return data.map((e) => Product.fromJson(e)).toList();
  }

  Future<Product> fetchProduct(int id) async {
    final data = await _get('$_base/products/$id/');
    return Product.fromJson(data as Map<String, dynamic>);
  }

  Future<List<ProductCategory>> fetchCategories() async {
    final data = await _getList('$_base/categories/');
    return data.map((e) => ProductCategory.fromJson(e)).toList();
  }

  Future<List<DropOffPoint>> fetchDropOffPoints({
    String query = '',
    String city = '',
  }) async {
    final data = await _getList('$_base/dropoff-points/', {'q': query, 'city': city});
    return data.map((e) => DropOffPoint.fromJson(e)).toList();
  }

  Future<List<String>> fetchDropOffCities() async {
    final data = await _get('$_base/dropoff-points/cities/');
    return [for (final city in data as List) city.toString()];
  }

  Future<List<Map<String, dynamic>>> _getList(
    String path, [
    Map<String, String>? query,
  ]) async {
    final data = await _get(path, query);
    return (data as List).cast<Map<String, dynamic>>();
  }

  Future<dynamic> _get(String path, [Map<String, String>? query]) async {
    final response = await _client
        .get(ApiConfig.uri(path, query), headers: {'Accept': 'application/json'})
        .timeout(const Duration(seconds: 15));
    if (response.statusCode == 404) {
      throw const MarketplaceException('Data tidak ditemukan.');
    }
    if (response.statusCode != 200) {
      throw MarketplaceException(
        'Server mengembalikan kode ${response.statusCode}.',
      );
    }
    return jsonDecode(utf8.decode(response.bodyBytes));
  }
}

class MarketplaceException implements Exception {
  final String message;
  const MarketplaceException(this.message);

  @override
  String toString() => message;
}
