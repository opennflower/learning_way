import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CNText(
          "知识点",
          size: 18,
          color: Colors.white,
        ),
      ),
      body: HomeStateful(),
    );
  }
}

class HomeStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeStateful> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        lineElement(
          'FutureBuilder',
          onPressed: () => Navigator.pushNamed(context, 'fun/futureBuilder'),
        ),
        lineElement(
          '购物车抛物线',
          onPressed: () =>
              Navigator.pushNamed(context, 'fun/goodsCarAnimation'),
        ),
        lineElement(
          '条形统计图',
          onPressed: () => Navigator.pushNamed(context, 'fun/barChart'),
        ),
        lineElement(
          '底部弹框',
          onPressed: () => Navigator.pushNamed(context, 'fun/drawDemo'),
        ),
        lineElement(
          'toast提示和图片预览',
          onPressed: () => Navigator.pushNamed(context, 'fun/toastDemo'),
        ),
        lineElement(
          '轮播图',
          onPressed: () => Navigator.pushNamed(context, 'fun/swiper'),
        ),
        lineElement(
          '吸顶组件',
          onPressed: () => Navigator.pushNamed(context, 'fun/Header'),
        ),
        lineElement(
          '卡片翻转',
          onPressed: () => Navigator.pushNamed(context, 'fun/flipCard'),
        ),
        lineElement(
          '锁屏',
          onPressed: () => Navigator.pushNamed(context, 'fun/clockscreen'),
        ),
         lineElement(
          'Sliver',
          onPressed: () => Navigator.pushNamed(context, 'fun/sliver'),
        ),
        lineElement(
          '滚动播放',
          onPressed: () => Navigator.pushNamed(context, 'fun/videos'),
        ),
        lineElement(
          'youTube视频播放器',
          onPressed: () => Navigator.pushNamed(context, 'fun/youTube'),
        ),
      ],
    );
  }

  Widget lineElement(String name, {Function onPressed}) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 20, 20, 20),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Colors.grey[200]))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CNText(name),
              Icon(
                Icons.chevron_right,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
