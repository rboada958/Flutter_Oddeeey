import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_social/ui/home/profile/models/response_profile.dart';
import 'package:flutter_social/utils/constantes.dart';

import 'package:http/http.dart' show Client;

class API {
  Client client = Client();

  Future<ResponseProfile> getProfile(String token) async {
    var url = baseUrl + "user/profile";
    var header = {
      "Content-Type": "application/json",
      "Accept": "application/json",
      HttpHeaders.authorizationHeader: token
    };

    final response = await client.get(url, headers: header);

    if (response.statusCode == 201) {
      return ResponseProfile.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }
}
