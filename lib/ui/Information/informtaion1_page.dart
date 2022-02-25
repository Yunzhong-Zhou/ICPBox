import 'package:flutter/material.dart';
import 'package:icpbox/model/information1_model.dart';
import 'package:icpbox/model/information_model.dart';
import 'package:icpbox/services/information_service.dart';

///资讯
class InforMation1Page extends StatefulWidget {
  const InforMation1Page({Key? key}) : super(key: key);

  @override
  _InforMation1PageState createState() => _InforMation1PageState();
}

class _InforMation1PageState extends State<InforMation1Page> {
  int _page = 1;

  // List<InformationItem> _list = InformationList([]).list;
  List<Information1List> _list = [];
  bool hasMore = true;

  bool err = false;
  String errMsg = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //数据请求
    _getDataList();
  }

  //数据请求
  Future _getDataList({bool push = false}) async {
    try {
      //获取接口数据
      Map<String, dynamic> resut =
          await InformationService().getInformation1List(page: _page);

      List<Information1List> list1 = [];
      resut.forEach((key, value) {
        print("取值key：${key}");
        print("取值value：${value}");
//获取data里面的值，并转为实体
        InformationList listModel = InformationList.fromJson(value);
        list1.add(Information1List(time: key,itmelist: listModel));
      });
       print("列表：${list1.length}");


      //更新页面数据
      setState(() {
        //是否有更多数据
        hasMore = list1.isNotEmpty;
        //页码+1
        _page++;
        //如果为更多数据
        if (push) {
          _list.addAll(list1);
        } else {
          _list = list1;
        }
      });
    } catch (e) {
      setState(() {
        err = true;
        errMsg = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
      primary: true,
      //内容适配
      shrinkWrap: true,
      //item 数量
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.fromLTRB(24, 6, 15, 6),
          color: Colors.white,
          margin: const EdgeInsets.only(top: 1, bottom: 9),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //圆角图片
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  _list[index].cover,
                  width: 96,
                  height: 80,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 151, // 屏幕宽度
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 7),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_list[index].title,
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF4A4A4A)),
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis),
                    Container(
                      width: MediaQuery.of(context).size.width - 151, // 屏幕宽度
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _list[index].keywords,
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xFFCACACA)),
                          ),
                          Text(
                            _list[index].createdAt,
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xFFCACACA)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
