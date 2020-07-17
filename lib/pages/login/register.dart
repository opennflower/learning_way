import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_way/component/text_style.dart';

class Register extends StatefulWidget {
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {
  final TextEditingController _accountController =
      TextEditingController(text: '');
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _pwdFocus = FocusNode();
  final FocusNode _tpwdFocus = FocusNode();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _tpwdController = TextEditingController();
  final TextStyle _blackStyle = const TextStyle(
    fontSize: 14,
    textBaseline: TextBaseline.alphabetic,
    color: Color(0xFF333333),
  );

  bool isAccountExit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
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
              SizedBox(height: 50),
              inputElement('账户', _inputAccount(),checkAccountWidget()),
              SizedBox(height: 15),
              inputElement('密码', _inputPassword(),Container()),
              SizedBox(height: 15),
              inputElement('确认密码', _inputTruePassword(),Container()),
              SizedBox(height: 30),
              _registerButton(),
            ],
          ),
        ),
      ),
    ));
  }

  //关闭页面返回上一页
  Widget _closeWidget() {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Icon(Icons.arrow_back, color: Colors.white, size: 30),
            SizedBox(width: 20),
            CNText("用户注册", size: 18, color: Colors.white)
          ],
        ),
        // child: Icon(Icons.arrow_back,color: Colors.white,size: 30),
      ),
      onTap: () => Navigator.pop(context),
    );
  }

  Widget inputElement(String name, Widget widget, Widget subwidget) {
    return Container(
      padding: EdgeInsets.fromLTRB(40, 15, 0, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CNText("$name", color: Colors.white, size: 15),
          SizedBox(height: 15),
          Row(
            children: <Widget>[
              Container(
                width: 260,
                height: 40,
                child: widget,
              ),
              SizedBox(width: 15),
              subwidget,
            ],
          ),
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

  Widget _inputTruePassword() {
    return TextField(
      style: _blackStyle,
      controller: _tpwdController,
      obscureText: true,
      maxLength: 20,
      keyboardType: TextInputType.visiblePassword,
      textInputAction: TextInputAction.done,
      focusNode: _tpwdFocus,
      inputFormatters: [
        BlacklistingTextInputFormatter(RegExp("[\u4e00-\u9fa5]"))
      ],
      decoration: const InputDecoration(
        icon: Icon(Icons.lock, color: Colors.white, size: 22),
        counterText: '',
        hintText: '请确认密码',
      ),
    );
  }

   Widget _registerButton(){
     return Container(
      height: 40,
      width: 280,
      child: RaisedButton(
        color: Colors.lightBlue,
        child: CNText("立即注册", size: 18, color: Colors.white),
        onPressed:(){

        },
      ),
    );
  }

  Widget checkAccountWidget() {
    if (_accountController.text.length == 11) {
      if (isAccountExit) {
        return Icon(Icons.error, color: Colors.red);
      } else {
        return Icon(Icons.check_circle, color: Colors.green);
      }
    }else{
      return Container();
    }
  }
}
