import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/model/notice_model.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/services/information_service.dart';
import 'package:icpbox/ui/Information/information_detail_page.dart';
import 'package:icpbox/ui/mine/notice_detail_page.dart';
import 'package:icpbox/widgets/my_appbar.dart';
import 'package:icpbox/widgets/my_classical.dart';
import 'package:icpbox/widgets/my_emptywidget.dart';
import 'package:icpbox/widgets/my_firstrefresh.dart';
import 'package:provider/provider.dart';

///通知
class NoticePage extends StatefulWidget {
  int type = 1; //1、通知，2、帮助中心
  NoticePage({Key? key, required this.type})
      : super(key: key);
  @override
  State<StatefulWidget> createState() => _NoticePage();
}

class _NoticePage extends State<NoticePage> {
  late EasyRefreshController _easyRefreshController;

  String title = "";
  String url = "";

  int _page = 1;
  List<NoticeItem> _list = [];
  bool hasMore = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = EasyRefreshController();
    switch (widget.type) {
      case 1:
      //通知
        title = S().mine3;
        url = Api.NOTICE;
        break;
      case 2:
      //帮助中心
        title = S().mine4;
        url = Api.HELP;
        break;
    }
    //数据请求
    // _getDataList();

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _easyRefreshController.dispose();
  }

  //数据请求
  Future _getDataList({bool push = false}) async {
    try {
      //获取接口数据
      Map<String, dynamic> resut =
          await InformationService().getNoticeList(url: url,page: _page);

      //将数据转为实体
      NoticeModel listModel = NoticeModel.fromJson(resut);
      //更新页面数据
      setState(() {
        //是否有更多数据
        hasMore = listModel.list!.isNotEmpty;
        if(!hasMore){
          EasyLoading.showInfo(S().noMore);
        }else{
          //如果为更多数据
          if (push) {
            _list.addAll(listModel.list!);
          } else {
            _list = listModel.list!;
          }
        }
       

      });
    } catch (e) {
      /*setState(() {
        err = true;
        errMsg = e.toString();
      });*/
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
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: MyAppBar(context, title),
      body: EasyRefresh(
        controller: _easyRefreshController,
        firstRefreshWidget: MyFirstRefresh(),
        emptyWidget: MyEmptyWidget(_list.isEmpty, () => _easyRefreshController.callRefresh()),
        //首次刷新
        firstRefresh: true,
        //刷新回调
        onRefresh: _onRefresh,
        //加载回调
        onLoad: _onLoad,
        //头部刷新布局
        header:  MyClassicalHeader(),
        //底部加载更多布局
        footer: MyClassicalFooter(),

        child: ListView.builder(
            //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
            primary: true,
            //内容适配
            shrinkWrap: true,
            // controller: controller,
            //item 数量
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return _NoticeItem(_list[index]);
            }),
      ),
    );
  }

  //item
  Widget _NoticeItem(NoticeItem item) {
    return Container(
        child: Column(
          children: [
            const Divider(
              //缩进
              // indent: 10.0,
              // endIndent: 20.0,
              //分割线高度
              height: 1.0,
              //分割线的厚度
              thickness: 1.0,
              color: Color(0xFFF7F7F7),
            ),
            ListTile(
              tileColor: Colors.white,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoticeDetailPage(type:widget.type,id: item.id!),
                    ));
              },
              title: Text(item.title!,
                  style: const TextStyle(color: Color(0xFF414141), fontSize: 14.0)),
              // Expanded(child: Container()),
              subtitle: Text(item.createdAt!,
                  style: const TextStyle(color: Color(0xFFD2D2D2), fontSize: 12.0)),
              //紧凑程度 -4 ~ 4
              visualDensity: const VisualDensity(horizontal: -4.0),
              trailing: Image.asset("imgs/ic_next_gray.png", width: 12, height: 12),
            )
          ],
        ),
    );
  }
}
