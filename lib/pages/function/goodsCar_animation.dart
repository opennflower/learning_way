import 'package:flutter/material.dart';
import 'package:learning_way/component/red_dot_page.dart';
import 'package:learning_way/component/text_style.dart';

class GoodsCarAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CNText("GoodsCarAnimation", size: 18, color: Colors.white)),
      body: GoodsAnimationStateful(),
    );
  }
}

class GoodsAnimationStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoodsAnimationStatefulView();
  }
}

class GoodsAnimationStatefulView extends State<GoodsAnimationStateful> {
  GlobalKey _key = GlobalKey();
  Offset _endOffset;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((c) {
      // 获取「购物车」的位置
      _endOffset = (_key.currentContext.findRenderObject() as RenderBox)
          .localToGlobal(Offset.zero);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        '我是商品名称$index',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return IconButton(
                          icon: Icon(Icons.add_circle_outline),
                          onPressed: () {
                            // 点击的时候获取当前 widget 的位置，传入 overlayEntry
                            var _overlayEntry = OverlayEntry(builder: (_) {
                              RenderBox box = context.findRenderObject();
                              var offset = box.localToGlobal(Offset.zero);
                              return RedDotPage(
                                startPosition: offset,
                                endPosition: _endOffset,
                              );
                            });
                            // 显示Overlay
                            Overlay.of(context).insert(_overlayEntry);
                            // 等待动画结束
                            Future.delayed(Duration(milliseconds: 800), () {
                              _overlayEntry.remove();
                              _overlayEntry = null;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              );
            },
            itemCount: 10,
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey.withOpacity(0.5),
        ),
        Container(
          height: 60,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.shop_two,
                  key: _key,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
