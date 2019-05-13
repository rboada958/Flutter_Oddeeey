import 'package:flutter/material.dart';

Widget customFlatButton(String route, String title, double size) {
  return Padding(
    padding: EdgeInsets.all(5.0),
    child: FlatButton(
      color: Colors.transparent,
      onPressed: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            route,
            width: 25,
            height: 25,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          SizedBox(
            width: size,
          ),
        ],
      ),
    ),
  );
}