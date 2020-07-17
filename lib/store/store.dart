import 'package:shared_preferences/shared_preferences.dart';

class Store {
  static saveStr(String key, String value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key, value);
  }

  static Future<String> loadStr(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString(key);
  }

  static saveBool(String key, bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool(key, value);
  }

  static Future<bool> loadBool(String key) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool(key);
  }

  static remove(String key) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }
}
