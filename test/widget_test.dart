// // // // import 'dart:html';

// // // import 'dart:developer';

// // // import 'package:app/entity/advertisement.dart';
// // // import 'package:app/entity/chargevideo.dart';
// // // import 'package:app/entity/user.dart';
// // // import 'package:app/kqlib/KqToast.dart';
// // // import 'package:app/kqlib/component/alert.dart';
// // // import 'package:app/kqlib/component/image_app_bar.dart';
// // // import 'package:app/kqlib/component/image_asset.dart';
// // // import 'package:app/kqlib/component/kq-buttons.dart';
// // // import 'package:app/kqlib/component/kq_text.dart';
// // // import 'package:app/kqlib/component/kq_video.dart';
// // // import 'package:app/kqlib/kq-observable.dart';
// // // import 'package:app/kqlib/native/ads.dart';
// // // import 'package:app/kqlib/notify/notification.dart';
// // // import 'package:app/kqlib/notify/notify_event.dart';
// // // import 'package:app/kqlib/router/kq_navigator.dart';
// // // import 'package:app/network/http-client.dart';
// // // import 'package:app/pages/components/ads_carousel_slider.dart';
// // // import 'package:app/pages/home/ads/ad_detail.dart';
// // // import 'package:app/pages/home/home_video_page.dart';
// // // import 'package:app/service/ad_category_service.dart';
// // // import 'package:app/service/sys-cfg-service.dart';
// // // import 'package:app/service/throttle.dart';
// // // import 'package:app/service/user-service.dart';
// // // import 'package:cached_network_image/cached_network_image.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_i18n/flutter_i18n.dart';
// // // import 'package:pull_to_refresh/pull_to_refresh.dart';
// // // import 'package:webview_flutter/webview_flutter.dart';
// // //   List tabs = ["For You", "Following", "Trending"];

// // // class Home extends StatelessWidget{
// // //   TabController _tabController;
// // //     @override
// // //     Widget build(BuildContext context) {
// // //         return Scaffold(
// // //             backgroundColor: Color(0xff05021D),
// // //             appBar: AppBar(
// // //               backgroundColor:Color(0xff09052D),
// // //               centerTitle:true,
// // //               title: KQText("Vtuebe",size: 19,fontWeight: FontWeight.bold,color: Colors.white),
// // //               actions: <Widget>[
// // //                 IconButton(icon:Icon(Icons.search,color: Colors.white,size: 23.33,) , onPressed: null)
// // //               ],
// // //               leading: IconButton(icon:Icon(Icons.dashboard,color: Colors.white,size: 23.33,) , onPressed: null),
// // //               bottom: TabBar(
// // //                 controller: _tabController,
// // //                 tabs: tabs.map((e) => Tab(text: e)).toList(),
// // //               ),
// // //             ),
// // //             // appBar: ImageAppBar(
// // //             //     centerTitle: false,
// // //             //     title:  InkWell(
// // //             //         child: Row(children: <Widget>[
// // //             //             SizedBox(width: 5,),
// // //             //             CircleAvatar(backgroundImage: NetworkImage(UserService.curUser?.avatarUrl ?? User.defulAvatar), radius: 25,),
// // //             //             SizedBox(width: 10,),
// // //             //             KQText(UserService.curUser?.nickname ?? 'Login', color: Colors.white, size: 18,),
// // //             //         ],),
// // //             //         onTap: () {
// // //             //             if (!UserService.isLogined) {
// // //             //                 Navigator.pushNamed(context, 'login');
// // //             //             } else {
// // //             //                 if (!UserService.checkIsAuth(context)) {
// // //             //                     return;
// // //             //                 }
// // //             //                 KqNavigator.toUcDetai(context, UserService.curUser);
// // //             //             }
// // //             //         },
// // //             //     ),
// // //             //     actions: <Widget>[
// // //             //         KQButtons.minBtn(
// // //             //             child: Image.asset(ImageAsset.checkIn, width: 26,),
// // //             //             onPressed: () {
// // //             //                 if (!UserService.isLogined) {
// // //             //                     Navigator.pushNamed(context, 'login');
// // //             //                 } else if (UserService.checkIsAuth(context)){
// // //             //                     Navigator.pushNamed(context, 'checkIn');
// // //             //                 }
// // //             //             },
// // //             //         ),
// // //             //         SizedBox(width: 15,)
// // //             //     ]
// // //             // ).appBar(),
// // //             body: HomeStateful(),
// // //         );
// // //     }
// // // }

// // // class HomeStateful extends StatefulWidget {
// // //     @override
// // //     State<StatefulWidget> createState() {
// // //         return HomeState();
// // //     }
// // // }
// // // class HomeState extends State<HomeStateful> with SingleTickerProviderStateMixin,WidgetsBindingObserver{
// // //   // List<Advertisement> ads = [];
// // //   // List<ChargeVideoItem> videos = [];
// // //   //  bool isVideoAd = true;
// // //   //   int curPage = 1;
// // //   //   int page = 1;
// // //   //   int size = 10;
// // //   //   List<String> tabTextList = ['Video','Premium'];
// // //   //   List<Tab> tabWidgetList = [];
// // //   //   TabController tabController;
// // //   //   int unLockCount = 0;
// // //   //   int totalLockCount = 0;
// // //   //   RefreshController _refreshController = RefreshController(initialRefresh: false);
// // //   //   PageController _controller;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     WidgetsBinding.instance.addObserver(this);
// // //     // if (!UserService.isLogined) return;
// // //     // for(var value in tabTextList){
// // //     //   tabWidgetList.add(Tab(text: '$value',));
// // //     // }
// // //     //  tabController = new TabController(length: tabTextList.length, vsync: this);
// // //     // loadAds();
// // //     // loadUnlockCount();
// // //     // loadChargeVideo();
// // //     // KQNotification.on(ENotifyEvents.languageCharge, (data){
// // //     //   if(data==0){
// // //     //     this.ads = [];
// // //     //     this.curPage = 1;
// // //     //     loadAds(page: 1,hasLoadding: true);
// // //     //     _controller = PageController(initialPage: 0);
// // //     //     loadUnlockCount();
// // //     //     loadChargeVideo();
// // //     //   }
// // //     //   this.setState(() { });
// // //     // }, this);

// // //   }

// // //   //  void loadUnlockCount(){
// // //   //    Http.toMonthVideoUnlockCount(UserService.curUserId).listen((res){
// // //   //      this.unLockCount = res['use'];
// // //   //      this.totalLockCount = res['all'];
// // //   //      this.setState((){});
// // //   //    },onError: (err){

// // //   //    });
// // //   //  }

// // //   //  void loadChargeVideo({int page = 1}){
// // //   //    Http.getChargeVideo(UserService.curUserId, page).listen((video){
// // //   //      if(page == 1){
// // //   //        this.videos = video;
// // //   //      }else{
// // //   //        this.videos.addAll(video);
// // //   //      }
// // //   //      this.setState((){});
// // //   //    },onError: (e){
// // //   //      KQAlert.alert(context, e);
// // //   //    });
// // //   //  }

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
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Container();
// // //     // return TabBarView(
// // //     //   controller: _tabController,
// // //     //   children: tabs.map((e){
// // //     //     return Container(
// // //     //       height: 53.2,
// // //     //        alignment: Alignment.center,
// // //     //        child: KQText(e,color: Colors.white,size: 15),
// // //     //     );
// // //     //   }).toList(),
// // //     // );
// // //     // return Stack(
// // //     //   children: <Widget>[
// // //     //     Positioned(
// // //     //       left: 0,
// // //     //       right: 0,
// // //     //       top: 0,
// // //     //       bottom: 0,
// // //     //       child: Container(
// // //     //         color: Colors.black,
// // //     //       ),
// // //     //     ),
// // //     //     Positioned(
// // //     //       left: 0,
// // //     //       right: 0,
// // //     //       top: 0,
// // //     //       bottom: 0,
// // //     //       child: buildTableViewWidget(),
// // //     //     ),
// // //     //      Positioned(
// // //     //         left: 0,
// // //     //         right: 0,
// // //     //         bottom: 0,
// // //     //         top: 54,
// // //     //         child: buildTabBarWidget(),
// // //     //       ),
// // //     //   ],
// // //     // );
// // //     // return PageView.builder(
// // //     //   itemCount: ads.length,
// // //     //   scrollDirection: Axis.vertical,
// // //     //   itemBuilder: (BuildContext context,int index){
// // //     //     return Container(
// // //     //       color: Colors.black,
// // //     //       child: VideoItemPage(ads[index]),
// // //     //     );
// // //     //   },
// // //     // );
// // //   }
// // //   // Widget buildTableViewWidget(){
// // //   //   return TabBarView(
// // //   //     controller: tabController,
// // //   //     children: tabTextList.map((value) =>buildTableViewItemWidget(value))
// // //   //     .toList(),
// // //   //   );
// // //   // }
// // //   // Widget buildTabBarWidget(){
// // //   //    return Container(
// // //   //     ///对齐在顶部中间
// // //   //     alignment: Alignment.topCenter,
// // //   //     child: TabBar(
// // //   //       controller: tabController,
// // //   //       tabs: tabWidgetList,
// // //   //       ///指示器的颜色
// // //   //       indicatorColor: Colors.white,
// // //   //       ///指示器的高度
// // //   //       indicatorWeight: 2.0,
// // //   //       isScrollable: true,

// // //   //       ///指示器的宽度与文字对齐
// // //   //       indicatorSize: TabBarIndicatorSize.label,
// // //   //     ),
// // //   //   );
// // //   // }

// // //   // Widget buildTableViewItemWidget(String value){
// // //   //   // List<Advertisement> list = [];
// // //   //   if(value=='Video'){
// // //   //     // list = this.ads;
// // //   //     print("数据的长度");
// // //   //     print(this.ads.length);
// // //   //   }else if(value=='Premium'){
// // //   //     return unlockTimePage();
// // //   //   }
// // //   //   return PageView.builder(
// // //   //     controller: _controller,
// // //   //     itemCount: this.ads.length,
// // //   //     scrollDirection: Axis.vertical,
// // //   //     itemBuilder: (BuildContext context,int index){
// // //   //       return Container(
// // //   //         color: Colors.black,
// // //   //         child:VideoItemPage(this.ads[index]),
// // //   //       );
// // //   //     },
// // //   //     onPageChanged: (index)async {
// // //   //       if(index==this.ads.length-1){
// // //   //         loadAds(page: ++this.curPage);
// // //   //       }
// // //   //       // 每刷20个就弹出外部广告
// // //   //       var adPlatformLimitNum = SysCfgService.curConfig?.adPlatformLimitNum ?? 0;
// // //   //       if (adPlatformLimitNum > 0 && (index+1) % adPlatformLimitNum == 0) {
// // //   //         showRewardAd();
// // //   //       }
// // //   //     },
// // //   //   );
// // //   // }

// // //   // Widget unlockTimePage(){
// // //   //   return Scaffold(
// // //   //        appBar: ImageAppBar(
// // //   //           title: Text(""),
// // //   //           centerTitle: false,
// // //   //           automaticallyImplyLeading: false,
// // //   //       ).appBar(),
// // //   //     backgroundColor: Colors.white,
// // //   //     body: Container(
// // //   //       decoration: BoxDecoration(
// // //   //           image: DecorationImage(
// // //   //               image: AssetImage(ImageAsset.titleBg2),
// // //   //               alignment: Alignment.topCenter
// // //   //           )
// // //   //       ),
// // //   //       child: Column(
// // //   //         children: <Widget>[
// // //   //           locktimeWidget(),
// // //   //           videoListWidget(),
// // //   //         ],
// // //   //       ),
// // //   //     ),
// // //   //   );
// // //   // }

// // //   // Widget locktimeWidget(){
// // //   //   return Center(
// // //   //     child: Container(
// // //   //       child: Column(
// // //   //         children: <Widget>[
// // //   //            SizedBox(height: 30),
// // //   //           KQText("Free unlock times",color: Colors.white,size: 15,),
// // //   //           SizedBox(height: 8),
// // //   //           KQText("($unLockCount/$totalLockCount)",color: Colors.white,size: 15,),
// // //   //         ],
// // //   //       ),
// // //   //     ),
// // //   //   );
// // //   // }

// // //   // Widget videoListWidget(){
// // //   //   return Expanded(
// // //   //     child: Container(
// // //   //       margin: EdgeInsets.only(top: 20),
// // //   //       width: double.infinity,
// // //   //       child: _buildLession(),
// // //   //     ),
// // //   //   );
// // //   //   // return _buildLession();
// // //   // }

// // //   // Widget _buildLession(){
// // //   //   return SmartRefresher(
// // //   //       enablePullDown: false,
// // //   //       enablePullUp: true,
// // //   //       footer: ClassicFooter(),
// // //   //        controller: _refreshController,
// // //   //       // onRefresh: _onRefresh,
// // //   //       onLoading: _onLoading,
// // //   //       child: GridView(
// // //   //           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// // //   //               crossAxisCount: 3,
// // //   //               crossAxisSpacing: 20,
// // //   //               mainAxisSpacing: 20
// // //   //           ),
// // //   //           padding: EdgeInsets.only(left: 20, right: 20),
// // //   //           children: this.videos.map((ad) => _buildItemAd(ad)).toList()
// // //   //       ),
// // //   //     );
// // //   // }

// // //   //  Widget _buildItemAd(ChargeVideoItem video) {
// // //   //       return Container(
// // //   //               child: Stack(
// // //   //                   children: <Widget>[
// // //   //                      KqVideo(networdUrl: video.videoUrl, playIconSize: 0),
// // //   //                       Center(
// // //   //                           child: Image.asset('images/icons/ads/${video.isFree==0&&video.unlockId==0?'ads_lock':'ads_lock_2'}.png', width: 30,),
// // //   //                       ),
// // //   //                       InkWell(
// // //   //                           onTap: ()async{
// // //   //                             // bool res = await NativeAds.showRewardAd();
// // //   //                             var count = this.totalLockCount-this.unLockCount;
// // //   //                             print("/*/*/*/*/*/*/");
// // //   //                             print(video.videoUrl);
// // //   //                             if(video.isFree==0&&video.unlockId==0){//需要解锁才能看的
// // //   //                                 if(count<0){///判断次数是否还有，没有了就拦截
// // //   //                                   KQAlert.alert(context, "You have run out of times");
// // //   //                                   return;
// // //   //                                 }
// // //   //                                 await fetchunlock(video); ///否则请求解锁播放视频---然后跳转播放
// // //   //                                 await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
// // //   //                                       return AdDetail(video: video,status: 1,);
// // //   //                                   }));
// // //   //                             }else if(video.isFree==0&&video.unlockId!=0){ ///解锁id存在的话，说明已经解锁过了，可以直接播放
// // //   //                                await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
// // //   //                                       return AdDetail(video: video,status: 1,);
// // //   //                                   }));
// // //   //                             }else if(video.isFree==1){///免费视频  可以直接播放
// // //   //                                 await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
// // //   //                                       return AdDetail(video: video,status: 1,);
// // //   //                                   }));
// // //   //                             }
// // //   //                               loadUnlockCount();  ////页面返回后，刷新视频解锁状态以及剩余次数
// // //   //                               loadChargeVideo();
// // //   //                           },
// // //   //                           child: Container(width: double.infinity, height: double.infinity,),
// // //   //                       )
// // //   //                   ],
// // //   //               ) ,
// // //   //               decoration: BoxDecoration(
// // //   //                   image: DecorationImage(
// // //   //                       image: NetworkImage(video?.videoUrl ?? User.defulAvatar),
// // //   //                       fit: BoxFit.cover
// // //   //                   ),
// // //   //                   color: Colors.black,
// // //   //                   borderRadius: BorderRadius.circular(10),
// // //   //                   boxShadow: [
// // //   //                       BoxShadow(color: Colors.black38, spreadRadius: 1, blurRadius: 2, offset: Offset(2, 2)),
// // //   //                   ]
// // //   //               ),
// // //   //       );
// // //   //   }

// // //   //   Future showRewardAd() async {
// // //   //     Future.delayed(Duration(milliseconds: 200), ()async{
// // //   //       bool res = await NativeAds.showRewardAd();
// // //   //       if (res == true) {
// // //   //         Http.completeAdWatch().listen((e) {
// // //   //           print('完成任务');
// // //   //         });
// // //   //       }
// // //   //     });
// // //   //   }

// // //   //   Future fetchunlock(ChargeVideoItem video)async{
// // //   //      Http.videolock(UserService.curUserId, video.id).listen((res){

// // //   //       },onError: (e){
// // //   //         KQAlert.alert(context, e);
// // //   //       });
// // //   //   }

// // //   //   fetchDataByPage(int page)async{
// // //   //      Http.getChargeVideo(UserService.curUserId, page).listen((video){
// // //   //      if(page == 1){
// // //   //        this.videos = video;
// // //   //      }else{
// // //   //        this.videos.addAll(video);
// // //   //      }
// // //   //      this.setState((){});
// // //   //    },onError: (e){
// // //   //      KQAlert.alert(context, e);
// // //   //    });

// // //   //     if (mounted) this.setState((){});
// // //   //   }

// // //     //   void _onRefresh()async{
// // //     //   await this.fetchDataByPage(1);
// // //     //   _refreshController.loadComplete();
// // //     // }
// // //     //  void _onLoading() async{
// // //     //     await this.fetchDataByPage(++this.page);
// // //     //     _refreshController.loadComplete();
// // //     // }
// // //     // int todayWitchCount = 0;
// // //     // List<Advertisement> bannerAds = [];
// // //     // @override
// // //     // void initState() {
// // //     //     super.initState();
// // //     //     Http.fetchHomeBanner().listen((banners) {
// // //     //         bannerAds = banners;
// // //     //         this.setState(() {});
// // //     //     });
// // //     //     if (UserService.isLogined) {
// // //     //         updateTodayWitchCount();
// // //     //     }
// // //     //     KQNotification.on(ENotifyEvents.languageCharge, (data) {
// // //     //         this.setState(() { });
// // //     //     }, this);
// // //     // }
// // //     // updateTodayWitchCount() {
// // //     //     Http.todayVideoCount().listen((count)  {
// // //     //         this.todayWitchCount = count > 10 ? 10 : count;
// // //     //         this.setState((){});
// // //     //     });
// // //     // }
// // //     // @override
// // //     // Widget build(BuildContext context) {
// // //     //     return Container(
// // //     //         decoration: BoxDecoration(
// // //     //             image: DecorationImage(
// // //     //                 image: AssetImage(ImageAsset.titleBg2),
// // //     //                 alignment: Alignment.topCenter
// // //     //             )
// // //     //         ),
// // //     //         child: Stack(
// // //     //             children: <Widget>[
// // //     //                 Align(
// // //     //                     alignment: Alignment(0, 0.95),
// // //     //                     child: Container(
// // //     //                         child: Image.asset(ImageAsset.bg),
// // //     //                     ),
// // //     //                 ),
// // //     //                 bodyWidget(),
// // //     //             ],
// // //     //         ),
// // //     //     );
// // //     // }

// // //     // Widget bodyWidget() {
// // //     //     return Column(
// // //     //         children: <Widget>[
// // //     //             Expanded(child:  AdsCarouselSlider(viewportFraction: 1.0, height: 100.0, ads: bannerAds, autoPlay: true), flex: 1,),
// // //     //             Expanded(child: InkWell(
// // //     //                 child: Container(
// // //     //                     width: double.infinity,
// // //     //                     child: Center(child: Icon(Icons.play_circle_filled, size: 80, color: Colors.white,),),
// // //     //                         margin: EdgeInsets.fromLTRB(20, 5, 20, 10),
// // //     //                         decoration: BoxDecoration(
// // //     //                             image: DecorationImage(
// // //     //                                 image: AssetImage(ImageAsset.thirdAdBg),
// // //     //                                 fit: BoxFit.cover,
// // //     //                             ),
// // //     //                             borderRadius: BorderRadius.all(Radius.circular(15)),
// // //     //                         ),
// // //     //                     ),
// // //     //                     onTap: clickPlayNativeAd,
// // //     //                 ), flex: 4,
// // //     //             ),
// // //     //             KQText(FlutterI18n.translate(context, "home.videoCount", translationParams: {"count": todayWitchCount.toString()}),  color: Color(0xff381B7F), size: 16, fontWeight: FontWeight.w500,),
// // //     //             SizedBox(height: 10,),

// // //     //         ],
// // //     //     );
// // //     // }

// // //     // clickPlayNativeAd() async{
// // //     //     if (!Throttle.status('click_witch_ad', interval: 1000)) {
// // //     //         return;
// // //     //     }
// // //     //     if (UserService.isLogined) {
// // //     //         num leftTime = await KqObservable.toFuture(Http.canWatchNow());
// // //     //         if (leftTime > 0) {
// // //     //             KqToast('please come back again in ${(leftTime / 1000 / 60).ceil()} minute (Tolong kembali lagi dalam ${(leftTime / 1000 / 60).ceil()} menit)');
// // //     //             return;
// // //     //         }
// // //     //     }
// // //     //     bool res = await NativeAds.showRewardAd();
// // //     //     print("广告结束  是否播发成功: $res 是否登录 ${UserService.isLogined}");
// // //     //     if (res && UserService.isLogined) {
// // //     //         Http.completeAdWatch().listen((e) {
// // //     //             updateTodayWitchCount();
// // //     //         });
// // //     //     }
// // //     // }

// // //   // showPostBottomSheet(BuildContext context){
// // //   //   return showBottomSheet(
// // //   //      context: context,
// // //   //      backgroundColor: Colors.transparent,
// // //   //      builder: (BuildContext context){
// // //   //       return Scaffold(
// // //   //         backgroundColor: Colors.white.withOpacity(0.92),
// // //   //         body: Center(
// // //   //           child: BackdropFilter(
// // //   //              filter: ImageFilter.blur(
// // //   //               sigmaX: 5.0,
// // //   //               sigmaY: 5.0,
// // //   //             ),
// // //   //           ),
// // //   //         ),
// // //   //       );
// // //   //     }
// // //   //   );
// // //   // }
// // //   //  @override
// // //   // void didChangeAppLifecycleState(AppLifecycleState state) {
// // //   //   print("*-*-*-*-*-*-*-*-*-");
// // //   //   print(state.toString());
// // //   // }
// // //     @override
// // //     void dispose() {
// // //         super.dispose();
// // //         KQNotification.offTarget(this);
// // //     }
// // // }
// // import 'dart:ui';

// // import 'package:app/kqlib/component/kq_text.dart';
// // import 'package:cached_network_image/cached_network_image.dart';
// // import 'package:flutter/material.dart';
// // import 'package:pull_to_refresh/pull_to_refresh.dart';

// // class Home extends StatefulWidget {
// //   @override
// //   State<StatefulWidget> createState() {
// //     return HomeView();
// //   }
// // }

// // class HomeView extends State<Home> with SingleTickerProviderStateMixin,WidgetsBindingObserver{
// //   TabController _tabController;
// //   RefreshController _refreshController = RefreshController(initialRefresh: false);
// //   FocusNode focusNode = new FocusNode();
// //   List tabs = ["For You", "Following", "Trending"];
// //   List staticdata = ['1','2','3'];
// //   List staticType = ["For You", "Following", "Trending","For You", "Following", "Trending","For You", "Following", "Trending"];
// //   String imgurl = '';
// //   bool isShowTab = false;
// //   bool isShowNav = false;

// //   int currentIndex = -1;
// //   @override
// //   void initState() { 
// //     super.initState();
// //      _tabController = TabController(length: tabs.length, vsync: this);
// //      focusNode.addListener((){
// //        print(focusNode.hasFocus);
// //        if(!focusNode.hasFocus){
// //          isShowNav = false;
// //          setState(() {
           
// //          });
// //        }
// //      });
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color(0xff05021D),
// //       appBar:isShowNav?seachWidget():tabBarwidget(),
// //       body: GestureDetector(
// //         onTap: (){
// //           focusNode.unfocus();
// //         },
// //         child: TabBarView(
// //           controller: _tabController,
// //           children: tabs.map((e){
// //             var index = tabs.indexOf(e);
// //             return pageViewElement(index);
// //           }).toList(),
// //         ),
// //       ),
// //     );
// //   }

// //   //tabBarWidget
// //   Widget tabBarwidget(){
// //     return AppBar(
// //         backgroundColor: Color(0xff09052D),
// //         centerTitle: true,
// //         title: KQText("Vtuebe",
// //             size: 19, fontWeight: FontWeight.bold, color: Colors.white),
// //         actions: <Widget>[
// //           IconButton(
// //               icon: Icon(
// //                 Icons.search,
// //                 color: Colors.white,
// //                 size: 23.33,
// //               ),
// //               onPressed: (){
// //                 setState(() {
// //                   isShowNav = !isShowNav;
// //                 });
// //               },
// //           ),
// //         ],
// //         leading: IconButton(
// //             icon: Icon(
// //               Icons.dashboard,
// //               color: Colors.white,
// //               size: 23.33,
// //             ),
// //             onPressed: (){
// //               setState(() {
// //                 isShowTab = !isShowTab;
// //               });
// //             },
// //         ),
// //         bottom:isShowTab?newTaBarwidget():oldTabBarwidget(),
        
// //       );
// //   }

// //   //searchwidget
// //   Widget seachWidget(){
// //     return AppBar(
// //       backgroundColor: Color(0xff09052D),
// //       title: Container(
// //         width: MediaQuery.of(context).size.width,
// //         height: 41,
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: <Widget>[
// //             Container(
// //               width: MediaQuery.of(context).size.width-80,
// //               height: 41,
// //               child: TextFormField(
// //                   focusNode: focusNode,
// //                   autofocus: true,
// //                   style: TextStyle(letterSpacing: 2,color: Colors.white),
// //                   decoration: InputDecoration(
// //                      border:InputBorder.none,
// //                      enabledBorder:InputBorder.none,
// //                   ),
// //                   onChanged: (str) {
// //                       print(str);
// //                   },
// //               ),
// //             ),
// //             IconButton(icon: Icon(Icons.search,size: 23,color: Colors.white,), onPressed: (){
              
// //             })
// //           ],
// //         ),
// //       ),
// //       bottom:newTaBarwidget(),
// //     );
// //   }

// //   //旧的tab
// //   Widget oldTabBarwidget(){
// //     return TabBar(
// //       indicatorColor: Colors.white,
// //       indicatorSize: TabBarIndicatorSize.label,
// //       controller: _tabController,
// //       tabs: tabs.map((e) => Tab(text: e)).toList(),
// //     );
// //   }

// //   //新的tab
// //   Widget newTaBarwidget(){
// //     return new PreferredSize(
// //       preferredSize: Size.fromHeight(63.0),
// //       child: Container(
// //         width: MediaQuery.of(context).size.width,
// //         height: 63.0,
// //         color: Color(0xff09052D),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: <Widget>[
// //             Container(
// //               width: MediaQuery.of(context).size.width,
// //               height: 25,
// //                padding: EdgeInsets.symmetric(horizontal: 19),
// //               child: ListView(
// //                 scrollDirection: Axis.horizontal,
// //                 children: staticType.map((item){
// //                   // var index = staticType.indexOf(item);
// //                   return GestureDetector(
// //                     child: Container(
// //                       padding: EdgeInsets.symmetric(horizontal: 9),
// //                       height: 25,
// //                       margin: EdgeInsets.only(right: 6),
// //                       alignment: Alignment.center,
// //                       decoration: BoxDecoration(
// //                         border: Border.all(width: 1,color: Colors.white),
// //                         borderRadius: BorderRadius.circular(10)
// //                       ),
// //                       child: KQText(item,size: 13,color: Colors.white,),
// //                     ),
// //                   );
// //                 }).toList(),
// //               ),
// //             ),
// //             SizedBox(height: 10,),
// //             Center(
// //               child: GestureDetector(
// //                 child: Container(
// //                   width: 35,
// //                   height: 5,
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(5),
// //                   ),
// //                 ),
// //                 onPanDown: (DragDownDetails e){
// //                   print(e);
// //                 },
// //                 onPanUpdate: (DragUpdateDetails e){
// //                   print(e.delta.dx);
// //                 },
// //                 onPanEnd: (DragEndDetails e){
// //                   print(e);
// //                 },
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }
  
  
// //   //页面
// //   Widget pageViewElement(int index){
// //     if(index==0){
// //       return foryoupage();
// //     }else if(index==1){
// //       return Container();
// //     }else{
// //       return Container();
// //     }
// //   }

// //   //For you page
// //   Widget foryoupage(){
// //     return Container(
// //       width: MediaQuery.of(context).size.width,
// //       padding: EdgeInsets.symmetric(vertical: 13,horizontal: 19),
// //       child: SmartRefresher(
// //         enablePullDown: true,
// //         enablePullUp: true,
// //         controller: _refreshController,
// //         onRefresh: _onRefreshForyou,
// //         onLoading: _onLoadingForyou,
// //         header: WaterDropHeader(),
// //         footer: ClassicFooter(),
// //         child: ListView.builder(
// //             itemBuilder: (c, i) => foryouListItem(i),
// //             // itemExtent: 60.0,
// //             itemCount: staticdata.length,
// //         ),
// //       ),
// //     );
// //   }

// //   Widget foryouListItem(int index){
// //     var element = this.staticdata[index];
// //     return Container(
// //       width:  MediaQuery.of(context).size.width-38,
// //       margin: EdgeInsets.only(bottom: 12),
// //       decoration: BoxDecoration(
// //         color: Color(0xFF1A1640),
// //         borderRadius: BorderRadius.circular(11),
// //       ),
// //       child: Stack(
// //         children: <Widget>[
// //           Column(
// //             children: <Widget>[
// //               Container(
// //                 padding: EdgeInsets.all(11),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: <Widget>[
// //                     Container(
// //                       width: 165,
// //                       child: KQText("Today is a good day !",size: 15,color: Colors.white),
// //                     ),
// //                     KQText('200+views',size: 11,color: Color(0xff897AFF))
// //                   ],
// //                 ),
// //               ),
// //               CachedNetworkImage(
// //                 imageUrl:this.imgurl,
// //                 width: double.infinity,
// //                 height: 215,
// //               ),
// //               Container(
// //                 padding: EdgeInsets.symmetric(horizontal: 19,vertical: 7),
// //                 child: Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: <Widget>[
// //                     commonImageText('images/new_ui/like_icon.png',369,(){}),
// //                     commonImageText('images/new_ui/download_icon.png',369,(){}),
// //                     commonImageText('images/new_ui/share_icon.png',0,(){}),
// //                     commonImageText('images/new_ui/point_icon.png',0,(){
// //                       setState(() {
// //                         this.currentIndex = index;
// //                       });
// //                     }),
// //                   ],
// //                 ),
// //               )
// //             ],
// //           ),
// //           moreSelectwidget(index),
// //           selectContentwidget(index),
// //         ],
// //       )
// //     );
// //   }
  
// //   //毛玻璃蒙层
// //   Widget moreSelectwidget(int index){
  
// //     if(this.currentIndex!=index){
// //       return Container();
// //     }
// //     return GestureDetector(
// //       onTap: (){
// //         setState(() {
// //           this.currentIndex = -1;
// //         });
// //       },
// //       child: ClipRect(
// //         child: BackdropFilter(
// //           filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 7.0),
// //           child: Opacity(
// //             opacity: 0.1,
// //             child: Center(
// //               child: Container(
// //                 width:  MediaQuery.of(context).size.width-38,
// //                 height: 300,
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
  
// //   //蒙层选择区域
// //   Widget selectContentwidget(int index){
   
// //     if(this.currentIndex!=index){
// //       return Container();
// //     }
// //     return Container(
// //       height: 300,
// //       child: Center(
// //         child: Container(
// //           width: 175,
// //           height: 234,
// //           decoration: BoxDecoration(
// //             color: Color(0xff09052D),
// //             borderRadius: BorderRadius.circular(7),
// //           ),
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               selectImageText('images/new_ui/select_1.png',14,'Download this post',(){}),
// //               selectImageText('images/new_ui/select_2.png',12,'Save this post',(){}),
// //               selectImageText('images/new_ui/select_3.png',16,'I don‘t like this',(){}),
// //               selectImageText('images/new_ui/select_4.png',13,'This is a repost',(){}),
// //               selectImageText('images/new_ui/select_5.png',12,'Report post',(){}),
// //               selectImageText('images/new_ui/select_6.png',15,'Hide this post',(){}),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget commonImageText(String imgurl,int text,Function onPress){
// //     return GestureDetector(
// //       onTap: onPress,
// //       child: Container(
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: <Widget>[
// //             Image.asset(imgurl,width: 26,height: 26,fit: BoxFit.cover),
// //             KQText(text==0?'':'$text',size: 12,color: Colors.white)
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget selectImageText(String imgurl,double width,String title,Function onPress){
// //     return GestureDetector(
// //       onTap: onPress,
// //       child: Container(
// //         width: 175,
// //         padding: EdgeInsets.fromLTRB(14, 11, 13, 11),
// //         decoration: BoxDecoration(
// //           border: Border(bottom: BorderSide(width: 1,color: Color(0xff171341)))
// //         ),
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.center,
// //           children: <Widget>[
// //             Image.asset(imgurl,width: width,height: 15,fit: BoxFit.cover),
// //             SizedBox(width: 15),
// //             KQText(title,size: 13,color: Colors.white)
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _onRefreshForyou(){
// //     _refreshController.refreshCompleted();
// //   }

// //   void _onLoadingForyou(){
// //     _refreshController.refreshCompleted();
// //   }

// // }



// //////广告页面
// ///
// import 'dart:io';

// import 'package:app/entity/category.dart';
// import 'package:app/entity/user_wallet.dart';
// import 'package:app/kqlib/KqToast.dart';
// import 'package:app/kqlib/component/alert.dart';
// import 'package:app/kqlib/component/image_app_bar.dart';
// import 'package:app/kqlib/component/image_asset.dart';
// import 'package:app/kqlib/component/kq-buttons.dart';
// import 'package:app/kqlib/component/kq_text.dart';
// import 'package:app/kqlib/component/kq_video.dart';
// import 'package:app/kqlib/component/line.dart';
// import 'package:app/network/http-client.dart';
// import 'package:app/service/ad_category_service.dart';
// import 'package:app/service/sys-cfg-service.dart';
// import 'package:app/service/upload-service.dart';
// import 'package:app/service/user-service.dart';
// import 'package:app/service/user-wallet-service.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_i18n/flutter_i18n.dart';
// import 'package:image_picker/image_picker.dart';
// class PostAd extends StatelessWidget{
//     @override
//     Widget build(BuildContext context) {
//         return Scaffold(
//             backgroundColor: Color(0xff05021D),
//             appBar: AppBar(
//               backgroundColor: Color(0xff09052D),
//               title: KQText("Post Advertisements",color: Colors.white,size: 19),
//             ),
//             body: InkWell(
//                 child: PostAdStateful(),
//                 onTap: () => FocusScope.of(context).unfocus(),
//             ),
//         );
//     }
  
// }

// class PostAdStateful extends StatefulWidget {
//     @override
//     State<StatefulWidget> createState() {
//         return PostAdState();
//     }
// }
// class PostAdState extends State<PostAdStateful> with SingleTickerProviderStateMixin{
//     UserWallet selfWalletInfo;
//     // List<int> checkedCategories = [];
//     bool isImageFile = false;
//     File file;
//     List<Category> sysCategoies = [];
//     String adTitle = '';
//     String adDesc = '';
   
//     bool isShowMore = false;
//     int currentCateIndex = -1;
//     //渐变颜色
//     var _gradientOne = LinearGradient(
//       colors: [Color(0xff25ACF9), Color(0xff742FD1)],
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     );
//     var _gradientTwo = LinearGradient(
//       colors: [Color(0xff9AFC4F), Color(0xffACF081)],
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//     );

//      var _gradientThree = LinearGradient(
//       colors: [Color(0xffFE435E), Color(0xffC25E99)],
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//     );

//     var _gradientZero= LinearGradient(
//       colors: [Color(0xff3E3B60), Color(0xff3E3B60)],
//       begin: Alignment.centerLeft,
//       end: Alignment.centerRight,
//     );

//     String _title = 'Type of advertisement';
//     int slectType = 0; //1 视频  2图片 0 不能选择
//     var postOptions = CrossFadeState.showFirst;
//     bool get postFirst => postOptions == CrossFadeState.showFirst;

//     bool isNext = false;
//     int selectIndex = -1;

//     var _scrollController = ScrollController();

//     @override
//     void initState() {
//         super.initState();
//         sysCategoies = AdCategoryService.curCategories;
//         AdCategoryService.fetchCategories().then((value) {
//             this.sysCategoies = value;
//             if (mounted) this.setState((){});
//         });
//         selfWalletInfo = UserWalletService.curWalletInfo;
//         _scrollController.addListener((){

//         });
//     }

//     @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//     @override
//     Widget build(BuildContext context) {
//         return Container(
//           padding: isNext?EdgeInsets.fromLTRB(0, 0, 0, 0): EdgeInsets.fromLTRB(15, 27, 15, 15),
//           child: ListView(
//             controller: _scrollController,
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               isNext?returnBack():Container(),
//               isNext? _buildMyPoints():_buildADFee('VP Required',10),
//               SizedBox(height: 11),
//               isNext?_buildPackages():Container(),
//               isNext&&selectIndex!=-1?totalFeeWidget():Container(),
//               isNext?Container():handleSelectWidget(),
//               isNext?Container():selectWidget(),
//               isNext?Container(): SizedBox(height: 14),
//               isNext?Container(): urlforadWidget(),
//               // _buildADFee('My points',0,_gradientTwo,Color(0xffE93030)),
//               // SizedBox(height: 24),
//               // _buildAddWidget(),
//               // SizedBox(height: 9),
//               // previewFileView(),
//               isNext?Container(): previewFileView(),
//               isNext?Container(): SizedBox(height: 9),
//               isNext?Container(): _buildAdTitle(),
//               isNext?Container(): _buildAdDesc(),
//               isNext?Container(): categorywidget(),
//               // SizedBox(height: 15),
//               // _buildGender(),
//               // SizedBox(height: 12),
//               // _buildVideo('Video',_selectPackage,_package,selectPackage()),
//               // SizedBox(height: 12),
//               // _buildVideo('Banner',_selectBannerPackage,_bannerpackage,bannerPackage(),isShowSecond: false),
//               // SizedBox(height: 12),
//               // _buildVideo('Video',_selectVideoPackage,_videopackage,videoPackage(),isShowSecond: false,isShowDays: true),
//               SizedBox(height: 106),
//               isNext?_buildSumbtn('Post advertisement',(){}):_buildSumbtn('Next',()=>this.setState((){
//                 this.isNext = true;
//                 _scrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.decelerate);
//               })),
//               SizedBox(height: 13),
//             ],
//           ),
//         );  
//     }

//   Widget returnBack(){
//     return GestureDetector(
//       child: Container(
//         width: double.infinity,
//         alignment: Alignment.center,
//         padding: EdgeInsets.symmetric(vertical: 11),
//         margin: EdgeInsets.only(bottom: 11),
//         color: Color(0xff191543),
//         child: KQText("Go back to previous step",color: Colors.white.withOpacity(0.8),size: 17,),
//       ),
//       onTap: (){
//         setState(() {
//           this.isNext = false;
//           this.selectIndex = -1;
//         });
//       },
//     );
//   }

//   Widget handleSelectWidget(){
//       return GestureDetector(
//         child: Container(
//           width: double.infinity,
//           padding: EdgeInsets.fromLTRB(11, 11, 16, 11),
//           decoration: BoxDecoration(
//             color: Color(0xff191543),
//             // borderRadius: BorderRadius.circular(7),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               KQText(_title,size: 17,color: Colors.white.withOpacity(0.8)),
//               Image.asset("images/new_ui/down_icon.png",width: 11,height: 6,fit: BoxFit.cover,)
//             ],
//           ),
//         ),
//         onTap: _selectPostAd,
//       );
//     }
  
//    _selectPostAd() {
//     setState(() {
//       postOptions =
//           !postFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond;
//     });
//   }

//   Widget selectWidget() =>AnimatedCrossFade(
//       firstCurve: Curves.easeInCirc,
//       secondCurve: Curves.easeInToLinear,
//       firstChild: Container(),
//       duration: Duration(milliseconds: 300),
//       crossFadeState: postOptions,
//       secondChild:Container(
//         // padding: EdgeInsets.symmetric(vertical: 9),
//         width: double.infinity,
//         child: Column(
//           children: <Widget>[
//             GestureDetector(
//               onTap: (){
//                 this._title = 'Banner advertisement';
//                 this.slectType = 2;
//                 this.file = null;
//                 postOptions = CrossFadeState.showFirst ;
//                 setState(() {
                  
//                 });
//               },
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.fromLTRB(11, 11, 16, 11),
//                 decoration: BoxDecoration(
//                   color: Color(0xff191543),
//                   // borderRadius: BorderRadius.circular(7),
//                   border: Border(top: BorderSide(width: 1,color: Color(0xff372E7D)),
//                   bottom: BorderSide(width: 1,color: Color(0xff372E7D))),
//                 ),
//                 child: KQText("Banner advertisement",size:17,color: Colors.white.withOpacity(0.89),),
//               ),
//             ),
//             GestureDetector(
//               child: Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.fromLTRB(11, 11, 16, 11),
//                 decoration: BoxDecoration(
//                   color: Color(0xff191543),
//                   // borderRadius: BorderRadius.circular(7),
//                 ),
//                 child: KQText("Video advertisement",size:17,color: Colors.white.withOpacity(0.89),),
//               ),
//               onTap: (){
//                 this._title = 'Video advertisement';
//                 this.slectType = 1;
//                 this.file = null;
//                 postOptions = CrossFadeState.showFirst ;
//                 setState(() {
                  
//                 });
//               },
//             ),
//           ],
//         ),
//       ),
//     );

//   Widget urlforadWidget(){
//     return GestureDetector(
//       onTap: selectFile,
//       child: Container(
//         width: double.infinity,
//         height: 45,
//         decoration: BoxDecoration(
//           color: Color(0xff191543),
//           borderRadius: BorderRadius.circular(7),
//         ),
//         alignment: Alignment.centerLeft,
//         padding: EdgeInsets.only(left: 11),
//         child: KQText(file==null?'+ URL for ad':file.path,color: Colors.white.withOpacity(0.5),size: 17,),
//         // child: TextField(
//         //   decoration: InputDecoration(
//         //     border: InputBorder.none,
//         //     enabledBorder: InputBorder.none,
//         //     hintText: '+ URL for ad',
//         //     hintStyle: TextStyle(color: Colors.white.withOpacity(0.5),fontSize: 17),
//         //     contentPadding: EdgeInsets.only(left: 11)
//         //   ),
//         //   onChanged: (str) {
//         //       // this.setState(() => this.phone = str);
//         //   },
//         // ),
//       ),
//     );
//   }

//   selectFile(){
//     if(slectType==0){
//       return;
//     }
//     if(slectType==1){
//       pickFile(false);
//     }else{
//       pickFile(true);
//     }
//   }

//   //my points
//   Widget _buildMyPoints(){
//     return Container(
//       width: double.infinity,
//       padding: EdgeInsets.symmetric(horizontal: 14,vertical: 13),
//       color: Color(0xff191543),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: <Widget>[
//           KQText('My points',size: 19,color: Colors.white.withOpacity(0.6)),
//           Container(
//             child: Row(
//               children: <Widget>[
//                 goldBannerWidget('silver',20),
//                 SizedBox(width: 9),
//                 goldBannerWidget('gold',20),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPackages(){
//     return Container(
//       margin: EdgeInsets.all(14),
//       width: double.infinity,
//       padding: EdgeInsets.fromLTRB(19, 19, 19, 14),
//       decoration: BoxDecoration(
//         color: Color(0xff191543),
//         borderRadius: BorderRadius.circular(7),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           KQText("Packages",size: 17,color: Colors.white.withOpacity(0.8),),
//           SizedBox(height: 19),
//           Column(
//             children: [1,2,3].map((item){
//               var index = [1,2,3].indexOf(item);
//               return packagesWrap(index);
//             }).toList(),
//           ),
//           morewidget(),
//         ],
//       ),
//     );
//   }

//   Widget packagesWrap(int index){
//     var gradient;
//     if(index%2==0){
//       gradient = _gradientTwo;
//     }else{
//       gradient = _gradientThree;
//     }
//     return GestureDetector(
//       onTap: (){
//         setState(() {
//           selectIndex = index;
//         });
//       },
//       child: Container(
//         width: double.infinity,
//         height: 89,
//         margin: EdgeInsets.only(bottom: 14),
//         decoration: BoxDecoration(
//           color:Color(0xff302D56),
//           borderRadius: BorderRadius.circular(7),
//         ),
//         child: Row(
//           children: <Widget>[
//             Container(
//               height: 89,
//               width: 21,
//               decoration: BoxDecoration(
//                 gradient:selectIndex==index?gradient:_gradientZero,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(7),
//                   bottomLeft: Radius.circular(7),
//                 ),
//               ),
//             ),
//             SizedBox(width: 12),
//             Container(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   KQText("Get 100 views on your ad",size: 17,color: Colors.white.withOpacity(0.8)),
//                   SizedBox(height: 17),
//                   Container(
//                     child: Row(
//                       children: <Widget>[
//                         goldBannerWidget('silver',20),
//                         Icon(Icons.add,color: Colors.white.withOpacity(0.8),size: 12),
//                         goldBannerWidget('gold',20),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget morewidget(){
//     return Container(
//       width: double.infinity,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 11,vertical: 9),
//             decoration: BoxDecoration(
//               color: Color(0xff897AFF),
//               borderRadius: BorderRadius.circular(2),
//             ),
//             child: KQText("More",color: Colors.white,size: 13),
//           )
//         ],
//       ),
//     );
//   }

//   Widget totalFeeWidget(){
//     return Container(
//       margin: EdgeInsets.all(14),
//       width: double.infinity,
//       padding: EdgeInsets.fromLTRB(19, 19, 19, 20),
//       decoration: BoxDecoration(
//         color: Color(0xff191543),
//         borderRadius: BorderRadius.circular(7),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//            KQText("Total",size: 17,color: Colors.white.withOpacity(0.8),),
//            SizedBox(height: 16),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[  
//                 KQText("Advertisement Fee:",size: 17,color: Colors.white.withOpacity(0.8),),
//                 goldBannerWidget('silver',20),
//              ],
//            ),
//            SizedBox(height: 16),
//            Row(
//              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//              children: <Widget>[  
//                 KQText("Package Fee:",size: 17,color: Colors.white.withOpacity(0.8),),
//                 Container(
//                   child: Row(
//                     children: <Widget>[
//                       goldBannerWidget('silver',20),
//                       Icon(Icons.add,color: Colors.white.withOpacity(0.8),size: 12),
//                       goldBannerWidget('gold',20),
//                     ],
//                   ),
//                 ),
//              ],
//            ),
//            SizedBox(height: 16),
//            Divider(color: Colors.white.withOpacity(0.1)),
//            Container(
//              width: double.infinity,
//              padding: EdgeInsets.only(top: 19),
//              child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                   goldBannerWidget('silver',20),
//                   Icon(Icons.add,color: Colors.white.withOpacity(0.8),size: 12),
//                   goldBannerWidget('gold',20),
//                ],
//              ),
//            )

//         ],
//       ),
//     );
//   }

//   Widget goldBannerWidget(String type,int value){
//     return Container(
//       width: 63,
//       height: 25,
//       alignment: Alignment.centerRight,
//       padding: EdgeInsets.only(right: 15),
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage("images/new_ui/$type.png"),
//         ),
//       ),
//       child: KQText("$value",color: Color(0xff000000),size: 13,),
//     );
//   }


//   // 广告费用
//   Widget _buildADFee(String title,int points){
//     return Container(
//       height: 41,
//       width: double.infinity,
//       padding: EdgeInsets.all(1),
//       decoration: BoxDecoration(
//         color: Color(0xffDFFFBA),
//         borderRadius: BorderRadius.circular(4),
//       ),
//       child:Container(
//         decoration: BoxDecoration(
//           color: Color(0xff05021D),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         padding: EdgeInsets.symmetric(horizontal: 5),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             KQText(title,size: 19,color: Colors.white),
//             Container(
//               child: Row(
//                 children: <Widget>[
//                   KQText("$points",size: 16,color: Colors.white),
//                   SizedBox(width: 5),
//                   KQText("/20",size: 15,color: Color(0xff43FF00)),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // 添加广告 轮播
//   // Widget _buildAddWidget(){
//   //   return Row(
//   //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //     children: <Widget>[
//   //       _buildAddUrl('Video Advertisement',() => pickFile(false),),
//   //       _buildAddUrl('Banner Advertisement', () => pickFile(true)),
//   //     ],
//   //   );
//   // }

//   // Widget _buildAddUrl(String title,Function onPressed){
//   //   return GestureDetector(
//   //     onTap: onPressed,
//   //     child: Container(
//   //       width: 151,
//   //       height: 151,
//   //       padding: EdgeInsets.symmetric(vertical: 15),
//   //       decoration: BoxDecoration(
//   //         gradient: _gradientOne,
//   //         borderRadius: BorderRadius.circular(11)
//   //       ),
//   //       child: Column(
//   //         mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //         children: <Widget>[
//   //           KQText("+",color: Colors.white,size: 50),
//   //           KQText(title,color: Colors.white,size: 17,align: TextAlign.center,maxLines: 2),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//     // 添加 标题
//     Widget _buildAdTitle(){
//       return Container(
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//         child: TextField(
//           style:TextStyle(color: Colors.white,fontSize: 17),
//           decoration: InputDecoration(
//               enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//               hintText: 'Add title',
//               hintStyle: TextStyle(color: Color(0xffCCCCCC),fontSize: 17),
//           ),
//           onChanged: (text) => this.adTitle = text,
//         ),
//       );
//     }

//     // 添加 描述
//     Widget _buildAdDesc(){
//       return Container(
//         // width: double.infinity,
//         // height: 42,
//         padding: EdgeInsets.symmetric(vertical: 10, horizontal: 1),
//         child: TextField(
//           style:TextStyle(color: Colors.white,fontSize: 17),
//           maxLength: 200,
//           maxLines:3,
//           decoration: InputDecoration(
//               enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
//               hintText: 'Add description',
//               hintStyle: TextStyle(color: Color(0xffCCCCCC),fontSize: 17),
//               suffixText: '200',
//               suffixStyle: TextStyle(color: Color(0xffCCCCCC),fontSize: 13),
//           ),
//           onChanged: (text) => this.adDesc = text,
//         ),
//       );
//     }

//     // 类型 category
//     Widget categorywidget(){
//       return Container(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             KQText("Category",color: Colors.white,size: 17),
//             SizedBox(height: 11),
//             Container(
//               child: Wrap(
//                 runSpacing: 8,
//                 spacing: 8,
//                 children: sysCategoies.map((item){
//                   var index = sysCategoies.indexOf(item);
//                   return categoryElement(item,index);
//                 }).toList(),
//               ),
//             ),
//           ],
//         ),
//       );
//     }
  
//     // 类型 单个元素
//     Widget categoryElement(Category category,int index){
//       return GestureDetector(
//         onTap: (){
//           print(category.id);
//           currentCateIndex = index;
//           setState(() {
            
//           });
//         },
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: 9,vertical:6),
//           decoration:BoxDecoration(
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.white,width: 1),
//             color: currentCateIndex==index?Color(0xff897AFF):Color(0xff09052D)
//           ),
//           child: KQText(category.name,color: Colors.white,size:13),
//         ),
//       );
//     }

//   //用户 信息
//   // Widget _buildGender(){
//   //   return Container(
//   //     width: double.infinity,
//   //     padding: EdgeInsets.all(1),
//   //     decoration: BoxDecoration(
//   //       gradient: _gradientOne,
//   //       borderRadius: BorderRadius.circular(11)
//   //     ),
//   //     child: Container(
//   //       padding: EdgeInsets.fromLTRB(20, 18, 20, 17),
//   //       decoration: BoxDecoration(
//   //         color: Color(0xff05021D),
//   //         borderRadius: BorderRadius.circular(11)
//   //       ),
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: <Widget>[
//   //           KQText("User gender",color:Color(0xffBDCBFA),size: 13),
//   //           SizedBox(height: 4),
//   //           selecGenderWidget(),
//   //           selectAgeAndCity(),
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   //选择性别
//   // Widget selecGenderWidget(){
//   //   return Container(
//   //     child: Row(
//   //       children: genderlist.map((item){
//   //         var index = genderlist.indexOf(item);
//   //         return GestureDetector(
//   //           child: Container(
//   //             padding: EdgeInsets.only(top: 10,bottom: 20),
//   //             margin: EdgeInsets.only(right: 35),
//   //             child: Row(
//   //               children: <Widget>[
//   //                 Image.asset(_genderCurrenIndex==index?item['activeIcon']:item['icon'],width: 12,height: 12),
//   //                 SizedBox(width: 3),
//   //                 KQText(item['title'],color: Colors.white,size: 15)
//   //               ],
//   //             ),
//   //           ),
//   //           onTap: (){
//   //             this._genderCurrenIndex = index;
//   //             setState(() {});
//   //           },
//   //         );
//   //       }).toList(),
//   //     ),
//   //   );
//   // }
  
//   //年龄 城市选择
//   // Widget selectAgeAndCity(){
//   //   return Container(
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: <Widget>[
//   //         selectACWidget(87,'Age',age,widget:ageBetwwen(),onPressed:_selectAge),
//   //         selectACWidget(132,'City',citycode)
//   //       ],
//   //     ),
//   //   );
//   // }

//   //年龄
//   // Widget selectACWidget(double width,String title,String value,{Widget widget,Function onPressed}){
//   //   return GestureDetector(
//   //     onTap: onPressed,
//   //     child: Container(
//   //       child: Column(
//   //         crossAxisAlignment: CrossAxisAlignment.start,
//   //         children: <Widget>[
//   //           KQText(title,color: Color(0xffBDCBFA),size:13),
//   //           SizedBox(height: 11),
//   //           Container(
//   //             width: width,
//   //             padding: EdgeInsets.only(bottom: 5),
//   //             decoration: BoxDecoration(
//   //               border: Border(bottom: BorderSide(width: 1,color: Colors.white))
//   //             ),
//   //             child: Row(
//   //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               children: <Widget>[
//   //               title!='City'?KQText(value,color: Colors.white,size: 15):Container(
//   //                 width: 124,
//   //                 height: 23,
//   //                 child: TextField(
//   //                     style: TextStyle(letterSpacing: 2,color: Colors.white,fontSize: 15),
//   //                     decoration: InputDecoration(
//   //                         counterText: "",
//   //                         enabledBorder:InputBorder.none,
//   //                         border: InputBorder.none,
//   //                     ),
//   //                     onChanged: (str) {
//   //                         this.setState(() => this.citycode = str);
//   //                     },
//   //                     inputFormatters: [LengthLimitingTextInputFormatter(8)],
//   //                 ),
//   //               ),
//   //               title=='City'?Container():Image.asset("images/new_ui/down_icon.png",width: 10,height:5)
//   //               ],
//   //             ),
//   //           ),
//   //           title=='City'?Container():widget,
//   //           // widget==null??Container()
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }

//   // 年龄段
//   // Widget ageBetwwen() =>AnimatedCrossFade(
//   //   firstCurve: Curves.easeInCirc,
//   //   secondCurve: Curves.easeInToLinear,
//   //   firstChild: Container(),
//   //   secondChild:Container(
//   //     width: 87,
//   //     padding: EdgeInsets.symmetric(vertical: 1),
//   //     child: Column(
//   //       children:ageDuration.map((age){
//   //         return GestureDetector(
//   //           child: Container(
//   //             padding: EdgeInsets.symmetric(vertical: 8),
//   //             alignment: Alignment.center,
//   //             decoration: BoxDecoration(
//   //               color: Color(0xff09052D),
//   //               border: Border(bottom: BorderSide(width: 1,color: Color(0xffBDCBFA)))
//   //             ),
//   //             child: KQText(age,color: Colors.white,size: 15),
//   //           ),
//   //           onTap: (){
//   //             this.age = age;
//   //            _ageCrossFadeState = CrossFadeState.showFirst;
//   //             setState(() {});
//   //           },
//   //         );
//   //       }).toList(),
//   //     ),
//   //   ),
//   //    duration: Duration(milliseconds: 300),
//   //    crossFadeState: _ageCrossFadeState,
//   // );


//   // _selectAge() {
//   //   setState(() {
//   //     _ageCrossFadeState =
//   //         !ageIsFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond;
//   //   });
//   // }

//   // _selectPackage() {
//   //   setState(() {
//   //     _packageCrossFadeState =
//   //         !packageIsFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond;
//   //   });
//   // }

//   //  _selectBannerPackage() {
//   //   setState(() {
//   //     _bannerCrossFadeState =
//   //         !bannerIsFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond;
//   //   });
//   // }

//   //  _selectVideoPackage() {
//   //   setState(() {
//   //     _videoCrossFadeState =
//   //         !videoIsFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond;
//   //   });
//   // }
   
//    //选择 video 相关的东西
//   //  Widget _buildVideo(String title,Function onTap,String keyValue,Widget widget,{bool isShowSecond = true,bool isShowDays = false}){
//   //    return Container(
//   //       width: double.infinity,
//   //       padding: EdgeInsets.all(1),
//   //       decoration: BoxDecoration(
//   //         gradient: _gradientOne,
//   //         borderRadius: BorderRadius.circular(11)
//   //       ),
//   //       child: Container(
//   //         padding: EdgeInsets.only(bottom: 20),
//   //         decoration: BoxDecoration(
//   //           color: Color(0xff05021D),
//   //           borderRadius: BorderRadius.circular(11)
//   //         ),
//   //         child: Column(
//   //           crossAxisAlignment:CrossAxisAlignment.start,
//   //           children: <Widget>[
//   //             Container(
//   //               height: 30,
//   //               alignment: Alignment.center,
//   //               child: KQText(title,color: Color(0xff897AFF),size:13),
//   //             ),
//   //             packageNameWidget(onTap,isShowSecond,keyValue,widget,isShowDays),
//   //             SizedBox(height: 20),
//   //             isShowDays?videotimeAndpriceWidget():timeAndpriceWidget(),
//   //             SizedBox(height: 21),
//   //             paymethodWidget(),
//   //           ],
//   //         ),
//   //       ),
//   //    );
//   //  }
  
//   // select package name
//   // Widget packageNameWidget(Function onTap,bool isShowSecond,String keyValue,Widget widget,bool isShowDays){
//   //   return Container(
//   //     padding: EdgeInsets.only(left: 21,right: 7),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: <Widget>[
//   //         Container(
//   //           child: Column(
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: <Widget>[
//   //               KQText("Name",color: Color(0xffBDCBFA),size: 11),
//   //               SizedBox(height:7),
//   //               GestureDetector(
//   //                 onTap: onTap,
//   //                 child: Container(
//   //                   width: 179,
//   //                   padding: EdgeInsets.only(bottom: 5),
//   //                   decoration: BoxDecoration(
//   //                     border: Border(bottom: BorderSide(width: 1,color: Colors.white))
//   //                   ),
//   //                    child: Row(
//   //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                     children: <Widget>[
//   //                       KQText(keyValue,color: Colors.white,size: 15),
//   //                       Image.asset("images/new_ui/down_icon.png",width: 10,height:5)
//   //                     ],
//   //                   ),
//   //                 ),
//   //               ),
//   //               widget,
//   //             ],
//   //           ),
//   //         ),
//   //        isShowSecond?Container(
//   //           child: Column(
//   //             children: <Widget>[
//   //               KQText("Video Seconds",color: Color(0xffBDCBFA),size: 11),
//   //               SizedBox(height:7),
//   //               KQText("25",color: Colors.white,size: 13),
//   //             ],
//   //           ),
//   //         ):Container(),
//   //         isShowDays?Container(
//   //           child: Column(
//   //             children: <Widget>[
//   //               KQText("Display Days",color: Color(0xffBDCBFA),size: 11),
//   //               SizedBox(height:7),
//   //               Container(
//   //                 padding: EdgeInsets.only(bottom: 7),
//   //                 width: 50,
//   //                 alignment: Alignment.center,
//   //                 decoration: BoxDecoration(
//   //                   border: Border(bottom: BorderSide(width: 1,color: Colors.white))
//   //                 ),
//   //                 child: KQText("10",color: Colors.white,size: 13),
//   //               ),
//   //             ],
//   //           ),
//   //         ):Container(),
//   //       ],
//   //     ),
//   //   );
//   // }
  
//   // Widget selectPackage()=>AnimatedCrossFade(
//   //   firstCurve: Curves.easeInCirc,
//   //   secondCurve: Curves.easeInToLinear,
//   //   firstChild: Container(),
//   //   secondChild:Container(
//   //     width: 179,
//   //     padding: EdgeInsets.symmetric(vertical: 1),
//   //     child: Column(
//   //       children:cityDuration.map((city){
//   //         return GestureDetector(
//   //           child: Container(
//   //             padding: EdgeInsets.symmetric(vertical: 8),
//   //             alignment: Alignment.center,
//   //             decoration: BoxDecoration(
//   //               color: Color(0xff09052D),
//   //               border: Border(bottom: BorderSide(width: 1,color: Color(0xffBDCBFA)))
//   //             ),
//   //             child: KQText(city,color: Colors.white,size: 15),
//   //           ),
//   //           onTap: (){
//   //             this._package = city;
//   //             _packageCrossFadeState = CrossFadeState.showFirst;
//   //             setState(() {});
//   //           }
//   //         );
//   //       }).toList(),
//   //     ),
//   //   ),
//   //    duration: Duration(milliseconds: 300),
//   //    crossFadeState: _packageCrossFadeState,
//   // );

//   // Widget bannerPackage()=>AnimatedCrossFade(
//   //   firstCurve: Curves.easeInCirc,
//   //   secondCurve: Curves.easeInToLinear,
//   //   firstChild: Container(),
//   //   secondChild:Container(
//   //     width: 179,
//   //     padding: EdgeInsets.symmetric(vertical: 1),
//   //     child: Column(
//   //       children:cityDuration.map((city){
//   //         return GestureDetector(
//   //           child: Container(
//   //             padding: EdgeInsets.symmetric(vertical: 8),
//   //             alignment: Alignment.center,
//   //             decoration: BoxDecoration(
//   //               color: Color(0xff09052D),
//   //               border: Border(bottom: BorderSide(width: 1,color: Color(0xffBDCBFA)))
//   //             ),
//   //             child: KQText(city,color: Colors.white,size: 15),
//   //           ),
//   //           onTap: (){
//   //             this._bannerpackage = city;
//   //             _bannerCrossFadeState = CrossFadeState.showFirst;
//   //             setState(() {});
//   //           }
//   //         );
//   //       }).toList(),
//   //     ),
//   //   ),
//   //    duration: Duration(milliseconds: 300),
//   //    crossFadeState: _bannerCrossFadeState,
//   // );

//   // Widget videoPackage()=>AnimatedCrossFade(
//   //   firstCurve: Curves.easeInCirc,
//   //   secondCurve: Curves.easeInToLinear,
//   //   firstChild: Container(),
//   //   secondChild:Container(
//   //     width: 179,
//   //     padding: EdgeInsets.symmetric(vertical: 1),
//   //     child: Column(
//   //       children:cityDuration.map((city){
//   //         return GestureDetector(
//   //           child: Container(
//   //             padding: EdgeInsets.symmetric(vertical: 8),
//   //             alignment: Alignment.center,
//   //             decoration: BoxDecoration(
//   //               color: Color(0xff09052D),
//   //               border: Border(bottom: BorderSide(width: 1,color: Color(0xffBDCBFA)))
//   //             ),
//   //             child: KQText(city,color: Colors.white,size: 15),
//   //           ),
//   //           onTap: (){
//   //             this._videopackage = city;
//   //             _videoCrossFadeState = CrossFadeState.showFirst;
//   //             setState(() {});
//   //           }
//   //         );
//   //       }).toList(),
//   //     ),
//   //   ),
//   //    duration: Duration(milliseconds: 300),
//   //    crossFadeState: _videoCrossFadeState,
//   // );

//   // // day time price
//   // Widget timeAndpriceWidget(){
//   //   return Container(
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //       children: <Widget>[
//   //         commonCT('Display Days',20),
//   //         commonCT('Display Times',200),
//   //         commonCT('Unit Price',0.02),
//   //       ],
//   //     ),
//   //   );
//   // }

//   // Widget videotimeAndpriceWidget(){
//   //   return Container(
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceAround,
//   //       children: <Widget>[
//   //         commonCT('Display Times',20),
//   //         commonCT('Video Seconds',200),
//   //         commonCT('Unit Price',0.02),
//   //       ],
//   //     ),
//   //   );
//   // }

//   // Widget commonCT(String title,double value){
//   //   return Column(
//   //     children: <Widget>[
//   //       KQText(title,color: Color(0xffBDCBFA),size: 11),
//   //       SizedBox(height: 7),
//   //       KQText('$value',color: Colors.white,size: 13),
//   //     ],
//   //   );
//   // }

//   // Widget paymethodWidget(){
//   //    return Container(
//   //      padding: EdgeInsets.only(left: 21),
//   //      child: Column(
//   //        crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: <Widget>[
//   //         KQText("Payment method",color: Color(0xffBDCBFA),size: 11),
//   //         SizedBox(height: 7),
//   //         KQText('20 VP +10 Gold + 30 ShoppingVoucher',color: Colors.white,size: 13),
//   //       ],
//   //   ),
//   //    );
//   // }

//   Widget _buildSumbtn(String title,Function onPressed){
//     return GestureDetector(
//       onTap: onPressed,
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(horizontal: 82,vertical: 8),
//         margin: EdgeInsets.symmetric(horizontal: 14),
//         alignment: Alignment.center,
//         decoration: BoxDecoration(
//           gradient: _gradientOne,
//           borderRadius: BorderRadius.circular(6)
//         ),
//         child: KQText(title,color: Colors.white,size: 18),
//       ),
//     );
//   }
   
//     Widget container(Widget child, {double height, double width, EdgeInsetsGeometry padding = const EdgeInsets.only(left: 20, right: 20), DecorationImage image}) {
//         return Container(
//             height: height,
//             width: width,
//             margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
//             padding: padding,
//             decoration: BoxDecoration(
//                 color: Color(0xffF3F7FF),
//                 borderRadius: BorderRadius.circular(10),
//                 image: image
//             ),
//             child: child
//         );
//     }
// 	Future<void> pickFile(bool isImage) async {
//         if (isImage) {
//             file = await ImagePicker.pickImage(source: ImageSource.gallery);
//         } else {
//             file = await ImagePicker.pickVideo(source: ImageSource.gallery);
//         }
// 		if (file == null) return;
//         this.isImageFile = isImage;
//         setState(() {});
//     }

//   //   Widget _buildUploadType() {
//   //       return container(Row(
//   //               children: <Widget>[
//   //                   KQButtons.iconUpDown(
//   //                       icon: Image.asset(ImageAsset.video, width: 60,),
//   //                       label: KQText(FlutterI18n.translate(context, "postAds.uploadVideoAd"), size: 12, color: Color(0xdd231F80),),
//   //                       onPressed: () => pickFile(false),
//   //                   ),
//   //                   KQButtons.iconUpDown(
//   //                       icon: Image.asset(ImageAsset.banner, width: 60,),
//   //                       label: KQText(FlutterI18n.translate(context, "postAds.uploadBannerAd"), size: 12, color: Color(0xdd231F80),),
//   //                       onPressed: () => pickFile(true),
//   //                   ),
//   //               ],
//   //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //           ),
//   //           padding: EdgeInsets.only(top: 40, bottom: 40)
//   //       );  
//   //   }

//     Widget previewFileView() {
//         if (file == null) {
//             return Container();
//         }
//         return container(this.isImageFile ? Container() : KqVideo(file: this.file,),
//             image: DecorationImage(
//                 image: FileImage(this.file,),
//                 fit: BoxFit.cover
//             ),
//             width: double.infinity,
//             height: 200,
//         );
//     }

//     // Widget _buildTitle() {
//     //     return container(TextField(
//     //             decoration: InputDecoration(
//     //                 enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffE3E3E3))),
//     //                 labelText: FlutterI18n.translate(context, "postAds.adsTitle"),
//     //                 labelStyle: TextStyle(color: Color(0xdd231F80)),
//     //                 contentPadding: EdgeInsets.symmetric(vertical: 20)
//     //             ),
//     //             onChanged: (text) => this.adTitle = text,
//     //         ),
//     //         padding: EdgeInsets.only(bottom: 20, left: 15, right: 15),
//     //     );
//     // }

//   //   Widget _buildCategories() {
//   //       return container(ExpansionTile(
//   //               title: KQText(FlutterI18n.translate(context, "postAds.category"), color: Color(0xdd231F80),),
//   //               children: <Widget>[
//   //                   Wrap(
//   //                       children: sysCategoies.map((c) => _buildCategoryCheckbox(c)).toList(),
//   //                       crossAxisAlignment: WrapCrossAlignment.center,
//   //                   ),
//   //               ],
//   //           ),
//   //           padding: EdgeInsets.all(0)
//   //       );
//   //   }

//   //   Widget _buildCategoryCheckbox(Category category) {
//   //       bool isCheck = checkedCategories.indexOf(category.id) >= 0;
//   //       return InkWell(
//   //           child: Container(
//   //               child:  Row(
//   //                   children: <Widget>[
//   //                       KQText(category.name, color: Color(0xdd231F80)),
//   //                       Image.asset(isCheck ? ImageAsset.adsCategoryTick : ImageAsset.adsCategoryUntick, width: 25,),
//   //                   ],
//   //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //               ),
//   //               padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
//   //           ),
//   //           onTap: () {
//   //               isCheck ? checkedCategories.remove(category.id) : checkedCategories.add(category.id);
//   //               this.setState((){});    
//   //           },
//   //       );
//   //   }



//   //   Widget _buildDesc() {
//   //       return container(TextField(
//   //               maxLines: 3,
//   //               style: TextStyle(
//   //                   fontSize: 16,
//   //                   height: 1.5,
//   //               ),
//   //               maxLength: 200,
//   //               decoration: InputDecoration(
//   //                   enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffE3E3E3))),
//   //                   alignLabelWithHint: true,
//   //                   labelText: FlutterI18n.translate(context, "postAds.adsDescript"),
//   //                   labelStyle: TextStyle(color: Color(0xdd231F80), fontSize: 14)
//   //               ),
//   //               onChanged: (text) => this.adDesc = text,
//   //           ),
//   //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//   //       );
//   //   }
//   //   Widget _buildFee() {
//   //       return Row(
//   //           children: <Widget>[
//   //               Column(
//   //                   children: <Widget>[
//   //                       KQText(FlutterI18n.translate(context, "postAds.adsfee"), color: Color(0xdd231F80), size: 12),
//   //                       SizedBox(height: 15,),
//   //                       KQText('${SysCfgService.curConfig?.getUploadAdFee(this.isImageFile ? 0 : 1) ?? '100' }', color: Color(0xff1D6BF2), size: 20, fontWeight: FontWeight.w700,),
//   //                       SizedBox(height: 15,),
//   //                       KQText('View Point', color: Color(0xff1D6BF2), size: 12, fontWeight: FontWeight.w700),
//   //                   ],
//   //               ),
//   //               Line(height: 120, width: 1,),
//   //               Column(
//   //                   children: <Widget>[
//   //                       KQText('${this.selfWalletInfo?.viewPointNum ?? 0}', color: Color(0xdd44197E), size: 20, fontWeight: FontWeight.w700,),
//   //                       SizedBox(height: 5,),
//   //                       KQText(FlutterI18n.translate(context, "postAds.yrVP"), color: Color(0xdd231F80), size: 12,),
//   //                       SizedBox(height: 5,),
//   //                       KQButtons.submitBtn(FlutterI18n.translate(context, 'ads.Submit'), clickSubmit, width: 100, fontSize: 16, height: 35),
//   //                   ],
//   //               )
//   //           ],
//   //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   //       );
//   //   }

//   //   Future<void> clickSubmit() async{
//   //       if (this.adTitle.length == 0) {
//   //           KqToast('Please fill in the Title!');
//   //           return;
//   //       }
//   //       if (this.adDesc.length == 0) {
//   //           KqToast('Please fill in the Description!');
//   //           return;
//   //       }
//   //       if (!UserService.isLogined) {
//   //           UserService.checkLoginStatus(context);
//   //           return;
//   //       }
//   //       String fee = SysCfgService.curConfig?.getUploadAdFee(this.isImageFile ? 0 : 1);
//   //       if ((selfWalletInfo?.viewPointNum ?? 0) < num.parse(fee)) {
//   //           KqToast('Balance Insufficient');
//   //           return;
//   //       }
//   //       if (checkedCategories.length == 0) {
//   //           KqToast('Please select at least one category');
//   //           return;
//   //       }
//   //       if (file == null) {
//   //           return;
//   //       }
//   //       KQAlert.loadding(context);
//   //       String adUrl = await UploadService.upload(file.path, isVideo: !isImageFile).catchError((err) => err.message);
//   //       if (adUrl.length < 10) {
//   //           // 关闭loading框框
//   //           Navigator.pop(context);
//   //           /// 上传错误时   adurl为错误描述
//   //           KqToast(adUrl);
//   //           return;
//   //       }
//   //       Http.uploadAd(this.adTitle, this.adDesc, adUrl, this.isImageFile ? 1 : 2, checkedCategories)
//   //           .listen((res) {
//   //               KqToast('Post Ads Successfully');
//   //               // 关闭loading框框 并推出上传界面
//   //               Navigator.pop(context);
//   //               Navigator.pop(context);
//   //           }, onError: (err) {
//   //               KqToast(err.message);
//   //               // 关闭loading框框
//   //               Navigator.pop(context);
//   //           });
//   //   }
// }
