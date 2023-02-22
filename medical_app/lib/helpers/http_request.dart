import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/http_exception.dart';

Future<dynamic> sendHttpRequest(Uri url,
    {Map<String, dynamic> data = const {},
    String method = "get",
    Map<String, String> header = const {},
    String token = ''}) async {
  var headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Connection": "keep-alive"
  };
  headers = {...headers, ...header};
  if (token != '') headers["Authorization"] = "Bearer $token";
  try {
    http.Response response;
    if (method == 'patch') {
      response =
          await http.patch(url, body: json.encode(data), headers: headers);
    } else if (method == 'get') {
      response = await http.get(url, headers: headers);
    } else {
      response =
          await http.post(url, body: json.encode(data), headers: headers);
    }
    return response;
  } catch (error) {
    if (error.toString().contains("Failed host lookup") ||
        error
            .toString()
            .contains("OS Error: Software caused connection abort")) {
      throw HttpException('no internet');
    } else {
      rethrow;
    }
  }
}
