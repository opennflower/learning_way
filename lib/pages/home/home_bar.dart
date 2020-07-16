import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:learning_way/pages/home/home.dart';
import 'package:learning_way/pages/service/user-service.dart';
import 'package:learning_way/pages/user_center/mine.dart';

List<Widget> bodys = [Home(),UserCenter()];

class HomeBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeBarState();
  }
}

class HomeBarState extends State<HomeBar> {
  int curTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: curTabIndex,
        children: bodys,
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.white70,
            primaryColor: Color.fromARGB(255, 74, 63, 249),
            textTheme: Theme.of(context).textTheme.copyWith(
                  caption: TextStyle(
                    color: Color(0xff1D2080),
                  ),
                )),
        child: tabBar,
      ),
    );
  }

  BottomNavigationBar get tabBar{
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      items: [
        tabBarItem('assets/images/home.png','assets/images/home_active.png','Home'),
        tabBarItem('assets/images/my.png','assets/images/my_active.png','Me'),
      ],
      currentIndex: curTabIndex,
      onTap: (int index){
        UserService.checkLoginStatus(context);
        curTabIndex = index;
        this.setState((){});
      },
    );
  }

  BottomNavigationBarItem tabBarItem(String url,String activeUrl,String name){
    return BottomNavigationBarItem(
      icon: Image.asset(url, width: 28,),
      activeIcon: Image.asset(activeUrl, width: 28,),
      title: CNText(name,color: Color(0xff1D2080), size: 12,),
    );
  }


}
