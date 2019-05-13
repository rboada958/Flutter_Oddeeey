class Data {
  int id;
  String terms;
  String logo;
  String background;
  String status;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
      this.terms,
      this.logo,
      this.background,
      this.status,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> map)
      : id = map["id"],
        terms = map["terms"],
        logo = map["logo"],
        background = map["background"],
        status = map["status"],
        createdAt = map["created_at"],
        updatedAt = map["updated_at"];
}
