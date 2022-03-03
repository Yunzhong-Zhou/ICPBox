
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/main.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/request/http_utils.dart';
import 'package:provider/provider.dart';

class DappService{
  Future getDappList() async {
    var response = await HttpUtils.get(Api.DAPP, params: {
    });
    // Map<String, dynamic> resut = response;
    Map<String, dynamic> resut = response['data'];
    return resut;
  }

}