import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_color.dart';
 
class AppTheme {
  ThemeData lightTheme = ThemeData(
    primarySwatch: colorCustom,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      centerTitle: true, systemOverlayStyle: SystemUiOverlayStyle.light,
    ),
  );
}
