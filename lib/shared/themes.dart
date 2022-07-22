import 'package:flutter/material.dart';

ThemeData? lightTHeme = ThemeData(
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[300],
      elevation: 0.0,
      titleTextStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.black,
      ),
      iconTheme: const IconThemeData(color: Colors.black, size: 18.0)),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
    ),
    bodyText1: TextStyle(
      color: Colors.redAccent,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    caption: TextStyle(color: Colors.black, fontSize: 12.0),
    subtitle2: TextStyle(
        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
  ),
  canvasColor: Colors.grey,
  backgroundColor: Colors.grey[300],
  cardColor: Colors.white,
  primaryColor: Colors.redAccent,
  iconTheme: const IconThemeData(color: Colors.grey, size: 15.0),
);

ThemeData? darkTheme = ThemeData(
  primaryColor: Colors.redAccent,
  appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(188, 26, 25, 25),
      elevation: 0.0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white)),
  textTheme: const TextTheme(
    headline4: TextStyle(
      fontSize: 15.0,
      color: Colors.grey,
    ),
    bodyText1: TextStyle(
      color: Colors.redAccent,
    ),
    subtitle1: TextStyle(
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    caption: TextStyle(color: Colors.white70, fontSize: 12.0),
    subtitle2: TextStyle(
        color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 16.0),
  ),
  iconTheme: const IconThemeData(color: Colors.grey, size: 15.0),
  backgroundColor: const Color.fromARGB(188, 26, 25, 25),
  cardColor: Colors.black,
  canvasColor: Colors.grey,
);
