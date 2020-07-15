import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:passcode_screen/circle.dart';
import 'package:passcode_screen/keyboard.dart';
import 'package:passcode_screen/passcode_screen.dart';

class ClockScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ClockScreenView();
  }
}

class ClockScreenView extends State<ClockScreen> {
  final StreamController<bool> _verificationNotifier =
      StreamController<bool>.broadcast();
  @override
  void initState() { 
    super.initState();
    openLockScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CNText('ClockScreenPage', size: 18, color: Colors.white)),
      body: Center(
        child: CNText("内容", size: 20),
      ),
    );
  }

  openLockScreen() async{
    await Future.delayed(Duration(seconds: 1)); // 1秒之后返回数据
    Navigator.push(
        context,
        PageRouteBuilder(
            opaque: false,
            pageBuilder: (context, animation, secondaryAnimation) {
              return PasscodeScreen(
                title: CNText("请输入锁屏密码", color: Colors.white, size: 20),
                passwordEnteredCallback: _onPasscodeEntered,
                cancelButton: CNText("返回", color: Colors.white, size: 20),
                deleteButton: CNText("删除", color: Colors.white, size: 20),
                shouldTriggerVerification: _verificationNotifier.stream,
                circleUIConfig: CircleUIConfig(
                  borderColor: Colors.grey,
                  fillColor: Colors.blue,
                  circleSize: 30,
                ),
                keyboardUIConfig: KeyboardUIConfig(
                  digitBorderWidth: 2,
                  primaryColor: Colors.red,
                ),
                backgroundColor: Colors.black.withOpacity(0.8), //背景透明度
                cancelCallback: _onPasscodeCancelled,
              );
            }));
  }

  _onPasscodeEntered(String enteredPasscode) {
    bool isValid = '666666' == enteredPasscode;
    _verificationNotifier.add(isValid);
  }

  _onPasscodeCancelled() {
    Navigator.pop(context);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _verificationNotifier.close();
    super.dispose();
  }
}
