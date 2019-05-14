import 'package:flutter_social/ui/login/models/app_front/data.dart';

class FrontData {
  bool status;
  String message;
  Data data;

  FrontData({this.status, this.message, this.data});

  FrontData.fromJson(Map<String, dynamic> map)
      : status = map["status"],
        message = map["message"],
        data = Data.fromJson(map["data"]);

  FrontData.withError(String error)
      : status = false,
        message = error,
        data = null;
}
