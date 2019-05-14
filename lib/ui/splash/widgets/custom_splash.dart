import 'package:flutter/material.dart';
import 'package:flutter_social/utils/constantes.dart';

Widget splash() {
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