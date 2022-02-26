import 'package:icpbox/api/Api.dart';
import 'package:icpbox/main.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/request/http_utils.dart';
import 'package:provider/provider.dart';

class InformationService {
  Future getInformation1List({int page = 1}) async {
    var response = await HttpUtils.get(Api.INFORMATION1, params: {
      "page": page,
      "count": Provider.of<AppDataProvider>(navigatorKey.currentState!.context,
          listen: false)
          .Count,
      "lang": Provider.of<AppDataProvider>(navigatorKey.currentState!.context,
          listen: false)
          .Language,
    });
    // Map<String, dynamic> resut = response;
    Map<String, dynamic> resut = response['data'];
    return resut;
  }
  Future getInformation2List({int page = 1}) async {
    var response = await HttpUtils.get(Api.INFORMATION2, params: {
      "page": page,
      "count": Provider.of<AppDataProvider>(navigatorKey.currentState!.context,
              listen: false)
          .Count,
      "lang": Provider.of<AppDataProvider>(navigatorKey.currentState!.context,
              listen: false)
          .Language,
    });
    Map<String, dynamic> resut = response["data"];
    return resut;
  }
  Future getNoticeList({int page = 1}) async {
    var response = await HttpUtils.get(Api.NOTICE, params: {
      "page": page,
      "count": Provider.of<AppDataProvider>(navigatorKey.currentState!.context,
          listen: false)
          .Count,
      "lang": Provider.of<AppDataProvider>(navigatorKey.currentState!.context,
          listen: false)
          .Language,
    });
    Map<String, dynamic> resut = response["data"];
    return resut;
  }
}
