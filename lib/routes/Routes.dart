import 'package:flutter/material.dart';
import 'package:icpbox/ui/dapp/publish_dapp.dart';
import 'package:icpbox/ui/dapp/search.dart';
import 'package:icpbox/ui/mine/about.dart';
import 'package:icpbox/ui/mine/address.dart';
import 'package:icpbox/ui/mine/notice.dart';
import 'package:icpbox/ui/wallet/addwallet.dart';
import 'package:icpbox/ui/wallet/agreement.dart';
import 'package:icpbox/widgets/bottomnavigation.dart';

///路由
Map<String, WidgetBuilder> routes = {
  "/": (BuildContext content) => BottomNavigationWidget(), //主页

  ///钱包
  "AddWallet": (BuildContext content) => AddWalletPage(), //创建钱包
  "Agreement": (BuildContext content) => AgreementPage(), //协议

  ///DAPP
  "Search": (BuildContext content) => SearchPage(), //搜索
  "PublshDapp": (BuildContext content) => PublshDappPage(), //发布

  ///资讯

  /// 我的
  "Address": (BuildContext content) => AddressPage(), //地址薄
  "Notice": (BuildContext content) => NoticePage(), //通知公告
  "About": (BuildContext content) => AboutPage(), //关于我们
  "search": (BuildContext content) => SearchPage(), //搜索
  "search": (BuildContext content) => SearchPage(), //搜索
};
