import 'dart:developer';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class BaseApiProvider {
  static const String baseUrl = 'mocki.io';

  static Future<http.Response> get(
      {String? path, Map<String, dynamic>? params, String? token}) async {
    debugPrint('>>>>>>>>>>>>GET request');

    final Uri uri = Uri.https(baseUrl, path!, params);

    debugPrint('Request URL: $uri');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    http.Response response = await http.get(uri, headers: headers);
    debugPrint('Request headers: $headers');
    debugPrint('Response code: ${response.statusCode}');
    log('Response body: ${response.body}');
    log('Response headers: ${response.headers}');

    return response;
  }
}
