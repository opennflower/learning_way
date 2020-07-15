import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';

class UserCenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CNText("Mine"),
      ),
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
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CNText("user center page"),
    );
  }
}
