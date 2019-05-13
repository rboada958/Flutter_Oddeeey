import 'package:flutter_social/ui/home/profile/models/images.dart';
import 'package:flutter_social/ui/home/profile/models/categories.dart';

class Profile {
  int id;
  String name;
  String last_name;
  String phone;
  String birthday;
  String email;
  int gender;
  int role_id;
  Object facebook_id;
  Object google_id;
  int status;
  String api_token;
  String created_at;
  String updated_at;
  bool profile_active;
  List<Images> images;
  List<Categories> categories;

  Profile(
      {this.id,
      this.name,
      this.last_name,
      this.phone,
      this.birthday,
      this.email,
      this.gender,
      this.role_id,
      this.facebook_id,
      this.google_id,
      this.status,
      this.api_token,
      this.created_at,
      this.updated_at,
      this.profile_active,
      this.images,
      this.categories});

  Profile.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        last_name = map["last_name"],
        phone = map["phone"],
        birthday = map["birthday"],
        email = map["email"],
        gender = map["gender"],
        role_id = map["role_id"],
        facebook_id = map["facebook_id"],
        google_id = map["google_id"],
        status = map["status"],
        api_token = map["api_token"],
        created_at = map["created_at"],
        updated_at = map["updated_at"],
        profile_active = map["profile_active"],
        images = List<Images>.from(
            map["images"].map((it) => Images.fromJsonMap(it))),
        categories = List<Categories>.from(
            map["categories"].map((it) => Categories.fromJsonMap(it)));

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['last_name'] = last_name;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['email'] = email;
    data['gender'] = gender;
    data['role_id'] = role_id;
    data['facebook_id'] = facebook_id;
    data['google_id'] = google_id;
    data['status'] = status;
    data['api_token'] = api_token;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['profile_active'] = profile_active;
    data['images'] =
        images != null ? this.images.map((v) => v.toJson()).toList() : null;
    data['categories'] = categories != null
        ? this.categories.map((v) => v.toJson()).toList()
        : null;
    return data;
  }
}
