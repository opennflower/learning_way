import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';

class FutureBuilderPoint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CNText(
        "FutureBuilder",
        size: 18,
        color: Colors.white,
      )),
      body: FutureBuildStateful(),
    );
  }
}

class FutureBuildStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FutureBuilderView();
  }
}

class FutureBuilderView extends State<FutureBuildStateful> {

  List<String> _pageData = List<String>();

  //模拟获取数据
  Future<List<String>> _getListData() async {
    await Future.delayed(Duration(seconds: 1)); // 1秒之后返回数据
    return List<String>.generate(10, (index) => '$index line');
  }

  @override
  void initState() { 
    super.initState();
    _getListData().then((data)=>setState((){
        _pageData = data;
    }));
  }

  @override
  Widget build(BuildContext context) {
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

}
