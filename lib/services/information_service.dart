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
    });
    Map<String, dynamic> resut = response["data"];
    return resut;
  }

  Future getDetail({required String url,required String id}) async {
    var response = await HttpUtils.get(url, params: {
      "id": id,
    });
    Map<String, dynamic> resut = response["data"];
    return resut;
  }

  Future getNoticeList({required String url,int page = 1}) async {
    var response = await HttpUtils.get(url, params: {
      "page": page,
      "count": Provider.of<AppDataProvider>(navigatorKey.currentState!.context,
          listen: false)
          .Count,
    });
    Map<String, dynamic> resut = response["data"];
    return resut;
  }
  Future getNoticeDetail({required String id}) async {
    var response = await HttpUtils.get(Api.NOTICE_DETAIL, params: {
      "id": id,
    });
    Map<String, dynamic> resut = response["data"];
    return resut;
  }
}
