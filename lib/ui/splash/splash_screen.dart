import 'package:flutter/material.dart';
import 'package:flutter_social/commons/errorWidget.dart';

import 'package:flutter_social/ui/login/blocs/login_bloc.dart';
import 'package:flutter_social/ui/login/models/app_front/front_data.dart';
import 'package:flutter_social/ui/login/screens/login_screen.dart';
import 'package:flutter_social/ui/splash/widgets/custom_splash.dart';
import 'package:flutter_social/utils/constantes.dart';
import 'package:flutter_social/utils/utils.dart';

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
            if (snapshot.data.message != messageSuccess) {
              return buildErrorWidget(snapshot.data.message, context, Splash());
            }
            preferences.setData(snapshot.data.data);
            return Login();
          } else if (snapshot.hasError) {
            return buildErrorWidget(snapshot.data.message, context, Splash());
          } else {
            return splash();
          }
        },
      ),
    );
  }
}
