import 'package:flutter_social/ui/home/categories/models/categories.dart';

class ResponseCategories {
  bool status;
  String messages;
  List<Categories> data;

  ResponseCategories({this.status, this.messages, this.data});

  ResponseCategories.fromJsonMap(Map<String, dynamic> map)
      : status = map["status"],
        messages = map["messages"],
        data = List<Categories>.from(map["data"].map((it) => Categories.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = status;
    data['messages'] = messages;
    data['data'] =
        data != null ? this.data.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
