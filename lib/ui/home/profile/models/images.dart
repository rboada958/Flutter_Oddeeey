class Images {
  int id;
  int user_id;
  String type;
  String file_path;
  String url;

  Images({this.id, this.user_id, this.type, this.file_path, this.url});

  Images.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        user_id = map["user_id"],
        type = map["type"],
        file_path = map["file_path"],
        url = map["url"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = user_id;
    data['type'] = type;
    data['file_path'] = file_path;
    data['url'] = url;
    return data;
  }
}
