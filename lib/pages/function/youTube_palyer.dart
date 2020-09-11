import 'package:flutter/material.dart';
import 'package:learning_way/component/text_style.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTuBePlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CNText(
          "YouTube视频播放器",
          size: 19,
          color: Colors.white,
        ),
      ),
      body: YouTuBePlayerState(),
    );
  }
}

class YouTuBePlayerState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return YouTuBePlayerView();
  }
}

class YouTuBePlayerView extends State<YouTuBePlayerState> {
  // YoutubePlayerController _controller;

  // PlayerState _playerState;
  // YoutubeMetaData _videoMetaData;
  // double _volume = 100;
  // bool _muted = false;
  // bool _isPlayerReady = false;

  @override
  void initState() {
    super.initState();
    // _controller = YoutubePlayerController(
    //     initialVideoId: 'GrYbMbudILQ',
    //     flags: YoutubePlayerFlags(
    //       mute: false,
    //       autoPlay: true,
    //       disableDragSeek: false,
    //       loop: false,
    //       isLive: false,
    //       forceHD: false,
    //       enableCaption: true,
    //     ))
    //   ..addListener(listener);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return Container(
    //   child: Column(
    //     children: <Widget>[
    //       Container(
    //         width: MediaQuery.of(context).size.width,
    //         height: 240,
    //         child: YoutubePlayer(
    //           controller: _controller,
    //           showVideoProgressIndicator: true,
    //           progressIndicatorColor: Colors.blueAccent,
    //           topActions: <Widget>[
    //             const SizedBox(width: 8.0),
    //             Expanded(
    //               child: Text(
    //                 _controller.metadata.title,
    //                 style: const TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 18.0,
    //                 ),
    //                 overflow: TextOverflow.ellipsis,
    //                 maxLines: 1,
    //               ),
    //             ),
    //             IconButton(
    //               icon: const Icon(
    //                 Icons.settings,
    //                 color: Colors.white,
    //                 size: 25.0,
    //               ),
    //               onPressed: () {
    //                 print('Settings Tapped!');
    //               },
    //             ),
    //           ],
    //           onReady: () {
    //             _isPlayerReady = true;
    //           },
    //           onEnded: (data) {
               
    //           },
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }

  // void listener() {
  //   if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
  //     setState(() {
  //       _playerState = _controller.value.playerState;
  //       _videoMetaData = _controller.metadata;
  //     });
  //   }
  // }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    // _controller.pause();
    // super.deactivate();
  }

  @override
  void dispose() {
    // _controller.dispose();
    // super.dispose();
  }
}
