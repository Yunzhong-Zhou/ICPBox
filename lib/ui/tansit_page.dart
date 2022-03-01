import 'dart:async';
import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/widgets/my_bottomnavigation.dart';

import 'root_page.dart';

///启动页
class TansitPage extends StatefulWidget {
  const TansitPage({Key? key}) : super(key: key);

  @override
  _TansitPageState createState() => _TansitPageState();
}

class _TansitPageState extends State<TansitPage> {
  Timer? _timer;
  int _down = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //倒计时 -
    _timer = Timer.periodic(
      const Duration(milliseconds: 1000), //毫秒
      (timer) {
        setState(() {
          _down--;
        });
        if (_down <= 0) {
          _jumpRootPage();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //层叠布局
      body: Stack(
        children: [
          Image.asset(
            "imgs/bg_launch1.png",
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width, // 屏幕宽度,
            height: MediaQuery.of(context).size.height, // 屏幕高度,
            // width: double.infinity,
            // height: double.infinity,
          ),

          /*Positioned(
            top: MediaQuery.of(context).padding.top + 10, //状态栏高度
            right: 10,
            child: InkWell(
              child: _countdown(),
              onTap: _jumpRootPage,
            ),
          ),*/
        ],
      ),
    );
  }

  //倒计时跳过
  Widget _countdown() {
    //圆角布局
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black.withOpacity(0.5), //加透明度
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S().jumpover,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
            Text(
              "${_down}s",
              style: const TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //跳转首页
  void _jumpRootPage() {
    //取消计时器
    _timer?.cancel();
    //跳转到起始页并关闭所有页面
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return MyBottomNavigation();
    }), (route) => false);
    // Navigator.of(context).pushNamedAndRemoveUntil("root", (route) => false);
  }
}
