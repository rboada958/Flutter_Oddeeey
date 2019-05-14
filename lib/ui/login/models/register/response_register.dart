import 'package:flutter_social/ui/login/models/register/register.dart';

class ResponseRegister {
  bool status;
  String message;
  Register data;

  ResponseRegister({this.status, this.message, this.data});

  ResponseRegister.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        message = map["message"],
        data = Register.fromJsonMap(map["data"]);

  ResponseRegister.withError(String error)
      : status = false,
        message = error,
        data = null;
}
