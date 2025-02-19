import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Api {
  final Dio dio;

  Api({required this.dio});

  Future<dynamic> get({required String url}) async {
    Response response = await dio.get(url);
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception('error with statue code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    try {
      if (token != null) {
        headers.addAll({'Authorization': 'Bearer $token'});
      }
      Response response = await dio.post(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      throw Exception("${e.toString()} there was an error!!!");
    }
  }

  Future<dynamic> put(
      {required String url,
      @required dynamic body,
      @required String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({'Content-Type': 'application/x-www-form-urlencoded'});
    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }
    debugPrint('url is : $url and body is $body');
    try {
      Response response = await dio.put(
        url,
        data: body,
        options: Options(headers: headers),
      );
      return response.data;
    } catch (e) {
      throw Exception("${e.toString()} there was an error!!!");
    }
  }
}
