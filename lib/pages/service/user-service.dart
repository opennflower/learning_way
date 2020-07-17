import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_way/component/alert.dart';
import 'package:learning_way/model/user.dart';
import 'package:learning_way/store/observable.dart';
import 'package:learning_way/store/user.dart';
import 'package:rxdart/rxdart.dart';

final subjectUser = BehaviorSubject<User>();
final subjectLogin = BehaviorSubject<User>();
final subjectLogout = PublishSubject<int>();

//登录成功的逻辑
void handUserLogined(User user) {
  StoreUser.saveUser(user);
  subjectUser.add(user);
  subjectLogin.add(user);
}

class UserService {
  static bool _isStart = false;
  static Timer _timer;
  static BehaviorSubject<User> get rxUser {
    return subjectUser;
  }

  static BehaviorSubject<User> get rxLogin {
    return subjectLogin;
  }

  static PublishSubject<int> get rxLogout {
    return subjectLogout;
  }

  static User get curUser {
    return subjectUser.value;
  }

  static int get curUserId {
    return curUser?.userId;
  }

  static String get curToken {
    return curUser?.sessionToken;
  }

  static bool get isLogined {
    return curUser != null;
  }

  static Observable<User> loginUser(String phone, String pwd) {
    
  }

  static void logout() {
    stop();
    StoreUser.removeUser().catchError(print);

    _isStart = false;
  }

  static Future<User> autoLogin() async {
    var user = await StoreUser.loadUser();
    if (user == null) {
      return Future.error(null);
    }
    subjectUser.add(user);
    var serverUser =
        await UserService.fetchCurUser(user.userId).catchError((e) => null);
    if (user == null) {
      return Future.error(null);
    }
    handUserLogined(serverUser);
    return serverUser;
  }

  static Future<User> fetchCurUser(int userId) async {
    if (userId == null) {
      return Future.error(null);
    }
    var userjson = {
      'userId': 1,
      'nickname': '爱恨情仇',
      'avatar': '',
      'token': 'dsadasdas6d',
      'phone': '15077541767'
    };
    var user = User.fromJson(userjson);
    var localUser = await StoreUser.loadUser();
    await handUpdateUser(user, localUser);
    subjectUser.add(user);
    return user;
  }

  static Future<void> handUpdateUser(User user, User oldUser) async {
    // 添加 保存im信息
    user.sessionToken = oldUser.sessionToken;
    subjectUser.add(user);
    await StoreUser.saveUser(user);
  }

  ///检测登录状态  如果未登录  弹出提示框  调往登录界面 否则不做处理
  static bool checkLoginStatus(BuildContext context) {
    if (UserService.isLogined) {
      return true;
    }
    Tip.alert(context, "请先登录",
        onPressed: () => Navigator.pushNamed(context, 'login'));
    return false;
  }

  static void stop() {
    _stopTimer();
    UserService.rxUser.add(null);
    StoreUser.removeUser();
  }

  // static _startTimer() {
  //   if (_timer?.isActive ?? false) {
  //     return;
  //   }
  //   _timer = Timer.periodic(Duration(seconds: 60 * 1), (timer) {
  //     // fetchCurUser(UserService.curUserId).catchError(print);
  //   });
  // }

  static _stopTimer() {
    _timer?.cancel();
    _isStart = false;
  }
}
