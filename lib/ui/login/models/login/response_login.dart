import 'package:flutter_social/ui/login/models/login/login.dart';

class ResponseLogin {
  bool status;
  String message;
  Login data;

  ResponseLogin({this.status, this.message, this.data});

  ResponseLogin.fromJson(Map<String, dynamic> map)
      : status = map["status"],
        message = map["message"],
        data = Login.fromJsonMap(map["data"]);
}
