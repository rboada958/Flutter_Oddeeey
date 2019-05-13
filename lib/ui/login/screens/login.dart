import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_social/ui/home/home.dart';

import 'package:flutter_social/ui/login/blocs/login_bloc.dart';
import 'package:flutter_social/ui/login/models/login/request_login.dart';
import 'package:flutter_social/ui/login/models/login/response_login.dart';
import 'package:flutter_social/ui/login/screens/register.dart';
import 'package:flutter_social/ui/login/widgets/custom_center.dart';
import 'package:flutter_social/ui/login/widgets/custom_row.dart';
import 'package:flutter_social/utils/auth.dart';
import 'package:flutter_social/utils/constantes.dart';
import 'package:flutter_social/utils/utils.dart';

import 'package:page_indicator/page_indicator.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _progress;

  String _fondo =
      "https://s3.amazonaws.com/betting-production/Appfront/background/1556636792.jpeg";
  String _logo =
      "https://s3.amazonaws.com/betting-production/Appfront/logo/1554237209.png";

  final PageController controller = PageController();

  void _signInGoogle() async {
    await Auth.signInGoogle().then(getDataGoogle);
  }

  void getDataGoogle(RequestLogin request) {
    setState(() {
      _progress = true;
    });
    loginBloc.postLoginGoogle(request.idSocial.toString(), request.name,
        request.lastName, request.socialFoto, request.email);
  }

  void _signInEmail() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Register()),
    );
  }

  @override
  void initState() {
    super.initState();
    _progress = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ResponseLogin>(
        stream: loginBloc.loginGoogle,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print("Token in the login: ${snapshot.data.data.api_token}");
            preferences.setApiToken(snapshot.data.data.api_token);
            return Home();
          } else {
            return _loginView();
          }
        },
      ),
    );
  }

  RoundedRectangleBorder _borderButton() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    );
  }

  Widget _fadeInImage() {
    return FadeInImage.assetNetwork(
      placeholder: placeholder,
      image: _logo,
      height: 150.0,
      width: 150.0,
    );
  }

  Widget _containerViewPage() {
    return Container(
      height: 160.0,
      width: 290.0,
      padding: EdgeInsets.only(top: 20.0),
      child: PageIndicatorContainer(
        align: IndicatorAlign.bottom,
        indicatorColor: Colors.white30,
        indicatorSelectorColor: Colors.white,
        indicatorSpace: 10.0,
        length: 4,
        pageView: PageView(
          children: <Widget>[
            customCenter(welcome, pageOne),
            customCenter(search, pageTwo),
            customCenter(choose, pageThree),
            customCenter(winning, pageFour),
          ],
          controller: controller,
        ),
      ),
    );
  }

  Widget _containerButton() {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: 240.0,
      child: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              color: Colors.white,
              child: customRow(facebook, continueFacebook),
              onPressed: () {},
              shape: _borderButton(),
            ),
            RaisedButton(
              color: Colors.white,
              child: customRow(google, continueGoogle),
              onPressed: _signInGoogle,
              shape: _borderButton(),
            ),
            RaisedButton(
              color: Colors.white,
              child: customRow(mail, continueEmail),
              onPressed: _signInEmail,
              shape: _borderButton(),
            ),
            FlatButton(
              color: Colors.transparent,
              textColor: Colors.white,
              onPressed: () {},
              child: Text(
                byClick,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginView() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(_fondo),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.only(top: 60.0),
      child: Center(
        child: _progress
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            : Column(
                children: <Widget>[
                  _fadeInImage(),
                  _containerViewPage(),
                  _containerButton(),
                ],
              ),
      ),
    );
  }
}
