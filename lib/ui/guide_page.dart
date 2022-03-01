
import 'package:flutter/material.dart';
import 'package:icpbox/widgets/my_bottomnavigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  bool isVisible = true;
  TabController? _tabController;

  final List<Widget> listImage = [
    Image.asset(
      "imgs/a.png",
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
    Image.asset(
      "imgs/b.png",
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
    Image.asset(
      "imgs/c.png",
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _tabController = TabController(initialIndex: 0, length: listImage.length, vsync: this);
    _tabController?.addListener(() {
      if (_tabController?.index == 2) {
        setState(() {
          isVisible = false;
        });
      } else {
        setState(() {
          isVisible = true;
        });
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              listImage[0],
              listImage[1],
              Stack(
                children: [
                  listImage[2],
                  Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setBool("isFirst", false);
                          //跳转到起始页并关闭所有页面
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                                return MyBottomNavigation();
                              }), (route) => false);
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(40)),
                          child: Text("欢迎使用App"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Visibility(
              visible: isVisible,
              child: Container(
                margin: const EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TabPageSelector(
                    controller: _tabController,
                    selectedColor: Colors.amberAccent,
                    indicatorSize: 17,
                    color: Colors.black12,
                  ),
                ),
              ))
        ],
      ),
    );
  }
}

