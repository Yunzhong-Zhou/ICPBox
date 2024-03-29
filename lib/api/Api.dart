class Api {
  ///测试地址
  static const String BASEURL = "https://api.icpbox.org";

  ///正式地址
//   static const String BASEURL = "https://api.icpbox.org";

  static const String PROJECT_NAME = "";

  static const String API = "/api/";

  ///headrs验证信息
  static const String APIKEY =
      "773EDB6D2715FACF9C93354CAC5B1A3372872DC4D5AC085867C7490E9984D33E";
  static const String HVERSION = "1.0";

  //更新
  static const String Upgrade = "article/sys-upgrade";
  //信息说明
  static const String INFO = API +"index/remark";

  /// ********************************钱包**************************************
  static const String WALLET = API + "index/index";

  /// ********************************DAPP**************************************
  static const String DAPP = API + "dapp/index";

  /// ********************************资讯**************************************
  static const String INFORMATION1 = API + "articleFast/index";
  static const String INFORMATION1_DETAIL = API + "articleFast/detail";

  static const String INFORMATION2 = API + "article/index";
  static const String INFORMATION2_DETAIL = API + "article/detail";


  /// ********************************我的**************************************
  static const String MINE = API + "index/center";

  //通知
  static const String NOTICE = API + "notice/index";
  static const String NOTICE_DETAIL = API + "notice/detail";
  //帮助中心
  static const String HELP = API + "help/index";
  static const String HELP_DETAIL = API + "help/detail";

}
