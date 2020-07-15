import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class HeaderDemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HeaderDemoPageView();
  }
}

class HeaderDemoPageView extends State<HeaderDemoPage> {
  List<String> _imglis = [
    'assets/images/index_08.jpg',
    'assets/images/index_09.jpg',
    'assets/images/index_10.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
    'assets/images/index_11.jpg',
  ];

  List data = [
    {
      "latter": "A",
      "group": ["A分组1", "A分组1", "A分组1", "A分组1", "A分组1", "A分组1"]
    },
    {
      "latter": "B",
      "group": ["B分组1", "B分组1", "B分组1", "B分组1", "B分组1", "B分组1"]
    },
    {
      "latter": "C",
      "group": ["C分组1", "C分组1", "C分组1", "C分组1", "C分组1", "C分组1"]
    },
    {
      "latter": "D",
      "group": ["D分组1", "D分组1", "D分组1", "D分组1", "D分组1", "D分组1"]
    },
    {
      "latter": "E",
      "group": ["E分组1", "E分组1", "E分组1", "E分组1", "E分组1", "E分组1"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: CNText('HeaderDemoPage', size: 18, color: Colors.white)),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return classWidget(context, index);
          return floatwidget(context, index);
          return customWidget(context, index);
          return elemetwidget(context, index);
        },
      ),
    );
  }

  Widget elemetwidget(BuildContext context, int index) {
    return StickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.blueGrey[700],
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: CNText("Header $index", color: Colors.white),
      ),
      content: Container(
        child: Image.asset(
          _imglis[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      ),
    );
  }

  Widget customWidget(BuildContext context, int index) {
    return StickyHeaderBuilder(
      builder: (BuildContext context, double stuckAmount) {
        stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
        return new Container(
          height: 50.0,
          color: Color.lerp(Colors.blue[700], Colors.red[700], stuckAmount),
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: new Row(
            children: <Widget>[
              new Expanded(
                child: new Text(
                  'Header #$index',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              new Offstage(
                offstage: stuckAmount <= 0.0,
                child: new Opacity(
                  opacity: stuckAmount,
                  child: new IconButton(
                    icon: new Icon(Icons.favorite, color: Colors.white),
                    onPressed: () => {
                      Scaffold.of(context).showSnackBar(
                          new SnackBar(content: new Text('Favorite #$index'))),
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
      content: Container(
        child: Image.asset(
          _imglis[index],
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200,
        ),
      ),
    );
  }

  Widget floatwidget(BuildContext context, int index) {
    return new StickyHeaderBuilder(
      overlapHeaders: true,
      builder: (BuildContext context, double stuckAmount) {
        stuckAmount = 1.0 - stuckAmount.clamp(0.0, 1.0);
        return new Container(
          height: 50.0,
          color: Colors.grey[900].withOpacity(0.6 + stuckAmount * 0.4),
          padding: new EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: new Text(
            'Header #$index',
            style: const TextStyle(color: Colors.white),
          ),
        );
      },
      content: new Container(
        child: new Image.asset(_imglis[index],
            fit: BoxFit.cover, width: double.infinity, height: 200.0),
      ),
    );
  }

  Widget classWidget(BuildContext context, int index) {
    return StickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.blueGrey[700],
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.centerLeft,
        child: Text(
          data[index]['latter'],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      content: Column(
        children: buildGroup(data[index]['group']),
      ),
    );
  }

  List<Widget> buildGroup(List group) {
    return group.map((item) {
      return Container(
        height: 60,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 20),
        child: Text(item),
      );
    }).toList();
  }
}
