import 'package:flutter/material.dart';
import 'package:flutter_social/utils/constantes.dart';

Widget buildErrorWidget(String error, BuildContext context, Object object) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(fondo),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                error,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
            FlatButton(
              color: Colors.transparent,
              disabledColor: Colors.transparent,
              textColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.white),
              ),
              onPressed: () {
                _tryAgain(context, object);
              },
              child: Text(
                'Try again',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void _tryAgain(BuildContext context, Object object) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => object),
      (Route<dynamic> route) => false);
}
