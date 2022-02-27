import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/model/notice_model.dart';
import 'package:icpbox/provider/AppDataProvider.dart';
import 'package:icpbox/services/information_service.dart';
import 'package:icpbox/widgets/myappbar.dart';
import 'package:provider/provider.dart';

///通知
class NoticePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoticePage();
}

class _NoticePage extends State<NoticePage> {
  final ScrollController _scrollController = ScrollController();

  int _page = 1;
  List<NoticeItem> _list = [];
  bool hasMore = true;

  bool err = false;
  String errMsg = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //数据请求
    _getDataList();

    //上拉加载更多监听器
    _scrollController.addListener(() {
      //print(_scrollController.position.pixels); //当前距离值
      //print(_scrollController.position.maxScrollExtent); //最大距离值
      //当 当前距离值>最大距离值-20的时候 进行上拉加载数据并分页
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 2) {
        //页码+1
        _page++;
        //加载更多
        _getDataList(push: true);
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

//数据请求
  Future _getDataList({bool push = false}) async {
    try {
      //获取接口数据
      Map<String, dynamic> resut =
          await InformationService().getNoticeList(page: _page);

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
      setState(() {
        err = true;
        errMsg = e.toString();
      });
    }
  }
  //下拉刷新->转一秒的圈 回调刷新的方法
  Future<void> _onRefresh() async {
    /*await Future.delayed(Duration(seconds: 1), () {
      _getData();
    });*/
    await _getDataList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F6F6),
      appBar: MyAppBar(context, S.of(context).mine3),
      body: RefreshIndicator(
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
        onRefresh: _onRefresh,
      ),
    );
  }

  //item
  Widget _NoticeItem(NoticeItem item) {
    return Column(
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
          onTap: () {},
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
    );
  }
}
