import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:movies_app/common/constants/theme_prefs_constants.dart';

abstract class ThemeLocalDataSource {
  Future<void> savePreferredThemeMode(ThemeMode themeMode);
  ThemeMode getPrefferedThemeMode();
}

class ThemeLocalDataSourceImp extends ThemeLocalDataSource {
  final SharedPreferences sharedPreferences;
  ThemeLocalDataSourceImp({required this.sharedPreferences});
  @override
  ThemeMode getPrefferedThemeMode() {
    String? themeStringValue =
        sharedPreferences.getString(ThemePrefsConstants.prefsThemeKey);

    final themeMode = themeStringValue == ThemePrefsConstants.darkTheme
        ? ThemeMode.dark
        : ThemeMode.light;

    return themeMode;
  }

  @override
  Future<void> savePreferredThemeMode(ThemeMode themeMode) async {
    final String themeStringVlue = themeMode == ThemeMode.light
        ? ThemePrefsConstants.lightTheme
        : ThemePrefsConstants.darkTheme;
    await sharedPreferences.setString(
        ThemePrefsConstants.prefsThemeKey, themeStringVlue);
  }
}
