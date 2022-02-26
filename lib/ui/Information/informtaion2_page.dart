import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:icpbox/model/information_model.dart';
import 'package:icpbox/services/information_service.dart';
import 'package:provider/provider.dart';

//文章
class InforMation2Page extends StatefulWidget {
  const InforMation2Page({Key? key}) : super(key: key);

  @override
  _InforMation2PageState createState() => _InforMation2PageState();
}

class _InforMation2PageState extends State<InforMation2Page> {
  late EasyRefreshController _easyRefreshController;

  int _page = 1;

  // List<InformationItem> _list = InformationList([]).list;
  List<InformationItem> _list = [];
  bool hasMore = true;

  bool err = false;
  String errMsg = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = EasyRefreshController();
    //数据请求
    _getDataList();
  }

  //数据请求
  Future _getDataList({bool push = false}) async {
    try {
      //获取接口数据
      Map<String, dynamic> resut =
          await InformationService().getInformation2List(page: _page);

      //将数据转为实体
      InformationList listModel = InformationList.fromJson(resut["list"]);
      //更新页面数据
      setState(() {
        //是否有更多数据
        hasMore = listModel.list.isNotEmpty;
        //如果为更多数据
        if (push) {
          _list.addAll(listModel.list);
        } else {
          _list = listModel.list;
        }
      });
    } catch (e) {
      setState(() {
        err = true;
        errMsg = e.toString();
      });
    }
  }

  //下拉刷新
  Future _onRefresh() async {
    _page = 1;
    await _getDataList();
    //重置刷新状态
    _easyRefreshController.resetLoadState();
  }

  //上拉加载更多
  Future _onLoad() async {
    if (hasMore){
      //页码+1
      _page++;
      await _getDataList(push: true);
    }
    //完成加载更多
    _easyRefreshController.finishLoad(noMore: !hasMore);
  }

  @override
  Widget build(BuildContext context) {
    return EasyRefresh(
      controller: _easyRefreshController,
      //刷新回调
      onRefresh: _onRefresh,
      //加载回调
      onLoad: _onLoad,
      //头部刷新布局
      header: ClassicalHeader(),
      //底部加载更多布局
      footer: ClassicalFooter(),

      child: ListView.builder(
        //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
        primary: true,
        //内容适配
        shrinkWrap: true,
        //item 数量
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return _item(_list[index]);
        },
      ),
    );
  }

  Widget _item(InformationItem item) {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 6, 15, 6),
      color: Colors.white,
      margin: const EdgeInsets.only(top: 1, bottom: 9),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //圆角
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FadeInImage.assetNetwork(
              width: 96,
              height: 80,
              placeholder: "imgs/zanwutupian.png",
              image: item.cover,
              fit: BoxFit.cover,
            ),
            /*child: Image.network(
                  _list[index].cover,
                  width: 96,
                  height: 80,
                  fit: BoxFit.cover,
                ),*/
          ),
          Container(
            width: MediaQuery.of(context).size.width - 151, // 屏幕宽度
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 7),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.title,
                    style:
                        const TextStyle(fontSize: 14, color: Color(0xFF4A4A4A)),
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
                        item.keywords,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFFCACACA)),
                      ),
                      Text(
                        item.createdAt,
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
  }
}
