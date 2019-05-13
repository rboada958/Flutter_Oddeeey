class Images {
  int id;
  int user_id;
  String type;
  String file_path;
  String url;
  String created_at;
  String updated_at;

  Images(
      {this.id,
      this.user_id,
      this.type,
      this.file_path,
      this.url,
      this.created_at,
      this.updated_at});

  Images.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        user_id = map["user_id"],
        type = map["type"],
        file_path = map["file_path"],
        url = map["url"],
        created_at = map["created_at"],
        updated_at = map["updated_at"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['user_id'] = user_id;
    data['type'] = type;
    data['file_path'] = file_path;
    data['url'] = url;
    data['created_at'] = created_at;
    data['updated_at'] = updated_at;
    return data;
  }
}
