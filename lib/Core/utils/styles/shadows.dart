import 'package:flutter/material.dart';

abstract class Shadows {
  static const BoxShadow dropShadow = BoxShadow(
    offset: Offset(4, 4),
    blurRadius: 15,
    color: Color.fromARGB(26, 0, 0, 0),
  );
  static const BoxShadow iconContentDropShadow = BoxShadow(
    offset: Offset(0, 2),
    blurRadius: 10,
    color: Color.fromARGB(26, 0, 0, 0),
  );
  static const BoxShadow dropDownButtonDropShadow = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 8,
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
  static List<BoxShadow> innerShadow(context) {
    return [
      const BoxShadow(
        color: Color.fromARGB(26, 0, 0, 0),
      ),
      BoxShadow(
        color: Theme.of(context).colorScheme.secondary,
        spreadRadius: -1,
        blurRadius: 10,
      )
    ];
  }

  static List<BoxShadow> deleteInnerShadow(context) {
    return [
      const BoxShadow(
        color: Color.fromARGB(39, 0, 0, 0),
      ),
      BoxShadow(
        offset: const Offset(0, -4),
        color: Theme.of(context).colorScheme.tertiary,
        spreadRadius: -1,
        blurRadius: 8,
      )
    ];
  }
}
