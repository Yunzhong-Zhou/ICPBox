import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/api/Api.dart';

import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/request/http_utils.dart';
import 'package:icpbox/routes/routes.dart';
import 'package:icpbox/ui/root_page.dart';
import 'package:icpbox/ui/tansit_page.dart';
import 'package:icpbox/viewmodel/MVVMDemoViewModel.dart';
import 'package:lifecycle_lite/life_navigator_observer.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/myapp_theme.dart';
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
  late SharedPreferences _prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //初始化网络请求
    HttpUtils.init(baseUrl: Api.BASEURL);
    //获取语言
    getLanguage();
  }

  //获取语言
  void getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? language = prefs.getInt("language");
    String? languageName = prefs.getString("languageName");
    print("保存的值：$language:$languageName");
    if (language != null) {
      setState(() {
        Provider.of<AppDataProvider>(context, listen: false)
            .setLanguage(language.toString());
        Provider.of<AppDataProvider>(context, listen: false)
            .setLanguageName(languageName);
        ///语言（1.中文2.英文3.西班牙4.日文5.俄语）
        switch (Provider.of<AppDataProvider>(context, listen: false).Language) {
          case "1":
            Provider.of<CurrentLocale>(context, listen: false)
                .setLocale(const Locale('zh', "CH"));
            break;
          case "2":
            Provider.of<CurrentLocale>(context, listen: false)
                .setLocale(const Locale('en', "US"));
            break;
          case "3":
            Provider.of<CurrentLocale>(context, listen: false)
                .setLocale(const Locale('es', "ES"));
            break;
          case "4":
            Provider.of<CurrentLocale>(context, listen: false)
                .setLocale(const Locale('ja', "JP"));
            break;
          case "5":
            Provider.of<CurrentLocale>(context, listen: false)
                .setLocale(const Locale('ru', "RU"));
            break;
        }
      });
    }
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
            const Locale('es', 'ES'),
            const Locale('ja', 'JP'),
            const Locale('ru', 'RU'),
            ...S.delegate.supportedLocales
          ],
          //主题色
          theme: MyAppTheme,

          title: 'ICPBox',
          //路由
          routes: routes,
          //主页
          home: TansitPage(),

          //弹窗
          builder: EasyLoading.init(),
          //page生命周期
          navigatorObservers: [
            LifeNavigatorObserver(),
          ],
        );
      },
    );
  }
}
