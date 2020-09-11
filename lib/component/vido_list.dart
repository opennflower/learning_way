import 'package:flutter/material.dart';
import 'package:inview_notifier_list/inview_notifier_list.dart';
import 'package:learning_way/component/text_style.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'video_widget.dart';

class VideoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return VideoListView();
  }
}

class VideoListView extends State<VideoList> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: InViewNotifierList(
            scrollDirection: Axis.vertical,
            initialInViewIds: ['0'],
            isInViewPortCondition: (double deltaTop, double deltaBottom,
                double viewPortDimension) {
              return deltaTop < (0.5 * viewPortDimension) &&
                  deltaBottom > (0.5 * viewPortDimension);
            },
            itemCount: 10,
            builder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Container(
                    height: 44,
                    width: double.infinity,
                    child: CNText("头像信息-----"),
                    color: Color(0xff191154),
                  ),
                  Container(
                    width: double.infinity,
                    height: 224.0,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 10),
                    child: LayoutBuilder(
                      builder:
                          (BuildContext context, BoxConstraints constraints) {
                        return InViewNotifierWidget(
                          id: '$index',
                          builder: (BuildContext context, bool isInView,
                              Widget child) {
                            return VideoWidget(
                                play: isInView,
                                url:
                                    'https://vd4.bdstatic.com/mda-icipfkab855n3w0b/mda-icipfkab855n3w0b.mp4?playlist=%5B%22hd%22%2C%22sc%22%5D&auth_key=1597818179-0-0-9eeab1817b3be545c994d9e4cea8ee79&bcevod_channel=searchbox_feed&pd=1&pt=3');
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  _onRefresh() {
    _refreshController.refreshCompleted();
  }

  _onLoading() {
    _refreshController.loadComplete();
  }
}

// return Stack(
//       fit: StackFit.expand,
//       children: <Widget>[
//         InViewNotifierList(
//           scrollDirection: Axis.vertical,
//           initialInViewIds: ['0'],
//           isInViewPortCondition:
//               (double deltaTop, double deltaBottom, double viewPortDimension) {
//             return deltaTop < (0.5 * viewPortDimension) &&
//                 deltaBottom > (0.5 * viewPortDimension);
//           },
//           itemCount: 10,
//           builder: (BuildContext context, int index) {
//             return Column(
//               children: <Widget>[
//                 Container(
//                   height: 44,
//                   width: double.infinity,
//                   child: CNText("头像信息-----"),
//                   color: Color(0xff191154),
//                 ),
//                 Container(
//                   width: double.infinity,
//                   height: 224.0,
//                   alignment: Alignment.center,
//                   margin: EdgeInsets.only(bottom: 10),
//                   child: LayoutBuilder(
//                     builder: (BuildContext context, BoxConstraints constraints) {
//                       return InViewNotifierWidget(
//                         id: '$index',
//                         builder:
//                             (BuildContext context, bool isInView, Widget child) {
//                           return VideoWidget(
//                               play: isInView,
//                               url:
//                                   'https://vd4.bdstatic.com/mda-icipfkab855n3w0b/mda-icipfkab855n3w0b.mp4?playlist=%5B%22hd%22%2C%22sc%22%5D&auth_key=1597818179-0-0-9eeab1817b3be545c994d9e4cea8ee79&bcevod_channel=searchbox_feed&pd=1&pt=3');
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),

//       ],
//     );
