import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

import 'package:dio/dio.dart';

class AllProductService {
  final Dio dio;
  final String baseUrl = 'https://fakestoreapi.com';
  AllProductService({required this.dio});

  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> jsonData =
        await Api(dio: Dio()).get(url: '$baseUrl/products');

    List<ProductModel> products = [];
    for (var product in jsonData) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }
}
