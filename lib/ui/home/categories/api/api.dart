import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_social/ui/home/categories/models/response_categories.dart';
import 'package:flutter_social/utils/constantes.dart';

import 'package:http/http.dart' show Client;

class API {
  Client client = Client();

  Future<ResponseCategories> getCategories(String token) async {
    var url = baseUrl + "categories";
    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: token
    };

    final response = await client.get(url, headers: header);

    if (response.statusCode == 200) {
      return ResponseCategories.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }


}
