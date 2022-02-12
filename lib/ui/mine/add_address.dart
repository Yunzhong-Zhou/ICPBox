import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:icpbox/generated/l10n.dart';

///添加地址薄
class AddAddressPage extends StatefulWidget {
  int type = 1; //1、增加、2修改
  String? id, name, address, beizhu;

  AddAddressPage(
      {Key? key,
      required this.type,
      this.id,
      this.name,
      this.address,
      this.beizhu})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddAddressPage();
}

class _AddAddressPage extends State<AddAddressPage> {
  final GlobalKey _key = GlobalKey<FormState>();
  TextEditingController? _name;
  TextEditingController? _address;
  TextEditingController? _beizhu;

  @override
  void initState() {
    super.initState();
    setState(() {
      _name = TextEditingController(text: widget.name);
      _address = TextEditingController(text: widget.address);
      _beizhu = TextEditingController(text: widget.beizhu);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //释放
    _name?.dispose();
    _address?.dispose();
    _beizhu?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new_rounded),
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: Text(widget.type == 1 ? S().mine16 : S().mine20,
              style: TextStyle(fontSize: 20, color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        // body: NoAddress(),
        body: Form(
          key: _key,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(14),
                //修饰器-圆角
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  children: [
                    //名称
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextFormField(
                        controller: _name,
                        maxLines: 1,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                          //不需要输入框下划线
                          border: InputBorder.none,
                          hintText: S().mine21,
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                          labelText: S().mine17,
                          labelStyle:
                              TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                        ),
                        textInputAction: TextInputAction.next,
                        /*
                        //校验输入
                        validator: (v){
                          if(v==null||v.isEmpty){
                            return S().mine21;
                          }
                        },*/
                      ),
                    ),
                    //分割线
                    const Divider(
                      //缩进
                      indent: 20.0,
                      endIndent: 20.0,
                      //分割线高度
                      height: 1.0,
                      //分割线的厚度
                      thickness: 1.0,
                      color: Color(0xFFF7F7F7),
                    ),
                    //地址
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Row(children: [
                        Expanded(
                          child: TextFormField(
                            controller: _address,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                            decoration: InputDecoration(
                              //不需要输入框下划线
                              border: InputBorder.none,
                              hintText: S().mine22,
                              hintStyle: TextStyle(
                                  fontSize: 14, color: Color(0xFFAAAAAA)),
                              labelText: S().mine18,
                              labelStyle: TextStyle(
                                  fontSize: 14, color: Color(0xFFAAAAAA)),
                            ),
                            textInputAction: TextInputAction.next,
                            /*
                            //校验输入
                            validator: (v){
                              if(v==null||v.isEmpty){
                                return S().mine22;
                              }
                            },*/
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (widget.type == 1) {
                              //扫码

                            } else {
                              setState(() {});
                            }
                          },
                          child: Image.asset(
                            widget.type == 1
                                ? "imgs/ic_scan.png"
                                : "imgs/ic_cha.png",
                            width: 20,
                            height: 20,
                          ),
                        )
                      ]),
                    ),
                    //分割线
                    const Divider(
                      //缩进
                      indent: 20.0,
                      endIndent: 20.0,
                      //分割线高度
                      height: 1.0,
                      //分割线的厚度
                      thickness: 1.0,
                      color: Color(0xFFF7F7F7),
                    ),
                    //备注
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        controller: _beizhu,
                        maxLines: 1,
                        style: TextStyle(fontSize: 14, color: Colors.black),
                        decoration: InputDecoration(
                          //不需要输入框下划线
                          border: InputBorder.none,
                          hintText: S().mine23,
                          hintStyle:
                              TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                          labelText: S().mine19,
                          labelStyle:
                              TextStyle(fontSize: 14, color: Color(0xFFAAAAAA)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                // 屏幕宽度
                margin: EdgeInsets.fromLTRB(33, 33, 33, 0),
                height: 48,
                //在此设置
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: const LinearGradient(colors: [
                    Color(0xFF3555FF),
                    Color(0xFF3878F9),
                    Color(0xFF3B9BF2),
                  ]),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    //校验输入
                    /*if((_key.currentState as FormState).validate()){
                    }*/
                    if (_name?.text == null || _name!.text.isEmpty) {
                      Fluttertoast.showToast(msg: S().mine21);
                      return;
                    }
                    if (_address?.text == null || _address!.text.isEmpty) {
                      Fluttertoast.showToast(msg: S().mine22);
                      return;
                    }

                    if (widget.type == 1) {
                      //增加-保存数据到本地
                      _showAlrt(S().hint, S().hint1);
                    } else {
                      //修改-修改本地数据
                      _showAlrt(S().hint, S().hint3);
                    }
                  },
                  child: Text(
                    S().save,
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  style: ButtonStyle(
                    //去除阴影
                    elevation: MaterialStateProperty.all(0),
                    //将按钮背景设置为透明
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  void _showAlrt(var _title, var _content) async {
    var result = await showDialog(
        //点击空白区域是否关闭对话框
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          //ios风格的组件Cupertino开头
          return CupertinoAlertDialog(
            title: Text(_title),
            content: Text(_content),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: Text(S().cancel)),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: Text(S().confirm))
            ],
          );
        });
    print(result);
  }
}
