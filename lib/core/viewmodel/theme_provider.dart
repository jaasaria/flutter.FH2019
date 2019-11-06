import 'package:flutter/foundation.dart';
import 'package:fh2019/core/shared/shared_preferences_helper.dart';

class ThemeProvider with ChangeNotifier {
  static bool isLightTheme = true;

  setTheme(value) {
    isLightTheme = value;
    notifyListeners();
  }

  get getTheme {
    return isLightTheme;
  }

  void switchTheme() {
    isLightTheme = !isLightTheme;
    setTheme(isLightTheme);
    SharedPreferencesHelper.setTheme(isLightTheme);
  }
}
