// // // import 'dart:html';

// // import 'dart:developer';

// // import 'package:app/entity/advertisement.dart';
// // import 'package:app/entity/chargevideo.dart';
// // import 'package:app/entity/user.dart';
// // import 'package:app/kqlib/KqToast.dart';
// // import 'package:app/kqlib/component/alert.dart';
// // import 'package:app/kqlib/component/image_app_bar.dart';
// // import 'package:app/kqlib/component/image_asset.dart';
// // import 'package:app/kqlib/component/kq-buttons.dart';
// // import 'package:app/kqlib/component/kq_text.dart';
// // import 'package:app/kqlib/component/kq_video.dart';
// // import 'package:app/kqlib/kq-observable.dart';
// // import 'package:app/kqlib/native/ads.dart';
// // import 'package:app/kqlib/notify/notification.dart';
// // import 'package:app/kqlib/notify/notify_event.dart';
// // import 'package:app/kqlib/router/kq_navigator.dart';
// // import 'package:app/network/http-client.dart';
// // import 'package:app/pages/components/ads_carousel_slider.dart';
// // import 'package:app/pages/home/ads/ad_detail.dart';
// // import 'package:app/pages/home/home_video_page.dart';
// // import 'package:app/service/ad_category_service.dart';
// // import 'package:app/service/sys-cfg-service.dart';
// // import 'package:app/service/throttle.dart';
// // import 'package:app/service/user-service.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_i18n/flutter_i18n.dart';
// // import 'package:pull_to_refresh/pull_to_refresh.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
// //   List tabs = ["For You", "Following", "Trending"];

// // class Home extends StatelessWidget{
// //   TabController _tabController;
// //     @override
// //     Widget build(BuildContext context) {
// //         return Scaffold(
// //             backgroundColor: Color(0xff05021D),
// //             appBar: AppBar(
// //               backgroundColor:Color(0xff09052D),
// //               centerTitle:true,
// //               title: KQText("Vtuebe",size: 19,fontWeight: FontWeight.bold,color: Colors.white),
// //               actions: <Widget>[
// //                 IconButton(icon:Icon(Icons.search,color: Colors.white,size: 23.33,) , onPressed: null)
// //               ],
// //               leading: IconButton(icon:Icon(Icons.dashboard,color: Colors.white,size: 23.33,) , onPressed: null),
// //               bottom: TabBar(
// //                 controller: _tabController,
// //                 tabs: tabs.map((e) => Tab(text: e)).toList(),
// //               ),
// //             ),
// //             // appBar: ImageAppBar(
// //             //     centerTitle: false,
// //             //     title:  InkWell(
// //             //         child: Row(children: <Widget>[
// //             //             SizedBox(width: 5,),
// //             //             CircleAvatar(backgroundImage: NetworkImage(UserService.curUser?.avatarUrl ?? User.defulAvatar), radius: 25,),
// //             //             SizedBox(width: 10,),
// //             //             KQText(UserService.curUser?.nickname ?? 'Login', color: Colors.white, size: 18,),
// //             //         ],),
// //             //         onTap: () {
// //             //             if (!UserService.isLogined) {
// //             //                 Navigator.pushNamed(context, 'login');
// //             //             } else {
// //             //                 if (!UserService.checkIsAuth(context)) {
// //             //                     return;
// //             //                 }
// //             //                 KqNavigator.toUcDetai(context, UserService.curUser);
// //             //             }
// //             //         },
// //             //     ),
// //             //     actions: <Widget>[
// //             //         KQButtons.minBtn(
// //             //             child: Image.asset(ImageAsset.checkIn, width: 26,),
// //             //             onPressed: () {
// //             //                 if (!UserService.isLogined) {
// //             //                     Navigator.pushNamed(context, 'login');
// //             //                 } else if (UserService.checkIsAuth(context)){
// //             //                     Navigator.pushNamed(context, 'checkIn');
// //             //                 }
// //             //             },
// //             //         ),
// //             //         SizedBox(width: 15,)
// //             //     ]
// //             // ).appBar(),
// //             body: HomeStateful(),
// //         );
// //     }
// // }

// // class HomeStateful extends StatefulWidget {
// //     @override
// //     State<StatefulWidget> createState() {
// //         return HomeState();
// //     }
// // }
// // class HomeState extends State<HomeStateful> with SingleTickerProviderStateMixin,WidgetsBindingObserver{
// //   // List<Advertisement> ads = [];
// //   // List<ChargeVideoItem> videos = [];
// //   //  bool isVideoAd = true;
// //   //   int curPage = 1;
// //   //   int page = 1;
// //   //   int size = 10;
// //   //   List<String> tabTextList = ['Video','Premium'];
// //   //   List<Tab> tabWidgetList = [];
// //   //   TabController tabController;
// //   //   int unLockCount = 0;
// //   //   int totalLockCount = 0;
// //   //   RefreshController _refreshController = RefreshController(initialRefresh: false);
// //   //   PageController _controller;

// //   @override
// //   void initState() {
// //     super.initState();
// //     WidgetsBinding.instance.addObserver(this);
// //     // if (!UserService.isLogined) return;
// //     // for(var value in tabTextList){
// //     //   tabWidgetList.add(Tab(text: '$value',));
// //     // }
// //     //  tabController = new TabController(length: tabTextList.length, vsync: this);
// //     // loadAds();
// //     // loadUnlockCount();
// //     // loadChargeVideo();
// //     // KQNotification.on(ENotifyEvents.languageCharge, (data){
// //     //   if(data==0){
// //     //     this.ads = [];
// //     //     this.curPage = 1;
// //     //     loadAds(page: 1,hasLoadding: true);
// //     //     _controller = PageController(initialPage: 0);
// //     //     loadUnlockCount();
// //     //     loadChargeVideo();
// //     //   }
// //     //   this.setState(() { });
// //     // }, this);

// //   }

// //   //  void loadUnlockCount(){
// //   //    Http.toMonthVideoUnlockCount(UserService.curUserId).listen((res){
// //   //      this.unLockCount = res['use'];
// //   //      this.totalLockCount = res['all'];
// //   //      this.setState((){});
// //   //    },onError: (err){

// //   //    });
// //   //  }

// //   //  void loadChargeVideo({int page = 1}){
// //   //    Http.getChargeVideo(UserService.curUserId, page).listen((video){
// //   //      if(page == 1){
// //   //        this.videos = video;
// //   //      }else{
// //   //        this.videos.addAll(video);
// //   //      }
// //   //      this.setState((){});
// //   //    },onError: (e){
// //   //      KQAlert.alert(context, e);
// //   //    });
// //   //  }

// //   //  void loadAds({int page = 1,bool hasLoadding = false}) {
// //   //   List<int> checkeds = AdCategoryService.checkIds;
// //   //   if (hasLoadding) KQAlert.loadding(context);
// //   //   Http.fetchAdsByType(UserService.curUserId,isVideoAd, checkeds ?? [], page, size: size)
// //   //       .listen((ads) {
// //   //           if (hasLoadding) Navigator.pop(context);
// //   //           if (page == 1) {
// //   //               this.ads = ads;
// //   //           } else {
// //   //               this.ads.addAll(ads);
// //   //           }
// //   //           this.setState((){});
// //   //           // loadUsersWithAds(ads);
// //   //       }, onError: (e) {
// //   //           if (hasLoadding) Navigator.pop(context);
// //   //       });
// //   //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //     // return TabBarView(
// //     //   controller: _tabController,
// //     //   children: tabs.map((e){
// //     //     return Container(
// //     //       height: 53.2,
// //     //        alignment: Alignment.center,
// //     //        child: KQText(e,color: Colors.white,size: 15),
// //     //     );
// //     //   }).toList(),
// //     // );
// //     // return Stack(
// //     //   children: <Widget>[
// //     //     Positioned(
// //     //       left: 0,
// //     //       right: 0,
// //     //       top: 0,
// //     //       bottom: 0,
// //     //       child: Container(
// //     //         color: Colors.black,
// //     //       ),
// //     //     ),
// //     //     Positioned(
// //     //       left: 0,
// //     //       right: 0,
// //     //       top: 0,
// //     //       bottom: 0,
// //     //       child: buildTableViewWidget(),
// //     //     ),
// //     //      Positioned(
// //     //         left: 0,
// //     //         right: 0,
// //     //         bottom: 0,
// //     //         top: 54,
// //     //         child: buildTabBarWidget(),
// //     //       ),
// //     //   ],
// //     // );
// //     // return PageView.builder(
// //     //   itemCount: ads.length,
// //     //   scrollDirection: Axis.vertical,
// //     //   itemBuilder: (BuildContext context,int index){
// //     //     return Container(
// //     //       color: Colors.black,
// //     //       child: VideoItemPage(ads[index]),
// //     //     );
// //     //   },
// //     // );
// //   }
// //   // Widget buildTableViewWidget(){
// //   //   return TabBarView(
// //   //     controller: tabController,
// //   //     children: tabTextList.map((value) =>buildTableViewItemWidget(value))
// //   //     .toList(),
// //   //   );
// //   // }
// //   // Widget buildTabBarWidget(){
// //   //    return Container(
// //   //     ///对齐在顶部中间
// //   //     alignment: Alignment.topCenter,
// //   //     child: TabBar(
// //   //       controller: tabController,
// //   //       tabs: tabWidgetList,
// //   //       ///指示器的颜色
// //   //       indicatorColor: Colors.white,
// //   //       ///指示器的高度
// //   //       indicatorWeight: 2.0,
// //   //       isScrollable: true,

// //   //       ///指示器的宽度与文字对齐
// //   //       indicatorSize: TabBarIndicatorSize.label,
// //   //     ),
// //   //   );
// //   // }

// //   // Widget buildTableViewItemWidget(String value){
// //   //   // List<Advertisement> list = [];
// //   //   if(value=='Video'){
// //   //     // list = this.ads;
// //   //     print("数据的长度");
// //   //     print(this.ads.length);
// //   //   }else if(value=='Premium'){
// //   //     return unlockTimePage();
// //   //   }
// //   //   return PageView.builder(
// //   //     controller: _controller,
// //   //     itemCount: this.ads.length,
// //   //     scrollDirection: Axis.vertical,
// //   //     itemBuilder: (BuildContext context,int index){
// //   //       return Container(
// //   //         color: Colors.black,
// //   //         child:VideoItemPage(this.ads[index]),
// //   //       );
// //   //     },
// //   //     onPageChanged: (index)async {
// //   //       if(index==this.ads.length-1){
// //   //         loadAds(page: ++this.curPage);
// //   //       }
// //   //       // 每刷20个就弹出外部广告
// //   //       var adPlatformLimitNum = SysCfgService.curConfig?.adPlatformLimitNum ?? 0;
// //   //       if (adPlatformLimitNum > 0 && (index+1) % adPlatformLimitNum == 0) {
// //   //         showRewardAd();
// //   //       }
// //   //     },
// //   //   );
// //   // }

// //   // Widget unlockTimePage(){
// //   //   return Scaffold(
// //   //        appBar: ImageAppBar(
// //   //           title: Text(""),
// //   //           centerTitle: false,
// //   //           automaticallyImplyLeading: false,
// //   //       ).appBar(),
// //   //     backgroundColor: Colors.white,
// //   //     body: Container(
// //   //       decoration: BoxDecoration(
// //   //           image: DecorationImage(
// //   //               image: AssetImage(ImageAsset.titleBg2),
// //   //               alignment: Alignment.topCenter
// //   //           )
// //   //       ),
// //   //       child: Column(
// //   //         children: <Widget>[
// //   //           locktimeWidget(),
// //   //           videoListWidget(),
// //   //         ],
// //   //       ),
// //   //     ),
// //   //   );
// //   // }

// //   // Widget locktimeWidget(){
// //   //   return Center(
// //   //     child: Container(
// //   //       child: Column(
// //   //         children: <Widget>[
// //   //            SizedBox(height: 30),
// //   //           KQText("Free unlock times",color: Colors.white,size: 15,),
// //   //           SizedBox(height: 8),
// //   //           KQText("($unLockCount/$totalLockCount)",color: Colors.white,size: 15,),
// //   //         ],
// //   //       ),
// //   //     ),
// //   //   );
// //   // }

// //   // Widget videoListWidget(){
// //   //   return Expanded(
// //   //     child: Container(
// //   //       margin: EdgeInsets.only(top: 20),
// //   //       width: double.infinity,
// //   //       child: _buildLession(),
// //   //     ),
// //   //   );
// //   //   // return _buildLession();
// //   // }

// //   // Widget _buildLession(){
// //   //   return SmartRefresher(
// //   //       enablePullDown: false,
// //   //       enablePullUp: true,
// //   //       footer: ClassicFooter(),
// //   //        controller: _refreshController,
// //   //       // onRefresh: _onRefresh,
// //   //       onLoading: _onLoading,
// //   //       child: GridView(
// //   //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //   //               crossAxisCount: 3,
// //   //               crossAxisSpacing: 20,
// //   //               mainAxisSpacing: 20
// //   //           ),
// //   //           padding: EdgeInsets.only(left: 20, right: 20),
// //   //           children: this.videos.map((ad) => _buildItemAd(ad)).toList()
// //   //       ),
// //   //     );
// //   // }

// //   //  Widget _buildItemAd(ChargeVideoItem video) {
// //   //       return Container(
// //   //               child: Stack(
// //   //                   children: <Widget>[
// //   //                      KqVideo(networdUrl: video.videoUrl, playIconSize: 0),
// //   //                       Center(
// //   //                           child: Image.asset('images/icons/ads/${video.isFree==0&&video.unlockId==0?'ads_lock':'ads_lock_2'}.png', width: 30,),
// //   //                       ),
// //   //                       InkWell(
// //   //                           onTap: ()async{
// //   //                             // bool res = await NativeAds.showRewardAd();
// //   //                             var count = this.totalLockCount-this.unLockCount;
// //   //                             print("/*/*/*/*/*/*/");
// //   //                             print(video.videoUrl);
// //   //                             if(video.isFree==0&&video.unlockId==0){//需要解锁才能看的
// //   //                                 if(count<0){///判断次数是否还有，没有了就拦截
// //   //                                   KQAlert.alert(context, "You have run out of times");
// //   //                                   return;
// //   //                                 }
// //   //                                 await fetchunlock(video); ///否则请求解锁播放视频---然后跳转播放
// //   //                                 await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
// //   //                                       return AdDetail(video: video,status: 1,);
// //   //                                   }));
// //   //                             }else if(video.isFree==0&&video.unlockId!=0){ ///解锁id存在的话，说明已经解锁过了，可以直接播放
// //   //                                await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
// //   //                                       return AdDetail(video: video,status: 1,);
// //   //                                   }));
// //   //                             }else if(video.isFree==1){///免费视频  可以直接播放
// //   //                                 await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
// //   //                                       return AdDetail(video: video,status: 1,);
// //   //                                   }));
// //   //                             }
// //   //                               loadUnlockCount();  ////页面返回后，刷新视频解锁状态以及剩余次数
// //   //                               loadChargeVideo();
// //   //                           },
// //   //                           child: Container(width: double.infinity, height: double.infinity,),
// //   //                       )
// //   //                   ],
// //   //               ) ,
// //   //               decoration: BoxDecoration(
// //   //                   image: DecorationImage(
// //   //                       image: NetworkImage(video?.videoUrl ?? User.defulAvatar),
// //   //                       fit: BoxFit.cover
// //   //                   ),
// //   //                   color: Colors.black,
// //   //                   borderRadius: BorderRadius.circular(10),
// //   //                   boxShadow: [
// //   //                       BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 2, offset: Offset(2, 2)),
// //   //                   ]
// //   //               ),
// //   //       );
// //   //   }

// //   //   Future showRewardAd() async {
// //   //     Future.delayed(Duration(milliseconds: 200), ()async{
// //   //       bool res = await NativeAds.showRewardAd();
// //   //       if (res == true) {
// //   //         Http.completeAdWatch().listen((e) {
// //   //           print('完成任务');
// //   //         });
// //   //       }
// //   //     });
// //   //   }

// //   //   Future fetchunlock(ChargeVideoItem video)async{
// //   //      Http.videolock(UserService.curUserId, video.id).listen((res){

// //   //       },onError: (e){
// //   //         KQAlert.alert(context, e);
// //   //       });
// //   //   }

// //   //   fetchDataByPage(int page)async{
// //   //      Http.getChargeVideo(UserService.curUserId, page).listen((video){
// //   //      if(page == 1){
// //   //        this.videos = video;
// //   //      }else{
// //   //        this.videos.addAll(video);
// //   //      }
// //   //      this.setState((){});
// //   //    },onError: (e){
// //   //      KQAlert.alert(context, e);
// //   //    });

// //   //     if (mounted) this.setState((){});
// //   //   }

// //     //   void _onRefresh()async{
// //     //   await this.fetchDataByPage(1);
// //     //   _refreshController.loadComplete();
// //     // }
// //     //  void _onLoading() async{
// //     //     await this.fetchDataByPage(++this.page);
// //     //     _refreshController.loadComplete();
// //     // }
// //     // int todayWitchCount = 0;
// //     // List<Advertisement> bannerAds = [];
// //     // @override
// //     // void initState() {
// //     //     super.initState();
// //     //     Http.fetchHomeBanner().listen((banners) {
// //     //         bannerAds = banners;
// //     //         this.setState(() {});
// //     //     });
// //     //     if (UserService.isLogined) {
// //     //         updateTodayWitchCount();
// //     //     }
// //     //     KQNotification.on(ENotifyEvents.languageCharge, (data) {
// //     //         this.setState(() { });
// //     //     }, this);
// //     // }
// //     // updateTodayWitchCount() {
// //     //     Http.todayVideoCount().listen((count)  {
// //     //         this.todayWitchCount = count > 10 ? 10 : count;
// //     //         this.setState((){});
// //     //     });
// //     // }
// //     // @override
// //     // Widget build(BuildContext context) {
// //     //     return Container(
// //     //         decoration: BoxDecoration(
// //     //             image: DecorationImage(
// //     //                 image: AssetImage(ImageAsset.titleBg2),
// //     //                 alignment: Alignment.topCenter
// //     //             )
// //     //         ),
// //     //         child: Stack(
// //     //             children: <Widget>[
// //     //                 Align(
// //     //                     alignment: Alignment(0, 0.95),
// //     //                     child: Container(
// //     //                         child: Image.asset(ImageAsset.bg),
// //     //                     ),
// //     //                 ),
// //     //                 bodyWidget(),
// //     //             ],
// //     //         ),
// //     //     );
// //     // }

// //     // Widget bodyWidget() {
// //     //     return Column(
// //     //         children: <Widget>[
// //     //             Expanded(child:  AdsCarouselSlider(viewportFraction: 1.0, height: 100.0, ads: bannerAds, autoPlay: true), flex: 1,),
// //     //             Expanded(child: InkWell(
// //     //                 child: Container(
// //     //                     width: double.infinity,
// //     //                     child: Center(child: Icon(Icons.play_circle_filled, size: 80, color: Colors.white,),),
// //     //                         margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
// //     //                         decoration: BoxDecoration(
// //     //                             image: DecorationImage(
// //     //                                 image: AssetImage(ImageAsset.thirdAdBg),
// //     //                                 fit: BoxFit.cover,
// //     //                             ),
// //     //                             borderRadius: BorderRadius.all(Radius.circular(15)),
// //     //                         ),
// //     //                     ),
// //     //                     onTap: clickPlayNativeAd,
// //     //                 ), flex: 4,
// //     //             ),
// //     //             KQText(FlutterI18n.translate(context, "home.videoCount", translationParams: {"count": todayWitchCount.toString()}),  color: Color(0xff381B7F), size: 16, fontWeight: FontWeight.w500,),
// //     //             SizedBox(height: 10,),

// //     //         ],
// //     //     );
// //     // }

// //     // clickPlayNativeAd() async{
// //     //     if (!Throttle.status('click_witch_ad', interval: 1000)) {
// //     //         return;
// //     //     }
// //     //     if (UserService.isLogined) {
// //     //         num leftTime = await KqObservable.toFuture(Http.canWatchNow());
// //     //         if (leftTime > 0) {
// //     //             KqToast('please come back again in ${(leftTime / 1000 / 60).ceil()} minute (Tolong kembali lagi dalam ${(leftTime / 1000 / 60).ceil()} menit)');
// //     //             return;
// //     //         }
// //     //     }
// //     //     bool res = await NativeAds.showRewardAd();
// //     //     print("广告结束  是否播发成功: $res 是否登录 ${UserService.isLogined}");
// //     //     if (res && UserService.isLogined) {
// //     //         Http.completeAdWatch().listen((e) {
// //     //             updateTodayWitchCount();
// //     //         });
// //     //     }
// //     // }

// //   // showPostBottomSheet(BuildContext context){
// //   //   return showBottomSheet(
// //   //      context: context,
// //   //      backgroundColor: Colors.transparent,
// //   //      builder: (BuildContext context){
// //   //       return Scaffold(
// //   //         backgroundColor: Colors.white.withOpacity(0.92),
// //   //         body: Center(
// //   //           child: BackdropFilter(
// //   //              filter: ImageFilter.blur(
// //   //               sigmaX: 5.0,
// //   //               sigmaY: 5.0,
// //   //             ),
// //   //           ),
// //   //         ),
// //   //       );
// //   //     }
// //   //   );
// //   // }
// //   //  @override
// //   // void didChangeAppLifecycleState(AppLifecycleState state) {
// //   //   print("*-*-*-*-*-*-*-*-*-");
// //   //   print(state.toString());
// //   // }
// //     @override
// //     void dispose() {
// //         super.dispose();
// //         KQNotification.offTarget(this);
// //     }
// // }
// import 'dart:ui';

// import 'package:app/kqlib/component/kq_text.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// class Home extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return HomeView();
//   }
// }

// class HomeView extends State<Home> with SingleTickerProviderStateMixin,WidgetsBindingObserver{
//   TabController _tabController;
//   RefreshController _refreshController = RefreshController(initialRefresh: false);
//   FocusNode focusNode = new FocusNode();
//   List tabs = ["For You", "Following", "Trending"];
//   List staticdata = ['1','2','3'];
//   List staticType = ["For You", "Following", "Trending","For You", "Following", "Trending","For You", "Following", "Trending"];
//   String imgurl = '';
//   bool isShowTab = false;
//   bool isShowNav = false;

//   int currentIndex = -1;
//   @override
//   void initState() { 
//     super.initState();
//      _tabController = TabController(length: tabs.length, vsync: this);
//      focusNode.addListener((){
//        print(focusNode.hasFocus);
//        if(!focusNode.hasFocus){
//          isShowNav = false;
//          setState(() {
           
//          });
//        }
//      });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xff05021D),
//       appBar:isShowNav?seachWidget():tabBarwidget(),
//       body: GestureDetector(
//         onTap: (){
//           focusNode.unfocus();
//         },
//         child: TabBarView(
//           controller: _tabController,
//           children: tabs.map((e){
//             var index = tabs.indexOf(e);
//             return pageViewElement(index);
//           }).toList(),
//         ),
//       ),
//     );
//   }

//   //tabBarWidget
//   Widget tabBarwidget(){
//     return AppBar(
//         backgroundColor: Color(0xff09052D),
//         centerTitle: true,
//         title: KQText("Vtuebe",
//             size: 19, fontWeight: FontWeight.bold, color: Colors.white),
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(
//                 Icons.search,
//                 color: Colors.white,
//                 size: 23.33,
//               ),
//               onPressed: (){
//                 setState(() {
//                   isShowNav = !isShowNav;
//                 });
//               },
//           ),
//         ],
//         leading: IconButton(
//             icon: Icon(
//               Icons.dashboard,
//               color: Colors.white,
//               size: 23.33,
//             ),
//             onPressed: (){
//               setState(() {
//                 isShowTab = !isShowTab;
//               });
//             },
//         ),
//         bottom:isShowTab?newTaBarwidget():oldTabBarwidget(),
        
//       );
//   }

//   //searchwidget
//   Widget seachWidget(){
//     return AppBar(
//       backgroundColor: Color(0xff09052D),
//       title: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 41,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width-80,
//               height: 41,
//               child: TextFormField(
//                   focusNode: focusNode,
//                   autofocus: true,
//                   style: TextStyle(letterSpacing: 2,color: Colors.white),
//                   decoration: InputDecoration(
//                      border:InputBorder.none,
//                      enabledBorder:InputBorder.none,
//                   ),
//                   onChanged: (str) {
//                       print(str);
//                   },
//               ),
//             ),
//             IconButton(icon: Icon(Icons.search,size: 23,color: Colors.white,), onPressed: (){
              
//             })
//           ],
//         ),
//       ),
//       bottom:newTaBarwidget(),
//     );
//   }

//   //旧的tab
//   Widget oldTabBarwidget(){
//     return TabBar(
//       indicatorColor: Colors.white,
//       indicatorSize: TabBarIndicatorSize.label,
//       controller: _tabController,
//       tabs: tabs.map((e) => Tab(text: e)).toList(),
//     );
//   }

//   //新的tab
//   Widget newTaBarwidget(){
//     return new PreferredSize(
//       preferredSize: Size.fromHeight(63.0),
//       child: Container(
//         width: MediaQuery.of(context).size.width,
//         height: 63.0,
//         color: Color(0xff09052D),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 25,
//                padding: EdgeInsets.symmetric(horizontal: 19),
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: staticType.map((item){
//                   // var index = staticType.indexOf(item);
//                   return GestureDetector(
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: 9),
//                       height: 25,
//                       margin: EdgeInsets.only(right: 6),
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         border: Border.all(width: 1,color: Colors.white),
//                         borderRadius: BorderRadius.circular(10)
//                       ),
//                       child: KQText(item,size: 13,color: Colors.white,),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             SizedBox(height: 10,),
//             Center(
//               child: GestureDetector(
//                 child: Container(
//                   width: 35,
//                   height: 5,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5),
//                   ),
//                 ),
//                 onPanDown: (DragDownDetails e){
//                   print(e);
//                 },
//                 onPanUpdate: (DragUpdateDetails e){
//                   print(e.delta.dx);
//                 },
//                 onPanEnd: (DragEndDetails e){
//                   print(e);
//                 },
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
  
  
//   //页面
//   Widget pageViewElement(int index){
//     if(index==0){
//       return foryoupage();
//     }else if(index==1){
//       return Container();
//     }else{
//       return Container();
//     }
//   }

//   //For you page
//   Widget foryoupage(){
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.symmetric(vertical: 13,horizontal: 19),
//       child: SmartRefresher(
//         enablePullDown: true,
//         enablePullUp: true,
//         controller: _refreshController,
//         onRefresh: _onRefreshForyou,
//         onLoading: _onLoadingForyou,
//         header: WaterDropHeader(),
//         footer: ClassicFooter(),
//         child: ListView.builder(
//             itemBuilder: (c, i) => foryouListItem(i),
//             // itemExtent: 60.0,
//             itemCount: staticdata.length,
//         ),
//       ),
//     );
//   }

//   Widget foryouListItem(int index){
//     var element = this.staticdata[index];
//     return Container(
//       width:  MediaQuery.of(context).size.width-38,
//       margin: EdgeInsets.only(bottom: 12),
//       decoration: BoxDecoration(
//         color: Color(0xFF1A1640),
//         borderRadius: BorderRadius.circular(11),
//       ),
//       child: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               Container(
//                 padding: EdgeInsets.all(11),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Container(
//                       width: 165,
//                       child: KQText("Today is a good day !",size: 15,color: Colors.white),
//                     ),
//                     KQText('200+views',size: 11,color: Color(0xff897AFF))
//                   ],
//                 ),
//               ),
//               CachedNetworkImage(
//                 imageUrl:this.imgurl,
//                 width: double.infinity,
//                 height: 215,
//               ),
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 19,vertical: 7),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     commonImageText('images/new_ui/like_icon.png',369,(){}),
//                     commonImageText('images/new_ui/download_icon.png',369,(){}),
//                     commonImageText('images/new_ui/share_icon.png',0,(){}),
//                     commonImageText('images/new_ui/point_icon.png',0,(){
//                       setState(() {
//                         this.currentIndex = index;
//                       });
//                     }),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           moreSelectwidget(index),
//           selectContentwidget(index),
//         ],
//       )
//     );
//   }
  
//   //毛玻璃蒙层
//   Widget moreSelectwidget(int index){
  
//     if(this.currentIndex!=index){
//       return Container();
//     }
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           this.currentIndex = -1;
//         });
//       },
//       child: ClipRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 7.0),
//           child: Opacity(
//             opacity: 0.1,
//             child: Center(
//               child: Container(
//                 width:  MediaQuery.of(context).size.width-38,
//                 height: 300,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
  
//   //蒙层选择区域
//   Widget selectContentwidget(int index){
   
//     if(this.currentIndex!=index){
//       return Container();
//     }
//     return Container(
//       height: 300,
//       child: Center(
//         child: Container(
//           width: 175,
//           height: 234,
//           decoration: BoxDecoration(
//             color: Color(0xff09052D),
//             borderRadius: BorderRadius.circular(7),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               selectImageText('images/new_ui/select_1.png',14,'Download this post',(){}),
//               selectImageText('images/new_ui/select_2.png',12,'Save this post',(){}),
//               selectImageText('images/new_ui/select_3.png',16,'I don‘t like this',(){}),
//               selectImageText('images/new_ui/select_4.png',13,'This is a repost',(){}),
//               selectImageText('images/new_ui/select_5.png',12,'Report post',(){}),
//               selectImageText('images/new_ui/select_6.png',15,'Hide this post',(){}),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget commonImageText(String imgurl,int text,Function onPress){
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(imgurl,width: 26,height: 26,fit: BoxFit.cover),
//             KQText(text==0?'':'$text',size: 12,color: Colors.white)
//           ],
//         ),
//       ),
//     );
//   }

//   Widget selectImageText(String imgurl,double width,String title,Function onPress){
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         width: 175,
//         padding: EdgeInsets.fromLTRB(14, 11, 13, 11),
//         decoration: BoxDecoration(
//           border: Border(bottom: BorderSide(width: 1,color: Color(0xff171341)))
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             Image.asset(imgurl,width: width,height: 15,fit: BoxFit.cover),
//             SizedBox(width: 15),
//             KQText(title,size: 13,color: Colors.white)
//           ],
//         ),
//       ),
//     );
//   }

//   void _onRefreshForyou(){
//     _refreshController.refreshCompleted();
//   }

//   void _onLoadingForyou(){
//     _refreshController.refreshCompleted();
//   }

// }
