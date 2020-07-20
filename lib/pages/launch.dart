import 'package:flutter/material.dart';
import 'package:learning_way/pages/service/user-service.dart';

class Launch extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LaunchStateful(),
    );
  }
}

class LaunchStateful extends StatefulWidget{
  @override
    State<StatefulWidget> createState() {
        return LaunchState();
    }
}

class LaunchState extends State<LaunchStateful>{
  @override
  void initState() { 
    super.initState();
    UserService.autoLogin();//热重启后,自动缓存登录
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text("start"),
        onPressed: (){
          //切换到首页
           Navigator.pushNamedAndRemoveUntil(context, 'home', (router) => router == null);
        },
      ),
    );
  }
  
}