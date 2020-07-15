import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:learning_way/constant/constant.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DrawDemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: CNText("DrawDemoPage", size: 18, color: Colors.white)),
      body: DrawDemoPageState(),
    );
  }
}

class DrawDemoPageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DrawDemoPageView();
  }
}

class DrawDemoPageView extends State<DrawDemoPageState> {
  PanelController panel = new PanelController();
  double offsetDistance = 0.0;
  double offsetY = 0;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      controller: panel,
      minHeight: 0,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(24.0),
        topRight: Radius.circular(24.0),
      ),
      body: GestureDetector(
          child: ConstrainedBox(
            constraints: BoxConstraints.expand(),
            child: Image.asset('assets/images/splash.jpg',
                fit: BoxFit.fill),
          ),
          onTap: () {
            panel.close();
          },
          onVerticalDragDown: (details) {
            offsetDistance = details.globalPosition.dy;
          },
          onVerticalDragUpdate: (details) {
            offsetY = details.globalPosition.dy - offsetDistance;
            if (offsetY > 0) {
              // print("向下" + offsetY.toString());
            } else {
              double position = offsetY.abs() / 300;
              position = position > 1 ? 1 : position;
              panel.setPanelPosition(position);
              if(position>0.4){
                 panel.open();
              }
            }
          }),
      panel: Center(
        child: CNText("抽屉区域"),
      ),
    );
  }
}
