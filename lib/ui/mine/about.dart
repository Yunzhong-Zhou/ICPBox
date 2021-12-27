import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:package_info/package_info.dart';

///关于我们
class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPage();
}
String version = "1.0.0";
class _AboutPage extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          color: Colors.black,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          S.of(context).mine6,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        //去掉阴影效果
        elevation: 0.0,
        //文字标题居中
        centerTitle: true,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 12),
              child: Image.asset(
                "imgs/ic_launcher.png",
                width: 80,
                height: 80,
              ),
            ),
            Text(S.of(context).appName,
                style: TextStyle(fontSize: 20, color: Color(0xFF2B2B2B))),
            Container(
              margin: EdgeInsets.only(top: 7, bottom: 20),
              child: Text("v${version}",
                  style: TextStyle(fontSize: 14, color: Color(0xFF5E6A71))),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
              child: Row(
                children: [
                  Text(S.of(context).mine13,
                      style: TextStyle(fontSize: 12, color: Color(0xFF4D4D4D))),
                  //圆形
                  Container(
                      width: 6,
                      height: 6,
                      margin: EdgeInsets.only(left: 4),
                      // alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF0000),
                        shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
                      )),
                  Spacer(), //使用Spacer填充尽可能大的空间
                  Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)
                ],
              ),
            ),
            //分割线
            Divider(
              //缩进
              indent: 20.0,
              endIndent: 20.0,
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            Container(
                padding: EdgeInsets.fromLTRB(20, 16, 20, 16),
                child: Row(
                  children: [
                    Text(S.of(context).mine14,
                        style:
                            TextStyle(fontSize: 12, color: Color(0xFF4D4D4D))),
                    Spacer(), //使用Spacer填充尽可能大的空间
                    Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)
                  ],
                )),
            //填充组件
            Expanded(child: Container(color: Color(0xFFF6F6F6),))
          ],
        ),
      ),
    );
  }
}

/// 获取APP信息
void getAppInfo(){
  //同步
  PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      //APP名称
      // String appName = packageInfo.appName;
      //包名
      // String packageName = packageInfo.packageName;
      //版本名
     version = packageInfo.version;
      //版本号
      // String buildNumber = packageInfo.buildNumber;
    });
  //异步
  // PackageInfo packageInfo = await PackageInfo.fromPlatform();
  // String appName = packageInfo.appName;
  // String packageName = packageInfo.packageName;
  // version = packageInfo.version;
  // String buildNumber = packageInfo.buildNumber;
}
