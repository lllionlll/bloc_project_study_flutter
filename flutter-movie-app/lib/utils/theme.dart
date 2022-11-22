import 'package:flutter/material.dart';

Map<int, Color> _color = {
  50: const Color.fromRGBO(90, 4, 8, .1),
  100: const Color.fromRGBO(90, 4, 8, .2),
  200: const Color.fromRGBO(90, 4, 8, .3),
  300: const Color.fromRGBO(90, 4, 8, .4),
  400: const Color.fromRGBO(90, 4, 8, .5),
  500: const Color.fromRGBO(90, 4, 8, .6),
  600: const Color.fromRGBO(90, 4, 8, .7),
  700: const Color.fromRGBO(90, 4, 8, .8),
  800: const Color.fromRGBO(90, 4, 8, .9),
  900: const Color.fromRGBO(90, 4, 8, 1),
};

MaterialColor _colorCustom = MaterialColor(0xFFE50914, _color);

abstract class MovieTheme {
  static ThemeData get dark => ThemeData(
        primarySwatch: _colorCustom,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headline1: const TextStyle(fontSize: 24.0, color: Colors.white),
          headline2: TextStyle(fontSize: 20.0, color: _colorCustom),
          bodyText1: const TextStyle(fontSize: 14.0, color: Colors.white),
        ),
        appBarTheme: const AppBarTheme(
          toolbarHeight: 80,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
  
        scaffoldBackgroundColor: const Color(0xff1b1b1b),
      );
}
