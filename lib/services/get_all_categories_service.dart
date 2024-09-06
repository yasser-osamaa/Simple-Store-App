import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';

class GetAllCategoriesService {
  final Dio dio;
  GetAllCategoriesService({required this.dio});
  final String baseUrl = 'https://fakestoreapi.com';
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> jsonData =
        await Api(dio: Dio()).get(url: '$baseUrl/products/categories');
    return jsonData;
  }
}
