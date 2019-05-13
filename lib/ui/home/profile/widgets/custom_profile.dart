import 'package:flutter/material.dart';
import 'package:flutter_social/ui/home/profile/models/categories.dart';

Widget customText(String text) {
  return Padding(
    padding: EdgeInsets.only(top: 5.0),
    child: Text(
      text,
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget selectGender(String gender) {
  return Padding(
    padding: EdgeInsets.only(left: 10.0, top: 5.0),
    child: Image.asset(
      gender,
      height: 40.0,
      width: 40.0,
    ),
  );
}

Widget gridView(Categories categories) {
  return Column(
    children: <Widget>[
      FlatButton(
        onPressed: null,
        child: Text(
          categories.name,
        ),
        disabledTextColor: Colors.black,
        disabledColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.deepOrange),
        ),
      )
    ],
  );
}
