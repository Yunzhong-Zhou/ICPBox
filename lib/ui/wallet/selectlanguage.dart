import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/utils/CurrentLocale.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

///选择语言
class SelectLanguage extends StatefulWidget {
  SelectLanguage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectLanguage();
}

class _SelectLanguage extends State<SelectLanguage> {
  final List _list_yuyan = ["Россия", "にほんこく", "España", "English", "简体中文"];
  final List _list_yuyanicon = [
    "imgs/elosi.png",
    "imgs/jp.png",
    "imgs/esp.png",
    "imgs/usa.png",
    "imgs/china.png"
  ];
  int _select_yuyan = 4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ///语言（1.中文2.英文3.西班牙4.日文5.俄语）
    switch (Provider.of<AppDataProvider>(context, listen: false).Language) {
      case "1":
        _select_yuyan = 4;
        break;
      case "2":
        _select_yuyan = 3;
        break;
      case "3":
        _select_yuyan = 2;
        break;
      case "4":
        _select_yuyan = 1;
        break;
      case "5":
        _select_yuyan = 0;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // height: 310,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListView.builder(
                //取消滑动
                // physics: NeverScrollableScrollPhysics(),
                //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
                primary: true,
                //内容适配
                shrinkWrap: true,
                //item 数量
                itemCount: _list_yuyan.length,
                itemBuilder: (context, index) {
                   return _Item(index);
                }),
            const Divider(
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  S().cancel,
                  style:
                      const TextStyle(fontSize: 16, color: Color(0xFF4F4F4F)),
                ),
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ));
  }
  Widget _Item(int index){
    return ListTile(
      onTap: () {
        //保存语言名
        Provider.of<AppDataProvider>(context, listen: false)
            .setLanguageName(
            _list_yuyan[index]);
        setState(() {
          _select_yuyan = index;
          ///语言（1.中文2.英文3.西班牙4.日文5.俄语）
          switch (_select_yuyan) {
            case 0:
            //俄语
              saveLanguage(5, _list_yuyan[index]);
              Provider.of<AppDataProvider>(context, listen: false)
                  .setLanguage("5");
              Provider.of<CurrentLocale>(context, listen: false)
                  .setLocale(const Locale('ru', "RU"));
              break;
            case 1:
            //日文
              saveLanguage(4, _list_yuyan[index]);
              Provider.of<AppDataProvider>(context, listen: false)
                  .setLanguage("4");
              Provider.of<CurrentLocale>(context, listen: false)
                  .setLocale(const Locale('ja', "JP"));
              break;
            case 2:
            //西班牙
              saveLanguage(3, _list_yuyan[index]);
              Provider.of<AppDataProvider>(context, listen: false)
                  .setLanguage("3");

              Provider.of<CurrentLocale>(context, listen: false)
                  .setLocale(const Locale('es', "ES"));
              break;
            case 3:
            //英文
              saveLanguage(2, _list_yuyan[index]);
              Provider.of<AppDataProvider>(context, listen: false)
                  .setLanguage("2");
              Provider.of<CurrentLocale>(context, listen: false)
                  .setLocale(const Locale('en', "US"));
              break;
            case 4:
            //中文
              saveLanguage(1, _list_yuyan[index]);
              Provider.of<AppDataProvider>(context, listen: false)
                  .setLanguage("1");
              Provider.of<CurrentLocale>(context, listen: false)
                  .setLocale(const Locale('zh', "CH"));
              break;
          }
        });
        print("选择的语言："+Provider.of<AppDataProvider>(context, listen: false).LanguageName);
        Navigator.of(context).pop(index);
      },
      leading: Image.asset(_list_yuyanicon[index],
          width: 30, height: 30),
      title: Text(_list_yuyan[index],
          style: const TextStyle(
              color: Color(0xFF687177), fontSize: 16.0)),
      //紧凑程度 -4 ~ 4
      visualDensity: const VisualDensity(horizontal: -4.0),
      trailing: Image.asset(
          _select_yuyan == index
              ? "imgs/ic_xuanzhong.png"
              : "imgs/ic_weixuan.png",
          width: 24,
          height: 24),

    );
  }
}


///保存语言
void saveLanguage(int language, String languageName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt("language", language);
  prefs.setString("languageName", languageName);
}
