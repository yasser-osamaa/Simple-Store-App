import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class HttpGetAllProduct {
  Future<List<ProductModel>> getAllProduct() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://fakestoreapi.com/products'));
      List<ProductModel> products = [];
      List<dynamic> jsonData = jsonDecode(response.body);
      for (var element in jsonData) {
        products.add(ProductModel.fromJson(element));
      }
      debugPrint(products.toString());
      return products;
    } catch (e) {
      return [];
    }
  }
}
