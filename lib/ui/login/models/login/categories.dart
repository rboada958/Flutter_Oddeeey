import 'package:flutter_social/ui/login/models/login/pivot.dart';

class Categories {
  int id;
  String name;
  String image;
  String file_path;
  String localization;
  int status;
  String created_at;
  String updated_at;
  Pivot pivot;

  Categories(
      {this.id,
      this.name,
      this.image,
      this.file_path,
      this.localization,
      this.status,
      this.created_at,
      this.updated_at,
      this.pivot});

  Categories.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        image = map["image"],
        file_path = map["file_path"],
        localization = map["localization"],
        status = map["status"],
        created_at = map["created_at"],
        updated_at = map["updated_at"],
        pivot = Pivot.fromJsonMap(map["pivot"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['file_path'] = file_path;
    data['localization'] = localization;
    data['status'] = status;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    data['pivot'] = pivot == null ? null : pivot.toJson();
    return data;
  }
}
