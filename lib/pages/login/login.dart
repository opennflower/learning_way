import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:learning_way/constant/constant.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: CNText("登录", color: Colors.white, size: 18)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF3399ff),Color(0xFF66ffff),Color(0xFF3399ff)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: <Widget>[
            _introductText()
          ],
        ),
      ),
    );
  }

  //文字介绍
  Widget _introductText(){
    return Center(
      child: CNText("欢迎登录Learning Way",align: TextAlign.center,size: 20),
    );
  }

}
