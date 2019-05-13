import 'package:flutter/material.dart';

import 'package:flutter_social/ui/login/widgets/custom_text_field.dart';
import 'package:flutter_social/utils/constantes.dart';
import 'package:flutter_social/utils/validator.dart';

class RegisterTab extends StatefulWidget {
  @override
  _RegisterTabState createState() => _RegisterTabState();
}

class _RegisterTabState extends State<RegisterTab> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  CustomTextField _emailField;
  CustomTextField _passwordField;

  bool _progress;

  SizedBox _sizedBox(double height) {
    return SizedBox(height: height);
  }

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

  @override
  Widget build(BuildContext context) {
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
                              "¿You are a user? Sign in",
                              style: TextStyle(color: Colors.black),
                            ),
                            Image.asset(
                              imageRegister,
                              height: 150.0,
                              width: 150.0,
                            ),
                            _sizedBox(40.0),
                          ],
                        ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "When sign in, you accept",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(width: 5.0),
                      Text(
                        "¿terms and conditions of use?",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
        },
        color: Colors.deepOrange,
        textColor: Colors.white,
        child: Text("REGISTER"),
      ),
    );
  }
}
