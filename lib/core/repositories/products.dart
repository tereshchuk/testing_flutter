import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:chopper/src/response.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testing/core/api_providers/products.dart';
import 'package:flutter_testing/core/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ProductsRepository {
  static Future<List<Product>> get() async {
    final chopper = ChopperClient(
      baseUrl: 'https://mocki.io',
      services: [
        // the generated service
        TodosListService.create(ChopperClient())
      ],
    );

    final myService = chopper.getService<TodosListService>();

    final Response response = await myService.getPosts();

    //final Response response = await TodosListService.getPosts();

    final responseBody = jsonDecode(response.body).cast<Map<String, dynamic>>();
    print(responseBody);
    if (response.statusCode == 200) {
      return responseBody
          .map<Product>((json) => Product.fromJson(json))
          .toList();
    } else {
      final String message = responseBody['message'];
      throw PlatformException(
        code: 'USER_PROFILE_GET_ERROR',
        message: message,
      );
    }
  }
}
