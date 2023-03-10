import 'package:flutter/material.dart';
import 'package:moneymentor/screens/settingscreen/widgets/theme_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../main.dart';

class DarkThemeProvider with ChangeNotifier {
  DarkThemePreferences darkThemePreferences = DarkThemePreferences();
  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreferences.setDarkTheme(value);
    notifyListeners();
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.grey.shade900,
      primaryColor: Colors.black,
      secondaryHeaderColor: Colors.white,
      canvasColor: const Color.fromARGB(167, 0, 0, 0),
      focusColor: const Color.fromARGB(255, 196, 195, 195),
      cardColor: const Color.fromARGB(233, 55, 55, 55),
      colorScheme: const ColorScheme.dark());
  static final lightTheme = ThemeData(
      primaryColor: const Color.fromARGB(255, 213, 212, 212),
      scaffoldBackgroundColor: Colors.white,
      cardColor: const Color.fromARGB(255, 227, 225, 225),
      canvasColor: const Color.fromARGB(255, 205, 203, 203),
      secondaryHeaderColor: Colors.black,
      focusColor: const Color.fromARGB(255, 99, 99, 99),
      colorScheme: const ColorScheme.light());
}

Future<bool?> getThemekey() async {
  final sharedprfns = await SharedPreferences.getInstance();
  final themeState = sharedprfns.getBool(themeKey);
  return themeState;
}
