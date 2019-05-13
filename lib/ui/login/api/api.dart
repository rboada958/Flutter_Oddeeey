import 'dart:async';
import 'dart:convert';

import 'package:flutter_social/ui/login/models/app_front/front_data.dart';
import 'package:flutter_social/ui/login/models/login/response_login.dart';
import 'package:flutter_social/ui/login/models/register/response_register.dart';
import 'package:flutter_social/utils/constantes.dart';

import 'package:http/http.dart' show Client;

class API {
  Client client = Client();

  Future<FrontData> getDataLogin() async {
    final String url = baseUrl + "app-front";
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return FrontData.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<ResponseRegister> postRegister(String email, String password) async {
    final String url = baseUrl + "register";
    final response =
        await client.post(url, body: {'email': email, 'password': password});

    if (response.statusCode == 201) {
      return ResponseRegister.fromJsonMap(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ResponseLogin> postLogin(String email, String password) async {
    final String url = baseUrl + "login";
    final response =
        await client.post(url, body: {'email': email, 'password': password});

    if (response.statusCode == 200) {
      return ResponseLogin.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<ResponseLogin> postLoginGoogle(String googleId, String name,
      String lastName, String socialPhoto, String email) async {
    final String url = baseUrl + "login/auth-social";
    final response = await client.post(url, body: {
      'google_id': googleId,
      'name': name,
      'last_name': lastName,
      'social_photo': socialPhoto,
      'email': email
    });

    if (response.statusCode == 200) {
      print("Entered");
      return ResponseLogin.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
