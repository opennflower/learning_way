import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';

class FilpCardDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FilpCardDemoPageView();
  }
}

class FilpCardDemoPageView extends State<FilpCardDemoPage> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CNText('FilpCardDemoPage', size: 18, color: Colors.white)),
      body: elementwidget(),
    );
  }

  Widget elementwidget() {
    return FlipCard(
      direction: FlipDirection.VERTICAL,
      front: Container(
        height: 200,
        width: 345,
        margin: EdgeInsets.all(10),
        color: Colors.teal,
        child: Center(
          child:
              Text("正面", style: TextStyle(fontSize: 40, color: Colors.white)),
        ),
      ),
      back: Container(
        height: 200,
        width: 345,
        margin: EdgeInsets.all(10),
        color: Colors.pink,
        padding: EdgeInsets.all(10),
        child: Center(child: Text('反面', style: TextStyle(color: Colors.white, height: 2.0))),
      ),
    );
  }
}
