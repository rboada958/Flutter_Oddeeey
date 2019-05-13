import 'package:flutter_social/ui/login/models/login/categories.dart';
import 'package:flutter_social/ui/login/models/login/images.dart';

class Login {
  int id;
  String email;
  int role_id;
  Object facebook_id;
  Object google_id;
  int status;
  String api_token;
  String created_at;
  String updated_at;
  bool profile_active;
  List<Categories> categories;
  List<Images> images;

  Login(
      {this.id,
      this.email,
      this.role_id,
      this.facebook_id,
      this.google_id,
      this.status,
      this.api_token,
      this.created_at,
      this.updated_at,
      this.profile_active,
      this.categories,
      this.images});

  Login.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        email = map["email"],
        role_id = map["role_id"],
        facebook_id = map["facebook_id"],
        google_id = map["google_id"],
        status = map["status"],
        api_token = map["api_token"],
        created_at = map["created_at"],
        updated_at = map["updated_at"],
        profile_active = map["profile_active"],
        categories = List<Categories>.from(
            map["categories"].map((it) => Categories.fromJsonMap(it))),
        images = List<Images>.from(
            map["images"].map((it) => Images.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['role_id'] = role_id;
    data['facebook_id'] = facebook_id;
    data['google_id'] = google_id;
    data['status'] = status;
    data['api_token'] = api_token;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['profile_active'] = profile_active;
    data['categories'] = categories != null
        ? this.categories.map((v) => v.toJson()).toList()
        : null;
    data['images'] =
        images != null ? this.images.map((v) => v.toJson()).toList() : null;
    return data;
  }
}
