import 'package:e_delivery_app/constants.dart';
import 'package:flutter/material.dart';

abstract class Shadows {
  static const BoxShadow dropShadow = BoxShadow(
    offset: Offset(4, 4),
    blurRadius: 15,
    color: Color.fromARGB(26, 0, 0, 0),
  );
  static const BoxShadow ctaDropShadow = BoxShadow(
    offset: Offset(6, 8),
    blurRadius: 15,
    color: Color.fromARGB(39, 0, 0, 0),
  );
  static const BoxShadow innerShadow = BoxShadow(
    offset: Offset(0, 0),
    blurRadius: 10,
    color: Color.fromARGB(51, 0, 0, 0),
    spreadRadius: -1,
  );
}
