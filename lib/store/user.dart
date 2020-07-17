import 'dart:convert';

import 'package:learning_way/model/user.dart';
import 'package:learning_way/store/store.dart';

class StoreUser {
  static Future<User> loadUser() async {
    var userStr = await Store.loadStr("user_info");
    if (userStr == '' || userStr == null) {
      return null;
    }
    return User.fromJson(jsonDecode(userStr));
  }

  static Future<void> saveUser(User user) async {
    if (user == null) {
      removeUser();
      return;
    } else {
      var userStr = jsonEncode(user);
      await Store.saveStr("user_info", userStr);
    }
  }

  static Future<void> removeUser() async {
    await Store.remove("user_info");
  }
}
