import 'package:flutter/material.dart';
import 'package:learning_way/component/alert.dart';

class UserService{
  ///检测登录状态  如果未登录  弹出提示框  调往登录界面 否则不做处理
  static bool checkLoginStatus(BuildContext context){
    Tip.alert(context, "请先登录",onPressed: ()=>Navigator.pushNamed(context, 'login'));
    return false;
  }
}