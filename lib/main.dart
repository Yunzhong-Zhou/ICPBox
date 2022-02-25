import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/api/Api.dart';

import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/request/http_utils.dart';
import 'package:icpbox/routes/Routes.dart';
import 'package:icpbox/viewmodel/MVVMDemoViewModel.dart';
import 'package:provider/provider.dart';

import 'config/myapp_theme.dart';
import 'ui/Information/information.dart';
import 'ui/dapp/dapp.dart';
import 'ui/mine/mine.dart';
import 'ui/wallet/wallet.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'utils/CurrentLocale.dart';

///程序入口
void main() {
  //跨组件数据共享-使用 Provider.of<AppDataProvider>(context).Token;
  runApp(MultiProvider(
    providers: [
      //多语言
      ChangeNotifierProvider(create: (context) => CurrentLocale()),
      //应用数据
      ChangeNotifierProvider(create: (context) => AppDataProvider()),
      //MVVM
      ChangeNotifierProvider(create: (context) => MVVMDemoViewModel()),
    ],
    child: MyApp(),
  ));
  if (Platform.isAndroid) {
    SystemUiOverlayStyle style = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,

        ///这是设置状态栏的图标和字体的颜色
        ///Brightness.light  一般都是显示为白色
        ///Brightness.dark 一般都是显示为黑色
        statusBarIconBrightness: Brightness.dark);
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  //单页设置
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HttpUtils.init(baseUrl: Api.BASEURL);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CurrentLocale>(
      builder: (context, currentLocale, child) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          //调试是否显示debug
          debugShowCheckedModeBanner: false,
          //多语言
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            S.delegate
          ],
          locale: currentLocale.value,
          supportedLocales: [
            const Locale('zh', 'CN'),
            const Locale('en', 'US'),
            ...S.delegate.supportedLocales
          ],
          //主题色
          theme: MyAppTheme,

          title: 'ICPBox',
          //路由
          routes: routes,
          // home: BottomNavigationWidget(),

          builder: EasyLoading.init(),
        );
      },
    );
  }
}
