import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class GetProductByCategory {
  final Dio dio;
  final String baseUrl = 'https://fakestoreapi.com';
  GetProductByCategory({required this.dio});

  Future<List<ProductModel>> productByCategory(
      {required String category}) async {
    List<dynamic> jsonData =
        await Api(dio: Dio()).get(url: '$baseUrl/products/category/$category');

    List<ProductModel> products = [];
    for (var product in jsonData) {
      products.add(ProductModel.fromJson(product));
    }
    return products;
  }
}
