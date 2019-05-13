import 'package:flutter_social/ui/login/api/api.dart';
import 'package:flutter_social/ui/login/models/app_front/front_data.dart';
import 'package:flutter_social/ui/login/models/login/response_login.dart';
import 'package:flutter_social/ui/login/models/register/response_register.dart';

class RepositoryLogin {
  final apiProvider = API();

  Future<FrontData> getDataLogin() => apiProvider.getDataLogin();

  Future<ResponseRegister> postRegister(email, password) =>
      apiProvider.postRegister(email, password);

  Future<ResponseLogin> postLogin(email, password) =>
      apiProvider.postLogin(email, password);

  Future<ResponseLogin> postLoginGoogle(
          googleId, name, lastName, socialPhoto, email) =>
      apiProvider.postLoginGoogle(googleId, name, lastName, socialPhoto, email);
}
