import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:learning_way/component/text_style.dart';

class BannerLunBoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BannerLunBoPageView();
  }
}

class BannerLunBoPageView extends State<BannerLunBoPage> {
  List<String> _imglis = [
    'assets/images/index_08.jpg',
    'assets/images/index_09.jpg',
    'assets/images/index_10.jpg',
    'assets/images/index_11.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CNText('BannerLunBoPage', size: 18, color: Colors.white)),
      body: ListView(
        children: <Widget>[
          itemWidget(
            '轮播图一',
            Container(
              height: 250,
              child: new Swiper(
                autoplay:true,
                itemCount: _imglis.length,
                pagination: SwiperPagination(), //如果不填则不显示指示点
                control: new SwiperControl(), //如果不填则不显示左右按钮
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(_imglis[index], fit: BoxFit.cover);
                },
              ),
            ),
          ),
          itemWidget(
            '轮播图二',
            Container(
              height: 250,
              child: new Swiper(
                autoplay:true,
                itemCount: _imglis.length,
                viewportFraction: 0.7,
                scale: 0.9,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(_imglis[index], fit: BoxFit.cover);
                },
              ),
            ),
          ),
          itemWidget(
            '轮播图三',
            Container(
               height: 300,
              child: new Swiper(
                itemCount: _imglis.length,
                itemWidth: 300.0,
                layout: SwiperLayout.STACK,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(_imglis[index], fit: BoxFit.cover);
                },
              ),
            ),
          ),
           itemWidget(
            '轮播图四',
            Container(
              height: 300,
              child: new Swiper(
                itemCount: _imglis.length,
                itemWidth: 300.0,
                itemHeight: 300.0,
                layout: SwiperLayout.TINDER,
                itemBuilder: (BuildContext context, int index) {
                  return new Image.asset(_imglis[index], fit: BoxFit.cover);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget itemWidget(String name, Widget child) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 15),
        CNText("$name:"),
        SizedBox(height: 15),
        child,
      ],
    );
  }
}
