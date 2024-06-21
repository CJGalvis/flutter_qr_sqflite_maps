import 'package:flutter/material.dart';

AppBarTheme appBarStyles(context) {
  return AppBarTheme(
    backgroundColor: Theme.of(context).primaryColor,
    actionsIconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: const IconThemeData(color: Colors.white),
  );
}
