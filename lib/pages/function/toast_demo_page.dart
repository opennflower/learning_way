import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:learning_way/component/PhotoViewGalleryScreen.dart';
import 'package:learning_way/component/PhotoViewSimpleScreen.dart';
import 'package:learning_way/component/text_style.dart';

class ToastDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ToastDemoPageView();
  }
}

class ToastDemoPageView extends State<ToastDemoPage> {
  List<String> _imglis = [
    'assets/images/index_08.jpg',
    'assets/images/index_09.jpg',
    'assets/images/index_10.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CNText(
          'ToastDemoPage',
          size: 18,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            FlatButton(
              child: Text("弹出一个文本框"),
              onPressed: () {
                EasyLoading.showToast("欢迎使用");
              },
            ),
            Container(
              width: 300,
              height: 200,
              alignment: Alignment.center,
              child: CNText(
                "主要Api文档:https://github.com/MMMzq/bot_toast/blob/master/API.md",
                align: TextAlign.center,
                maxLines: 3,
              ),
            ),
            SizedBox(height: 40),
            Divider(),
            CNText("图片预览功能"),
            FlatButton(
              child: Text("单个图片预览"),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return PhotoViewSimpleScreen(
                    imageProvider: AssetImage('assets/images/splash.jpg'),
                    heroTag: 'simple',
                  );
                }));
              },
            ),
            CNText("多个图片预览功能"),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _imglis.map((item) {
                var index = _imglis.indexOf(item);
                return InkWell(
                  child: Container(
                    width: 88,
                    height: 88,
                    child: Image.asset(item),
                  ),
                  onTap: () {
                    EasyLoading.showToast("$index");
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return PhotoViewGalleryScreen(
                        images: _imglis,
                        index: index,
                        heroTag: 'simple',
                      );
                    }));
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
