import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_social/ui/login/blocs/login_bloc.dart';
import 'package:flutter_social/ui/login/models/login/response_login.dart';
import 'package:flutter_social/ui/login/widgets/custom_text_field.dart';
import 'package:flutter_social/utils/constantes.dart';
import 'package:flutter_social/utils/utils.dart';
import 'package:flutter_social/utils/validator.dart';

class SignInTab extends StatefulWidget {
  @override
  _SignInTabState createState() => _SignInTabState();
}

class _SignInTabState extends State<SignInTab> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  CustomTextField _emailField;
  CustomTextField _passwordField;

  bool _progress;

  @override
  void initState() {
    super.initState();

    _progress = false;
    _emailField = new CustomTextField(
      borderColor: Colors.grey[400],
      controller: _email,
      errorColor: Colors.red,
      hint: "Email",
      inputType: TextInputType.emailAddress,
      obscureText: false,
      route: gmail,
      successColor: Colors.blue,
      validator: Validator.validateEmail,
    );

    _passwordField = CustomTextField(
      borderColor: Colors.grey[400],
      controller: _password,
      errorColor: Colors.red,
      hint: "Password",
      obscureText: true,
      route: password,
      successColor: Colors.blue,
      validator: Validator.validatePassword,
    );
  }

  void _signInEmail({String email, String password}) {
    setState(() {
      _progress = true;
    });

    if (Validator.validateEmail(email) &&
        Validator.validatePassword(password)) {
      loginBloc.postLogin(email, password);
    } else {
      showToast("Email and Password are required", Colors.white, Colors.black);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ResponseLogin>(
        stream: loginBloc.login,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return _formLogin();
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget _sizedBox(double height) {
    return SizedBox(height: height);
  }

  Widget _formLogin() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 50.0),
                  width: 280.0,
                  child: _progress
                      ? Column(
                          children: <Widget>[
                            _sizedBox(150.0),
                            Center(
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.deepOrange),
                              ),
                            ),
                            _sizedBox(10.0),
                          ],
                        )
                      : Column(
                          children: <Widget>[
                            _emailField,
                            _sizedBox(20.0),
                            _passwordField,
                            _sizedBox(10.0),
                            Text(
                              "¿Have you forgotten your password?",
                              style: TextStyle(color: Colors.black),
                            ),
                            _sizedBox(30.0),
                            Image.asset(
                              imageRegister,
                              height: 150.0,
                              width: 150.0,
                            ),
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: RaisedButton(
        onPressed: () {
//          _signInEmail(email: _email.text, password: _password.text);
        },
        color: Colors.deepOrange,
        textColor: Colors.white,
        child: Text("LOGIN"),
      ),
    );
  }
}
