import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:package_info/package_info.dart';

///默认静态页面  优先使用
class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutPage();
}

class _AboutPage extends State<AboutPage> {
  String? version;

  @override
  void initState() {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).mine6,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "imgs/ic_launcher.png",
              width: 70,
              height: 70,
            ),
            Text(S.of(context).appName,
                style: TextStyle(fontSize: 20, color: Color(0xFF2B2B2B))),
            Text("v$version",
                style: TextStyle(fontSize: 14, color: Color(0xFF5E6A71))),
            Row(
              children: [
                Text(S.of(context).mine13,
                    style: TextStyle(fontSize: 12, color: Color(0xFF4D4D4D))),
                //圆形
                Container(
                    width: 6,
                    height: 6,
                    // alignment: Alignment.topCenter,
                    decoration: BoxDecoration(
                      color: Color(0xFFFF0000),
                      shape: BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
                    )),
                Spacer(), //使用Spacer填充尽可能大的空间
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)
              ],
            ),
            //分割线
            Divider(
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            Row(
              children: [
                Text(S.of(context).mine14,
                    style: TextStyle(fontSize: 12, color: Color(0xFF4D4D4D))),
                Spacer(), //使用Spacer填充尽可能大的空间
                Image.asset("imgs/ic_next_gray.png", width: 12, height: 12)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
