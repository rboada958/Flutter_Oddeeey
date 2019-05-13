import 'package:flutter/material.dart';

Widget customRow(String route, String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Image.asset(
        route,
        width: 30.0,
        height: 30.0,
      ),
      Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
    ],
  );
}
