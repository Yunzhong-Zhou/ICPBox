import 'package:flutter/cupertino.dart';

///应用数据管理
class AppDataProvider extends ChangeNotifier {
  ///数据条数
  String _Count = "10";

  get Count => _Count;

  ///token
  String _Token = "";

  get Token => _Token;

  void setToken(string) {
    _Token = string;
    notifyListeners(); //通知更新
  }

  ///货币
  String _HuoBi = "USD";

  get HuoBi => _HuoBi;

  void setHuoBi(string) {
    _HuoBi = string;
    notifyListeners(); //通知更新
  }

  ///语言（1.中文2.英文3.西班牙4.日文5.俄语）
  String _Language = "1";

  get Language => _Language;

  void setLanguage(string) {
    _Language = string;
    notifyListeners(); //通知更新
  }
  ///语言（1.简体中文，2、English，3、西班牙，4、にほんこく，5、Россия）
  String _LanguageName = "简体中文";

  get LanguageName => _LanguageName;

  void setLanguageName(string) {
    _LanguageName = string;
    notifyListeners(); //通知更新
  }
}
