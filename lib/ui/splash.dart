import 'package:flutter/material.dart';

import 'package:flutter_social/ui/login/blocs/login_bloc.dart';
import 'package:flutter_social/ui/login/models/app_front/front_data.dart';
import 'package:flutter_social/ui/login/screens/login.dart';
import 'package:flutter_social/utils/constantes.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    loginBloc.getDataLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<FrontData>(
        stream: loginBloc.dataLogin,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Login();
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return _splash();
        },
      ),
    );
  }

  Widget _splash() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(fondo),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Image.asset(
          logo,
          height: 150.0,
          width: 150.0,
        ),
      ),
    );
  }
}
