import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/config/myapp_colors.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/model/information_detail_model.dart';
import 'package:icpbox/model/notice_detail_model.dart';
import 'package:icpbox/services/information_service.dart';
import 'package:icpbox/widgets/my_appbar.dart';
import 'package:icpbox/widgets/my_classical.dart';
import 'package:icpbox/widgets/my_emptywidget.dart';
import 'package:icpbox/widgets/my_firstrefresh.dart';

class NoticeDetailPage extends StatefulWidget {
  int type = 1; //1、通知，2、帮助中心
  String id = "";
  NoticeDetailPage({Key? key, required this.type,required this.id})
      : super(key: key);

  @override
  _NoticeDetailPage createState() => _NoticeDetailPage();
}

class _NoticeDetailPage extends State<NoticeDetailPage> {
  late EasyRefreshController _easyRefreshController;

  String title = "";
  String url = "";

  NoticeDetailModel? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = EasyRefreshController();

    switch (widget.type) {
      case 1:
      //资讯
        title = S().mine24;
        url = Api.NOTICE_DETAIL;
        break;
      case 2:
      //文章
        title = S().mine25;
        url = Api.HELP_DETAIL;
        break;
    }
    //数据请求
    // _getDetail();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _easyRefreshController.dispose();
  }

  //数据请求
  Future _getDetail() async {
    try {
      //获取接口数据
      Map<String, dynamic> resut =
          await InformationService().getNoticeDetail(id: widget.id);
      //将数据转为实体
      NoticeDetailModel bean = NoticeDetailModel.fromJson(resut);
      //更新页面数据
      setState(() {
        model = bean;
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
    await _getDetail();
    //重置刷新状态
    _easyRefreshController.resetLoadState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(context, title),
      body: EasyRefresh(
        controller: _easyRefreshController,
        firstRefreshWidget: MyFirstRefresh(),
        emptyWidget: MyEmptyWidget(
            model == null, () => _easyRefreshController.callRefresh()),
        //首次刷新
        firstRefresh: true,
        //刷新回调
        onRefresh: _onRefresh,
        //加载回调
        onLoad: null,
        //头部刷新布局
        header: MyClassicalHeader(),
        //底部加载更多布局
        footer: null,

        child: ListView(
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
            //上部分数据
            model == null ? Container() : _Content(model!),
          ],
        ),
      ),
    );
  }

  //上部分布局
  Widget _Content(NoticeDetailModel article) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 10, left: 24, right: 24, bottom: 24),
      child: Column(
        //左对齐
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article.title!,
            style: const TextStyle(
              color: MyAppColor.black1,
              fontSize: 18,
            ),
          ),
          Text(
            article.createdAt!,
            style: const TextStyle(
              color: MyAppColor.black3,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Html(
            data: article.content!,
          )
          /*Text(
            article.content!,
            style: const TextStyle(
              color: MyAppColor.black2,
              fontSize: 14,
            ),
          ),*/
        ],
      ),
    );
  }
}
