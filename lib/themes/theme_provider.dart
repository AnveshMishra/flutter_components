import 'package:flutter/material.dart';

import 'app_colors.dart';

class ThemeProvider extends ChangeNotifier {
  AppTheme currentAppTheme = AppTheme.adani;
  Brightness currentBrightness = Brightness.light;

  void changeTheme(AppTheme theme) {
    currentAppTheme = theme;
    notifyListeners();
  }

  void toggleBrightness() {
    if (currentBrightness == Brightness.light) {
      currentBrightness = Brightness.dark;
    } else {
      currentBrightness = Brightness.light;
    }
    notifyListeners();
  }

  ThemeData getThemeData() {
    return getAppThemeData(
      theme: currentAppTheme,
      brightness: currentBrightness,
    );
  }
}

enum AppTheme {
  adani,
  acc,
  ambuja,
}
