import 'package:flutter/material.dart';
import 'package:icpbox/ui/Information/information_detail_page.dart';
import 'package:icpbox/ui/dapp/publish_dapp_page.dart';
import 'package:icpbox/ui/dapp/search_page.dart';
import 'package:icpbox/ui/mine/about_page.dart';
import 'package:icpbox/ui/mine/address_page.dart';
import 'package:icpbox/ui/mine/notice_page.dart';
import 'package:icpbox/ui/mine/share_page.dart';
import 'package:icpbox/ui/root_page.dart';
import 'package:icpbox/ui/tansit_page.dart';
import 'package:icpbox/ui/wallet/addwallet.dart';
import 'package:icpbox/ui/wallet/agreement.dart';
import 'package:icpbox/ui/webview_page.dart';
import 'package:icpbox/widgets/my_bottomnavigation.dart';

///路由
Map<String, WidgetBuilder> routes = {
  // "/": (BuildContext content) => BottomNavigationWidget(),
  // "/": (BuildContext content) => TansitPage(), //启动页
  // "/": (BuildContext content) => RootPage(), //主页
  "WebView": (BuildContext content) => WebViewPage(), //WebView

  ///钱包
  "AddWallet": (BuildContext content) => AddWalletPage(), //创建钱包
  "Agreement": (BuildContext content) => AgreementPage(), //协议

  ///DAPP
  "Search": (BuildContext content) => SearchPage(), //搜索
  "PublshDapp": (BuildContext content) => PublshDappPage(), //发布

  ///资讯
  // "InformationDetail": (BuildContext content) => InformationDetailPage(id: '',), //搜索

  /// 我的
  "Address": (BuildContext content) => AddressPage(), //地址薄
  "Share": (BuildContext content) => SharePage(), //分享
  "About": (BuildContext content) => AboutPage(), //关于我们
  "search": (BuildContext content) => SearchPage(), //搜索
  "search": (BuildContext content) => SearchPage(), //搜索
};
