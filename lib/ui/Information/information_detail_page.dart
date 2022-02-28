import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:icpbox/api/Api.dart';
import 'package:icpbox/config/myapp_colors.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/model/information_detail_model.dart';
import 'package:icpbox/services/information_service.dart';
import 'package:icpbox/widgets/myappbar.dart';
import 'package:icpbox/widgets/myclassical.dart';
import 'package:icpbox/widgets/myemptywidget.dart';
import 'package:icpbox/widgets/myfirstrefresh.dart';
import 'package:share/share.dart';

class InformationDetailPage extends StatefulWidget {
  int type = 1; //1、资讯，2、文章
  String id = "";

  InformationDetailPage({Key? key, required this.type, required this.id})
      : super(key: key);

  @override
  _InformationDetailPageState createState() => _InformationDetailPageState();
}

class _InformationDetailPageState extends State<InformationDetailPage> {
  late EasyRefreshController _easyRefreshController;

  String title = "";
  String url = "";

  Article? _article;
  List<Recommend>? _recommend;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = EasyRefreshController();

    switch (widget.type) {
      case 1:
        //资讯
        title = S().infomation4;
        url = Api.INFORMATION1_DETAIL;
        break;
      case 2:
        //文章
        title = S().infomation6;
        url = Api.INFORMATION2_DETAIL;
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
          await InformationService().getDetail(url: url, id: widget.id);
      //将数据转为实体
      InformationDetailModel bean = InformationDetailModel.fromJson(resut);
      //更新页面数据
      setState(() {
        _article = bean.article;
        _recommend = bean.recommend;
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
      appBar: MyAppBarActions(context, title, [
        IconButton(
          onPressed: () {
            //分享
            Share.share("https://api.icpbox.org", subject: _article!.title!);
          },
          icon: const Icon(Icons.more_horiz),
          color: Colors.black,
        )
      ]),
      body: EasyRefresh(
        controller: _easyRefreshController,
        firstRefreshWidget: MyFirstRefresh(),
        emptyWidget: MyEmptyWidget(
            _article == null, () => _easyRefreshController.callRefresh()),
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
            _article == null ? Container() : _Content(_article!),
            //下部分数据
            _recommend == null
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0)),
                    margin: const EdgeInsets.only(left: 10, top: 10, right: 10),
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      //左对齐
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S().infomation7,
                          style: const TextStyle(color: MyAppColor.black3),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        ListView.builder(
                            //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
                            primary: true,
                            //内容适配
                            shrinkWrap: true,
                            // controller: controller,
                            //item 数量
                            itemCount: _recommend!.length,
                            itemBuilder: (context, index) {
                              return _Item(_recommend![index]);
                            }),
                      ],
                    ),
                  )
          ],
        ),
      ),
    );
  }

  //上部分布局
  Widget _Content(Article article) {
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
            height: 14,
          ),
          FadeInImage.assetNetwork(
            width: double.infinity,
            // height: 80,
            placeholder: "imgs/zanwutupian.png",
            image: article.cover!,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 24,
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

  //列表布局
  Widget _Item(Recommend item) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
            //关闭当前页面
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      InformationDetailPage(type: widget.type, id: item.id!),
                ));
            //跳转页面并关闭当前页面 - 返回后是空白页面
            /*Navigator.pushAndRemoveUntil(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return InformationDetailPage(type: widget.type, id: item.id!);
                }), (route) => route == null);*/
          },
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
                  height: 62,
                  placeholder: "imgs/zanwutupian.png",
                  image: item.cover!,
                  fit: BoxFit.cover,
                ),
                /*child: Image.network(
                      _list[index].cover,
                      width: 96,
                      height: 80,
                      fit: BoxFit.cover,
                    ),*/
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 10, top: 10, bottom: 7),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.title!,
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xFF4A4A4A)),
                          maxLines: 2,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(top: 6),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.keywords!,
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xFFCACACA)),
                            ),
                            Text(
                              item.createdAt!,
                              style: const TextStyle(
                                  fontSize: 12, color: Color(0xFFCACACA)),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
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
      ],
    );
  }
}
