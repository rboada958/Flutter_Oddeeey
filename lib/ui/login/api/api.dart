import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_social/commons/handleError.dart';

import 'package:flutter_social/ui/login/models/app_front/front_data.dart';
import 'package:flutter_social/ui/login/models/login/request_login.dart';
import 'package:flutter_social/ui/login/models/login/response_login.dart';
import 'package:flutter_social/ui/login/models/register/response_register.dart';
import 'package:flutter_social/utils/constantes.dart';

import 'package:http/http.dart' show Client;

class API {
  final Dio _dio = Dio();

  Client client = Client();

  Future<FrontData> getDataLogin() async {
    final String _endpoint = baseUrl + "app-front";

    try {
      Response response = await _dio.get(_endpoint);
      return FrontData.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return FrontData.withError(handleError(error));
    }
  }

  Future<ResponseRegister> postRegister(String email, String password) async {
    final String _endpoint = baseUrl + "register";

    try {
      Response response = await _dio.post(_endpoint, data: {
        'email': email,
        'password': password,
      });
      return ResponseRegister.fromJsonMap(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseRegister.withError(handleError(error));
    }
  }

  Future<ResponseLogin> postLogin(String email, String password) async {
    final String _endpoint = baseUrl + "login";

    try {
      Response response = await _dio.post(_endpoint, data: {
        'email': email,
        'password': password,
      });
      return ResponseLogin.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseLogin.withError(handleError(error));
    }
  }

  Future<ResponseLogin> postLoginGoogle(RequestLogin request) async {
    final String _endpoint = baseUrl + "login/auth-social";

    try {
      Response response = await _dio.post(_endpoint, data: {
        'google_id': request.idSocial.toString(),
        'name': request.name,
        'last_name': request.lastName,
        'social_photo': request.socialFoto,
        'email': request.email
      });
      return ResponseLogin.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return ResponseLogin.withError(handleError(error));
    }
  }
}
