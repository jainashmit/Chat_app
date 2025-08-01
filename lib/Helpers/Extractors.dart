import 'dart:convert';

import 'package:http/http.dart';

extractAccessFromResponse(Response response) {
  final responseData = jsonDecode(response.body);
  final accessToken = responseData['accesstoken'] as String;
  return accessToken;
}

extractRefreshFromResponse(Response response) {
  final responseData = jsonDecode(response.body);
  final refreshToken = responseData['refreshToken'] as String;
  return refreshToken;
}