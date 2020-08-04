import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:learning_way/component/stickTabBarDelegate.dart';
import 'package:learning_way/component/text_style.dart';

class MineShare extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MineShareStateful(),
    );
  }
  
}
class MineShareStateful extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MineShareView();
  }

}

class MineShareView extends State<MineShareStateful> with SingleTickerProviderStateMixin{
  TabController tabController;
  List<String> _imglis = [
    'assets/images/index_08.jpg',
    'assets/images/index_09.jpg',
    'assets/images/index_10.jpg',
    'assets/images/index_11.jpg',
  ];

  List<String> _pageData = List<String>();

  @override
  void initState() { 
    super.initState();
    this.tabController = TabController(length: 2, vsync: this);
     _getListData().then((data)=>setState((){
        _pageData = data;
    }));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          elevation: 0,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: CNText('我的分享',size: 18,color: Colors.white),
            background: Swiper(
                autoplay:true,
                itemCount: _imglis.length,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(_imglis[index], fit: BoxFit.cover);
                },
              ),
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          delegate: StickyTabBarDelegate(
            child: TabBar(
              labelColor: Colors.black87,
              controller: this.tabController,
              tabs: <Widget>[
                Tab(text: '知识点'),
                Tab(text: '留言'),
              ],
            )
          ),
        ),
         SliverFillRemaining(
            child: TabBarView(
              controller: this.tabController,
              children: <Widget>[
               knowlegenWidget(),
                Center(child: Text('留言内容')),
              ],
            ),
          ),
      ],
    );
  }
  
  //知识点列表
  Widget knowlegenWidget(){
     return FutureBuilder(
      future: _getListData(),
      builder: (context,snapshot){
        if(snapshot.hasError){
          // FutureBuilder 已经给我们提供好了 error 状态
           return _getInfoMessage(snapshot.error);
        }
        if(!snapshot.hasData){
          // FutureBuilder 已经给我们提供好了空数据状态
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
               backgroundColor: Colors.blue[100],
            ),
          );
        }
         var listData = snapshot.data;
         if (listData.length == 0) {
            return _getInfoMessage('No data found');
          }
          return ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context,index){
              return Column(
                children: <Widget>[
                  ListTile(title: Text(listData[index]),),
                  Divider(),
                ],
              );
            },
            
          );
      },
    );
  }

  Widget _getInfoMessage(String msg) {
    return Center(
      child: Text(msg),
    );
  }

  //模拟获取数据
  Future<List<String>> _getListData() async {
    await Future.delayed(Duration(seconds: 2)); // 1秒之后返回数据
    return List<String>.generate(10, (index) => '$index line');
  }

}