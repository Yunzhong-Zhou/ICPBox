import 'package:flutter/material.dart';

///切换语言
class CurrentLocale with ChangeNotifier {
  Locale _locale = const Locale('zh','CN');

  Locale get value => _locale;
  void setLocale(locale)
  {
    _locale = locale;
    notifyListeners();
  }
}