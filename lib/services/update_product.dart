// ignore_for_file: missing_required_param

import 'package:dio/dio.dart';
import 'package:store_app/helper/api.dart';
import 'package:store_app/models/product_model.dart';

class UpdateProduct {
  Future<ProductModel> updateProduct({
    required num id,
    required String title,
    required String price,
    required String des,
    required String image,
    required String category,
  }) async {
    Map<String, dynamic> data = await Api(dio: Dio()).put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price,
        'description': des,
        'image': image,
        'category': category,
      },
    );
    return ProductModel.fromJson(data);
  }
}
