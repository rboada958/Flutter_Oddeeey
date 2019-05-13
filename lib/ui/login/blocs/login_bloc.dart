import 'package:flutter_social/ui/login/models/app_front/front_data.dart';
import 'package:flutter_social/ui/login/models/login/response_login.dart';
import 'package:flutter_social/ui/login/models/register/response_register.dart';
import 'package:flutter_social/ui/login/repository/repositoy_login.dart';

import 'package:rxdart/rxdart.dart';

class LoginBloc {
  final _repository = RepositoryLogin();
  final _getDataLogin = PublishSubject<FrontData>();
  final _postRegister = PublishSubject<ResponseRegister>();
  final _postLogin = PublishSubject<ResponseLogin>();
  final _postLoginGoogle = PublishSubject<ResponseLogin>();

  Observable<FrontData> get dataLogin => _getDataLogin.stream;

  Observable<ResponseRegister> get register => _postRegister.stream;

  Observable<ResponseLogin> get login => _postLogin.stream;

  Observable<ResponseLogin> get loginGoogle => _postLoginGoogle.stream;

  getDataLogin() async {
    FrontData frontData = await _repository.getDataLogin();
    _getDataLogin.sink.add(frontData);
  }

  postRegister(email, password) async {
    ResponseRegister register = await _repository.postRegister(email, password);
    _postRegister.sink.add(register);
  }

  postLogin(email, password) async {
    ResponseLogin data = await _repository.postLogin(email, password);
    _postLogin.sink.add(data);
  }

  postLoginGoogle(googleId, name, lastName, socialPhoto, email) async {
    ResponseLogin data = await _repository.postLoginGoogle(
        googleId, name, lastName, socialPhoto, email);
    _postLoginGoogle.sink.add(data);
  }

  dispose() {
    _getDataLogin.close();
    _postRegister.close();
    _postLogin.close();
    _postLoginGoogle.close();
  }
}

final loginBloc = LoginBloc();
