import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  // Named
  static final String _themeSP = "themeSP";
  static final String _authLogged = "authLogged";
  static final String _authData = "authData";

  static Future<bool> getTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeSP) ?? true;
  }

  static Future<bool> setTheme(bool newValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_themeSP, newValue);
  }

  static Future<bool> getAuthLogged() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_authLogged) ?? false;
  }

  static Future<bool> setAuthLogged(bool newValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_authLogged, newValue);
  }

  static Future<String> getAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_authData) ?? '';
  }

  static Future<bool> setAuthData(String newValue) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_authData, newValue);
  }
}
