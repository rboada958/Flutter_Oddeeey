import 'package:flutter/material.dart';

Widget customCenter(String title, String text) {
  return Center(
    child: Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
