import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _current = ThemeMode.light;

  ThemeMode get current => _current;

  void setThemeMode(ThemeMode newMode) {
    _current = newMode;
    notifyListeners();
  }
}
