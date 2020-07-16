import 'package:flutter/material.dart';
import 'package:learning_way/constant/constant.dart';

class SignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.05), BlendMode.dstATop),
          image: AssetImage(Constant.ASSETS_IMG + 'background_2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            signIconWidget(),
            accountTitleWidget(),
            signAccountInputWidget(context),
            jiangeWidget(),
            passwordTitleWidget(),
            signPasswordInputWidget(context),
            jiangeWidget(),
            confirmTitlePasswordWidget(),
            confirmPasswordWidget(context),
            jiangeWidget(),
            isExitAccountWidget(),
            signButtonWidget(context),
          ],
        ),
      ),
    );
  }

  // sign icon
  Widget signIconWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100,vertical: 40),
      child: Center(
        child: Icon(
          Icons.headset_mic,
          color: Colors.redAccent,
          size: 50.0,
        ),
      ),
    );
  }

  //sign account title
  Widget accountTitleWidget() {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: new Text(
              "EMAIL",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //sign account input
  Widget signAccountInputWidget(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.redAccent, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '请填写注册账号',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //间隔
  Widget jiangeWidget() {
    return Divider(
      height: 24.0,
    );
  }

  //password title
  Widget passwordTitleWidget() {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: new Text(
              "PASSWORD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //password input
  Widget signPasswordInputWidget(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.redAccent, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '*********',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //confirm password
  Widget confirmTitlePasswordWidget() {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: new Text(
              "CONFIRM PASSWORD",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  //confirm password
  Widget confirmPasswordWidget(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 40.0, right: 40.0, top: 10.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: Colors.redAccent, width: 0.5, style: BorderStyle.solid),
        ),
      ),
      padding: const EdgeInsets.only(left: 0.0, right: 10.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Expanded(
            child: TextField(
              obscureText: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '*********',
                hintStyle: TextStyle(color: Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //是否已存在账号
  Widget isExitAccountWidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: new FlatButton(
            child: new Text(
              "Already have an account?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
                fontSize: 15.0,
              ),
              textAlign: TextAlign.end,
            ),
            onPressed: () => {},
          ),
        ),
      ],
    );
  }

  //sigin button
  Widget signButtonWidget(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(left: 30.0, right: 30.0, top: 50.0),
      alignment: Alignment.center,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              color: Colors.redAccent,
              onPressed: () => {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Sign Up",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
