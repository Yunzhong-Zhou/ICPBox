import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/model/information1_model.dart';
import 'package:icpbox/model/information_model.dart';
import 'package:icpbox/services/information_service.dart';
import 'package:icpbox/ui/Information/information_detail_page.dart';
import 'package:icpbox/widgets/myclassical.dart';
import 'package:icpbox/widgets/myemptywidget.dart';
import 'package:icpbox/widgets/myfirstrefresh.dart';

///资讯
class InforMation1Page extends StatefulWidget {
  const InforMation1Page({Key? key}) : super(key: key);

  @override
  _InforMation1PageState createState() => _InforMation1PageState();
}

class _InforMation1PageState extends State<InforMation1Page>
    with AutomaticKeepAliveClientMixin {
  late EasyRefreshController _easyRefreshController;

  int _page = 1;
  // List<InformationItem> _list = InformationList([]).list;
  List<Information1List> _list = [];
  bool hasMore = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _easyRefreshController = EasyRefreshController();
    //数据请求
    // _getDataList();
  }

  @override
  void dispose() {
    super.dispose();
    _easyRefreshController.dispose();
  }

  //数据请求
  Future _getDataList({bool push = false}) async {
    try {
      //获取接口数据
      Map<String, dynamic> resut =
          await InformationService().getInformation1List(page: _page);

      hasMore = resut["list"].isNotEmpty;

      List<Information1List> list1 = [];
      resut["list"].forEach((key, value) {
        //获取data里面的值，并转为实体
        InformationList listModel = InformationList.fromJson(value);
        list1.add(Information1List(time: key, itmelist: listModel));
      });
      print("列表：${list1.length}");

      //更新页面数据
      setState(() {
        //是否有更多数据
        hasMore = list1.isNotEmpty;
        //如果为更多数据
        if (push) {
          _list.addAll(list1);
        } else {
          _list = list1;
        }
      });
    } catch (e) {
      /*setState(() {
        error = true;
        // errorMsg = S().noData;
        errorMsg = "";
      });*/
    }
  }

  //下拉刷新
  Future _onRefresh() async {
    /*if (error) {
      setState(() => error = false);
    }*/
    _page = 1;
    await _getDataList();
    //重置刷新状态
    _easyRefreshController.resetLoadState();
  }

  //上拉加载更多
  Future _onLoad() async {
    if (hasMore) {
      //页码+1
      _page++;
      await _getDataList(push: true);
    }
    //完成加载更多
    _easyRefreshController.finishLoad(noMore: !hasMore);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return EasyRefresh(
      controller: _easyRefreshController,
      firstRefreshWidget: MyFirstRefresh(),
      /*emptyWidget: PageFeedBack(
        loading: loading,
        error: error,
        empty: _list.isEmpty,
        errorMsg: errorMsg,
        onErrorTap: () => _easyRefreshController.callRefresh(),
        onEmptyTap: () => _easyRefreshController.callRefresh(),
      ).build(),*/
      emptyWidget: MyEmptyWidget(_list.isEmpty,() => _easyRefreshController.callRefresh()),
      //首次刷新
      firstRefresh: true,
      //刷新回调
      onRefresh: _onRefresh,
      //加载回调
      onLoad: _onLoad,
      //头部刷新布局
      header: MyClassicalHeader(),
      // header: ClassicalHeader(),//默认header
      // header: PhoenixHeader(),//金色校园Header
      // header: BallPulseHeader(),//球脉冲Header
      // header: BezierCircleHeader(),//弹出圆圈Header
      // header: BezierHourGlassHeader(),//风扇转圈Header
      // header: DeliveryHeader(),//气球快递Header
      // header: TaurusHeader(),//气球快递Header
      //底部加载更多布局
      footer: MyClassicalFooter(),
      // footer: ClassicalFooter(),
      // footer: BallPulseFooter(),//冲上云霄Footer

      child: ListView.builder(
        //false，如果内容不足，则用户无法滚动 而如果[primary]为true，它们总是可以尝试滚动。
        primary: true,
        //内容适配
        shrinkWrap: true,
        //item 数量
        itemCount: _list.length,
        itemBuilder: (context1, index1) {
          return Column(
            children: [
              Container(
                width: double.infinity, // 屏幕宽度,
                color: const Color(0xFFF6F6F6),
                padding: const EdgeInsets.fromLTRB(9, 5, 9, 5),
                child: Text(_list[index1].time),
              ),
              _MyList(_list[index1].itmelist.list),
            ],
          );
        },
      ),
    );
  }

  Widget _MyList(List<InformationItem> mylist) {
    return ListView.builder(
        //为true可以解决子控件必须设置高度的问题
        shrinkWrap: true,
        //禁用滑动事件
        physics: const NeverScrollableScrollPhysics(),
        itemCount: mylist.length,
        itemBuilder: (context2, index2) {
          return Container(
            width: MediaQuery.of(context).size.width, // 屏幕宽度
            // height: double.infinity,
            color: Colors.white,
            alignment: Alignment.topLeft,
            child: Row(
              // mainAxisSize: MainAxisSize.min,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 34,
                  height: 250,
                  alignment: Alignment.center,
                  //层叠布局-竖线及圆形
                  child: Stack(
                    children: [
                      //定位的组件，参考系为 Stack。
                      const Positioned(
                        width: 34,
                        height: 250,
                        //垂直分割线
                        child: VerticalDivider(
                          //分割线颜色
                          color: Color(0xFFF2F2F2),
                          //分割线区域的高度，并非分割线的高度
                          width: 34,
                          // 分割线的厚度，真正的分割线的高度
                          thickness: 1,
                          //起点缩进距离
                          indent: 0,
                          // 终点缩进距离
                          endIndent: 0,
                        ),
                      ),
                      Positioned(
                        width: 9,
                        height: 9,
                        left: 13,
                        top: 9,
                        //圆形
                        child: Container(
                            width: 9,
                            height: 9,
                            // alignment: Alignment.topCenter,
                            decoration: const BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              shape:
                                  BoxShape.circle, // 圆形，使用圆形时不可以使用borderRadius
                            )),
                      )
                    ],
                  ),
                  /*child: VerticalDivider(
              color: Color(0xFFF2F2F2),
              width: 1,
            ),*/
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      // width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                      padding: const EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Text(
                            mylist[index2].createdAt,
                            style: const TextStyle(
                                fontSize: 12, color: Color(0xFFBABABA)),
                          ),
                          Container(
                              margin: const EdgeInsets.only(left: 12),
                              //修饰器-圆角
                              decoration: BoxDecoration(
                                color: const Color(0xFFD8D8D8),
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(mylist[index2].tag,
                                  style: const TextStyle(
                                      fontSize: 12, color: Color(0xFF4A4A4A))))
                        ],
                      ),
                    ),
                    Container(
                      // width: double.infinity,
                      width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                      margin: const EdgeInsets.only(top: 6),
                      padding: const EdgeInsets.only(right: 24),
                      child: Text(mylist[index2].title,
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          //超出行数显示省略号
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, color: Color(0xFF4A4A4A))),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.only(right: 24),
                      child: Text(mylist[index2].digest,
                          maxLines: 5,
                          //超出行数显示省略号
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 14, color: Color(0xFF818181))),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InformationDetailPage(type: 1, id: mylist[index2].id),
                            ));
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width, // 屏幕宽度
                        margin: const EdgeInsets.only(top: 15),
                        child: Text(S().infomation3,
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xFF3555FF))),
                      ),
                    )
                    ,
                    Container(
                      width: MediaQuery.of(context).size.width - 34, // 屏幕宽度
                      padding: const EdgeInsets.only(right: 36),
                      // 屏幕宽度
                      margin: const EdgeInsets.only(top: 19, bottom: 11),
                      child: Row(
                        //两端对齐
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(mylist[index2].keywords,
                              style: const TextStyle(
                                  fontSize: 14, color: Color(0xFFDCDCDC))),
                          Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              //设置 child 居中
                              alignment: const Alignment(0, 0),
                              height: 20,

                              //边框设置
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF3555FF),
                                      Color(0xFF3979F9),
                                      Color(0xFF3B9BF2),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight),
                                //背景
                                color: Colors.transparent,
                                //设置四周圆角 角度 这里的角度应该为 父Container height 的一半
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                //设置四周边框
                                border: Border.all(
                                    width: 1, color: const Color(0xFF3555FF)),
                              ),
                              child: Text(S().infomation5,
                                  style: const TextStyle(
                                      fontSize: 14, color: Color(0xFF3555FF)))),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
