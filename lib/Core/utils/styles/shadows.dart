import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

abstract class Shadows {
  static const BoxShadow dropShadow = BoxShadow(
    offset: Offset(4, 4),
    blurRadius: 15,
    color: Color.fromARGB(26, 0, 0, 0),
  );

  static const BoxShadow iconDropShadow = BoxShadow(
    offset: Offset(2, 4),
    blurRadius: 5,
    color: Color.fromARGB(26, 0, 0, 0),
  );
  static const BoxShadow glassDropShadow = BoxShadow(
    offset: Offset(0, 8),
    blurRadius: 10,
    color: Color.fromARGB(64, 0, 0, 0),
  );
  static const BoxShadow ctaDropShadow = BoxShadow(
    offset: Offset(6, 8),
    blurRadius: 15,
    color: Color.fromARGB(39, 0, 0, 0),
  );
  static const List<BoxShadow> innerShadow = [
    BoxShadow(
      color: Color.fromARGB(26, 0, 0, 0),
    ),
    BoxShadow(
      color: kSecondaryColor,
      spreadRadius: -1,
      blurRadius: 10,
    )
  ];
}
