import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_scankit/flutter_scankit.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/widgets/my_appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert' as convert;

///添加地址薄
class AddAddressPage extends StatefulWidget {
  int type = 1; //1、增加、2修改
  String? name, address, beizhu;

  AddAddressPage(
      {Key? key, required this.type, this.name, this.address, this.beizhu})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _AddAddressPage();
}

const _permissions = [Permissions.READ_EXTERNAL_STORAGE, Permissions.CAMERA];
const _permissionGroup = [PermissionGroup.Camera, PermissionGroup.Photos];

class _AddAddressPage extends State<AddAddressPage> {
  final GlobalKey _key = GlobalKey<FormState>();
  TextEditingController? _name;
  TextEditingController? _address;
  TextEditingController? _beizhu;

  //扫码
  late FlutterScankit scanKit;

  @override
  void initState() {
    super.initState();
    setState(() {
      _name = TextEditingController(text: widget.name);
      _address = TextEditingController(text: widget.address);
      _beizhu = TextEditingController(text: widget.beizhu);
    });

    //扫码
    scanKit = FlutterScankit();
    scanKit.addResultListen((val) {
      // Fluttertoast.showToast(msg: "扫码返回：" + val.toString());
      // EasyLoading.showToast("扫码返回：" + val.toString());
      setState(() {
        // code = val;
        _address!.text = val;
      });
    });

    //权限
    FlutterEasyPermission().addPermissionCallback(
        onGranted: (requestCode, perms, perm) {
          startScan();
        },
        onDenied: (requestCode, perms, perm, isPermanent) {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //释放
    _name?.dispose();
    _address?.dispose();
    _beizhu?.dispose();

    scanKit.dispose();
  }

  /**
   * 直接调用扫码
   */
  Future<void> startScan() async {
    try {
      await scanKit.startScan(scanTypes: [ScanTypes.ALL]);
    } on PlatformException catch (e) {
      EasyLoading.showToast(e.message.toString());
      /*setState(() {
        err = true;
        errMsg = e.toString();
      });*/
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6F6F6),
        appBar: MyAppBar(context, widget.type == 1 ? S().mine16 : S().mine20),
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
                          onTap: () async {
                            if (widget.type == 1) {
                              //扫码
                              /**
                               * 扫码
                               */
                              if (!await FlutterEasyPermission.has(
                                  perms: _permissions,
                                  permsGroup: _permissionGroup)) {
                                FlutterEasyPermission.request(
                                    perms: _permissions,
                                    permsGroup: _permissionGroup);
                              } else {
                                startScan();
                                // newPage(context);
                              }
                            } else {
                              //删除
                              setState(() {
                                _address!.text = "";
                              });
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
                      EasyLoading.showToast(S().mine21);
                      // Fluttertoast.showToast(msg: S().mine21);
                      return;
                    }
                    if (_address?.text == null || _address!.text.isEmpty) {
                      EasyLoading.showToast(S().mine22);
                      // Fluttertoast.showToast(msg: S().mine22);
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
                    var json = {
                      "name": "${_name!.text}",
                      "address": "${_address!.text}",
                      "beizhu": "${_beizhu!.text}"
                    };
                    String params = convert.jsonEncode(json);
                    print("提交的数据:" + params);
                    /*String str = _name!.text +
                        "," +
                        _address!.text +
                        "," +
                        _beizhu!.text;*/
                    if (widget.type == 1) {
                      //添加
                      _add(params.toString());
                    } else {
                      //修改
                      _change(params.toString());
                    }
                  },
                  child: Text(S().confirm))
            ],
          );
        });
    if (result) {
      Navigator.of(context).pop();
    }
  }

  //增加方法
  void _add(String str) async {
    List<String> list = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取所有的list
    if (prefs.getStringList('ICPAddress') != null) {
      list = prefs.getStringList('ICPAddress')!;
    }
    for (int i = 0; i < list.length; i++) {
      print("数据$i:" + list[i]);
    }
    //添加一条数据
    list.add(str);
    prefs.setStringList('ICPAddress', list);

    Navigator.pop(context, true);
  }

  //修改方法
  void _change(String str) async {
    //旧数据
    var json = {
      "name": "${widget.name!}",
      "address": "${widget.address!}",
      "beizhu": "${widget.beizhu!}"
    };
    String params = convert.jsonEncode(json);
    List<String> list = [];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //获取所有的list
    if (prefs.getStringList('ICPAddress') != null) {
      list = prefs.getStringList('ICPAddress')!;
    }
    //删除当前数据
    for (int i = 0; i < list.length; i++) {
      print("数据$i:" + list[i]);
      if (list[i] == params) {
        print("找到$i:" + list[i]);
        list[i] = str;
        print("修改后$i:" + list[i]);
      }
    }
    prefs.setStringList('ICPAddress', list);
    Navigator.pop(context, true);
  }
}
