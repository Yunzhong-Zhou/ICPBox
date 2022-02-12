class Api {
  ///测试地址
  static const String HOST = "http://icpbox.fbixfbi.com";

  ///正式地址
//   static const String HOST = "http://icpbox.fbixfbi.com";

  static const String PROJECT_NAME = "";

  static const String API = "/api/";

  ///headrs验证信息
  static const String APIKEY =
      "773EDB6D2715FACF9C93354CAC5B1A3372872DC4D5AC085867C7490E9984D33E";
  static const String HVERSION = "1.0";

  //更新
   static const String Upgrade = HOST + "article/sys-upgrade";

  /// ********************************钱包**************************************
  static const String WALLET = HOST + API  + "index/index";

  /// ********************************DAPP**************************************
  static const String DAPP = HOST + API  + "dapp/index";

  /// ********************************资讯**************************************
  static const String INFORMATION = HOST + API  + "articleFast/index";

  /// ********************************我的**************************************
  static const String MINE = HOST + API + "index/center";
  //通知
  static const String NOTICE = HOST + API + "notice/index";

}
