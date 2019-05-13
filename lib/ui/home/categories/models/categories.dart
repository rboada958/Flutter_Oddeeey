class Categories {
  int id;
  String name;
  String image;

  Categories({this.id, this.name, this.image});

  Categories.fromJsonMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        image = map["image"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}
