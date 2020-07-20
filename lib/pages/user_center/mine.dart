import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:learning_way/constant/constant.dart';
import 'package:learning_way/model/user.dart';
import 'package:learning_way/pages/service/user-service.dart';

class UserCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: CNText("个人中心",color: Colors.white,size: 18),
      // ),
      body: UserCenterStateful(),
    );
  }
}

class UserCenterStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return UserCenterState();
  }
}

class UserCenterState extends State<UserCenterStateful> {
  User _user;
  @override
  void initState() {
    super.initState();
    _user = UserService.curUser;
    print(_user);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            userInfoView(),
            basicDataWidget(),
          ],
        ),
      ),
    );
  }

  Widget userInfoView() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 240,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF3399ff), Color(0xFF66ffff)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // topButtonWidget(),
          // userWidget(),
          // activeCountWidget(),
        ],
      ),
    );
  }

  Widget topButtonWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          iconImage('scanning.png', 28),
          SizedBox(width: 10),
          iconImage('setting.png', 28),
        ],
      ),
    );
  }

  Widget userWidget() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            backgroundImage:
                AssetImage(Constant.ASSETS_IMG + 'background_2.jpg'),
            radius: 40,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CNText(_user.nickname, color: Colors.white, size: 15),
                SizedBox(height: 8),
                CNText('ID:${_user.userId}', color: Colors.white, size: 15)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget activeCountWidget() {
    return Container(
      padding: EdgeInsets.all(20),
      child: CNText("我的活跃度：1090", color: Colors.white, size: 15),
    );
  }

  Widget basicDataWidget() {
    return Positioned(
      top: 180,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          width: MediaQuery.of(context).size.width - 40,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.8),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(1.0, 1.0),
              ),
            ],
          ),
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
             dataItem('+10','活跃度'),
             dataItem('+10','发表量'),
             dataItem('+10','贡献值'),
             dataItem('+10','浏览量'),
             dataItem('+10','收藏数'),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconImage(String url, double size) {
    return Image.asset(Constant.ASSETS_IMG + url,
        width: size, height: size, fit: BoxFit.cover);
  }

  Widget dataItem(String value,String title) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CNText(value, size: 15, color: Colors.black87),
            SizedBox(height: 10),
            CNText(title, size: 13, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
