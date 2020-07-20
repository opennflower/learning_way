import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:learning_way/constant/constant.dart';
import 'package:learning_way/model/user.dart';
import 'package:learning_way/pages/service/user-service.dart';
import 'package:rxdart/rxdart.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _accountController =
      TextEditingController(text: '15077541767');
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _pwdFocus = FocusNode();
  final TextEditingController _pwdController = TextEditingController();
  final TextStyle _blackStyle = const TextStyle(
    fontSize: 14,
    textBaseline: TextBaseline.alphabetic,
    color: Color(0xFF333333),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _pwdFocus.unfocus();
          _phoneFocus.unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3399ff), Color(0xFF66ffff)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 50),
                _closeWidget(),
                _logoWidget(),
                _inputTextForm(),
                _tipText(),
                SizedBox(height: 40),
                _registerButton(),
                SizedBox(height: 10),
                _loginButton(),
                SizedBox(height: 40),
                _diverline(),
                _otherLoginWay(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //关闭页面返回上一页
  Widget _closeWidget() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Icon(Icons.arrow_back, color: Colors.white, size: 30),
      ),
      onTap: () => Navigator.pop(context),
    );
  }

  //logo
  Widget _logoWidget() {
    return Center(
      child: Container(
        height: 100,
        child: Center(
          child: Image.asset(Constant.ASSETS_IMG + 'login_logo.png',
              width: 60, height: 60, fit: BoxFit.cover),
        ),
      ),
    );
  }

  //输入
  Widget _inputTextForm() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Column(
        children: <Widget>[
          _inputAccount(),
          SizedBox(height: 15),
          _inputPassword(),
        ],
      ),
    );
  }

  Widget _inputAccount() {
    return TextField(
      style: _blackStyle,
      focusNode: _phoneFocus,
      controller: _accountController,
      maxLength: 11,
      autofocus: false,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(_pwdFocus);
      },
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[0-9]"))],
      decoration: const InputDecoration(
        icon: Icon(Icons.phone_android, color: Colors.white, size: 22),
        counterText: '',
        hintText: '请输入账号',
      ),
    );
  }

  Widget _inputPassword() {
    return TextField(
      style: _blackStyle,
      controller: _pwdController,
      obscureText: true,
      maxLength: 20,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      focusNode: _pwdFocus,
      inputFormatters: [
        BlacklistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))
      ],
      decoration: const InputDecoration(
        icon: Icon(Icons.lock, color: Colors.white, size: 22),
        counterText: '',
        hintText: '请输入密码',
      ),
    );
  }

  Widget _tipText() {
    return Container(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: <Widget>[
            Text.rich(
              TextSpan(
                text: "请阅读",
                children: [
                  TextSpan(
                    text: '《用户隐私协议》',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => _showInfoDialog('这是用户隐私协议'),
                  ),
                ],
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
            Spacer(),
            Text(
              '忘记密码？',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _registerButton() {
    return Container(
      height: 40,
      width: 315,
      child: RaisedButton(
        color: Colors.lightBlue,
        child: CNText("立即注册", size: 18, color: Colors.white),
        onPressed: () => Navigator.pushNamed(context, 'register'),
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      height: 40,
      width: 315,
      child: RaisedButton(
        color: Colors.green,
        child: CNText("立即登录", size: 18, color: Colors.white),
        onPressed: () {
          var phone = _accountController.text;
          var pwd = _pwdController.text;
          if (phone.isEmpty) {
            EasyLoading.showToast("请填写用户账号");
            return;
          }
          if (phone.length < 11) {
            EasyLoading.showToast("请填写正确的用户账号");
            return;
          }
          if (pwd.isEmpty) {
            EasyLoading.showToast("请输入密码");
            return;
          }
          if (pwd.length < 6) {
            EasyLoading.showToast("密码至少6位数");
            return;
          }
          EasyLoading.show(status: 'loading');
          Observable<User> observable;
           observable = UserService.loginUser(phone, pwd);
           observable.listen((User user){
             EasyLoading.showToast("登录成功");
              Navigator.pushNamedAndRemoveUntil(context, 'home', (router) => router == null);
           });
        },
      ),
    );
  }

  Widget _diverline() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Text(
        '------------------  第三方登录  ------------------',
        style: _blackStyle,
      ),
    );
  }

  Widget _otherLoginWay() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            Constant.ASSETS_IMG + 'qq_login.png',
            width: 45,
            height: 45,
          ),
          SizedBox(width: 60),
          Image.asset(
            Constant.ASSETS_IMG + 'wx_login.png',
            width: 45,
            height: 45,
          ),
        ],
      ),
    );
  }

  _showInfoDialog(String title) {}
}
