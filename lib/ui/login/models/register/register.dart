class Register {
  String email;
  int role_id;
  int status;
  String updated_at;
  String created_at;
  int id;
  String api_token;

  Register(
      {this.email,
      this.role_id,
      this.status,
      this.updated_at,
      this.created_at,
      this.id,
      this.api_token});

  Register.fromJsonMap(Map<String, dynamic> map)
      : email = map["email"],
        role_id = map["role_id"],
        status = map["status"],
        updated_at = map["updated_at"],
        created_at = map["created_at"],
        id = map["id"],
        api_token = map["api_token"];
}
