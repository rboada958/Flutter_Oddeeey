class Pivot {
  int user_id;
  int category_id;

  Pivot({this.user_id, this.category_id});

  Pivot.fromJsonMap(Map<String, dynamic> map)
      : user_id = map["user_id"],
        category_id = map["category_id"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = user_id;
    data['category_id'] = category_id;
    return data;
  }
}
