import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:learning_way/constant/constant.dart';
import 'package:learning_way/i18n/chinese_cupertino_localizations.dart';
import 'package:learning_way/pages/function/banner_lunbo.dart';
import 'package:learning_way/pages/function/bar_chart_page.dart';
import 'package:learning_way/pages/function/clock_screen.dart';
import 'package:learning_way/pages/function/draw_demo_page.dart';
import 'package:learning_way/pages/function/flip_card_demo_page.dart';
import 'package:learning_way/pages/function/future_builder.dart';
import 'package:learning_way/pages/function/goodsCar_animation.dart';
import 'package:learning_way/pages/function/header_demo_page.dart';
import 'package:learning_way/pages/function/stickyDemo.dart';
import 'package:learning_way/pages/function/toast_demo_page.dart';
import 'package:learning_way/pages/home/home_bar.dart';
import 'package:learning_way/pages/launch.dart';
import 'package:learning_way/pages/login/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotToastInit(
      //初始化botToast  .使用BotToastInit直接包裹MaterialApp 直接在app根入口观察路由，自动管理当前的context，后续调用时无需再关心context，可以在任意地方调用
      child: MaterialApp(
        title: '学习之路',
        navigatorObservers: [BotToastNavigatorObserver()],
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Constant.primaryColor,
          backgroundColor: Constant.backgroundColor,
        ),
        locale: const Locale('zh', 'CN'),
        supportedLocales: [
          const Locale('en', 'US'), // 美国英语
          const Locale('zh', 'CN'), // 中文简体
        ],
         localizationsDelegates: [
          ChineseCupertinoLocalizations.delegate, // 这里加上这个,是自定义的delegate
          // 注册我们的Delegate
          // RefreshLocalizations.delegate,
          // 本地化的代理类
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          return locale;
        },
        home: Launch(),
        routes: <String, WidgetBuilder>{
          'home': (BuildContext context) => HomeBar(),
          'login': (BuildContext context) => LoginPage(),
          'fun/futureBuilder': (BuildContext context) => FutureBuilderPoint(),
          'fun/goodsCarAnimation': (BuildContext context) => GoodsCarAnimation(),
          'fun/barChart': (BuildContext context) => BarChartPage(),
          'fun/drawDemo': (BuildContext context) => DrawDemoPage(),
          'fun/toastDemo': (BuildContext context) => ToastDemoPage(),
          'fun/swiper': (BuildContext context) => BannerLunBoPage(),
          'fun/Header': (BuildContext context) => HeaderDemoPage(),
          'fun/flipCard': (BuildContext context) => FilpCardDemoPage(),
          'fun/clockscreen': (BuildContext context) => ClockScreen(),
          'fun/sliver': (BuildContext context) => StickyDemo(),
        },
      ),
    );
  }
}
