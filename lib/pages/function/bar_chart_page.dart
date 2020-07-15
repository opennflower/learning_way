import 'package:flutter/material.dart';
import 'package:learning_way/component/bar_chart.dart';
import 'package:learning_way/component/text_style.dart';

class BarChartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: CNText("BarChartPage", size: 18, color: Colors.white)),
      body: BarChartPageStateful(),
    );
  }
}

class BarChartPageStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BarChartPageView();
  }
}

class BarChartPageView extends State<BarChartPageStateful> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: BarChart(
        data: [180.0, 98.0, 126.0, 64.0, 118.0],
        xAxis: ['一月', '二月', '三月', '四月', '五月'],
      ),
    );
  }
}
