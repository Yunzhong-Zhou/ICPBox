import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:icpbox/config/myapp_colors.dart';
import 'package:icpbox/generated/l10n.dart';

import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

///分享资讯
class ShareInformationPage extends StatefulWidget {
  String title = "", time = "", content = "", tag = "";

  ShareInformationPage({
    Key? key,
    required this.title,
    required this.time,
    required this.content,
    required this.tag,
  }) : super(key: key);

  @override
  _ShareInformationPageState createState() => _ShareInformationPageState();
}

const _permissions = [
  Permissions.WRITE_EXTERNAL_STORAGE,
  Permissions.READ_EXTERNAL_STORAGE
];
const _permissionGroup = [PermissionGroup.Photos];

class _ShareInformationPageState extends State<ShareInformationPage> {
  final GlobalKey _globalKey = GlobalKey();

  /// 保存图片
  void _save(globalKey) async {
    RenderRepaintBoundary boundary =
        globalKey.currentContext.findRenderObject();
    // 获取当前设备的像素比
    double dpr = ui.window.devicePixelRatio;
    //生成图片
    ui.Image image = await boundary.toImage(pixelRatio: dpr);
    //图片转byte
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    //byte转uint-8编码
    Uint8List list = bytes!.buffer.asUint8List();
    //得到本应用文件路径
    final directory = (await getExternalStorageDirectory())!.path;
    //生成图片文件
    File imgFile = File('$directory/share_information.png');
    //写入文件
    imgFile.writeAsBytesSync(list);

    //分享
    RenderBox box = globalKey.currentContext.findRenderObject();
    Share.shareFiles(['$directory/share_information.png'],
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,
        subject: "subject",
        text: "text");

    /* ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List picBytes = byteData!.buffer.asUint8List();
    final result = await ImageGallerySaver.saveImage(
        picBytes,
        quality: 100,
        name: "icpbox_share");

    if(result['isSuccess']){
      // EasyLoading.showToast('保存成功');
      //得到uri
      print(result["filePath"]);

      //分享
      List<String> paths = [result["filePath"].toString()];
      Share.shareFiles(paths,mimeTypes:["image/png"],subject: "分享",text: "内容");
    } else {
      EasyLoading.showToast('保存失败');
    }*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //权限
    FlutterEasyPermission().addPermissionCallback(
        onGranted: (requestCode, perms, perm) {
          _save(_globalKey);
        },
        onDenied: (requestCode, perms, perm, isPermanent) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        RepaintBoundary(
          key: _globalKey,
          child: Container(
            color: Colors.white,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //顶部布局
                Stack(
                  children: [
                    //背景图
                    Image.asset(
                      "imgs/bg_share_header.png",
                      width: MediaQuery.of(context).size.width,
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 70),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                "imgs/icp_logo.png",
                                width: 40,
                                height: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.tag,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            S().mine28,
                            style: const TextStyle(
                                fontSize: 44,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            S().mine29,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: MyAppColor.white2, //加透明度
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //标题
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    widget.title,
                    style:
                        const TextStyle(fontSize: 18, color: MyAppColor.black1),
                  ),
                ),
                //时间
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    widget.time,
                    style: const TextStyle(fontSize: 14, color: MyAppColor.black3),
                  ),
                ),
                //内容
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  child: Text(
                    widget.content,
                    style:
                        const TextStyle(fontSize: 14, color: MyAppColor.black2),
                  ),
                ),
                Expanded(child: Container()),
                //底部布局
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //二维码图片
                    QrImage(
                      data: "https://www.icpbox.org/",
                      size: 78,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "ICPBox",
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF3E4F8F)),
                        ),
                        Text(
                          S().mine30,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(0xFFA8ABB6)),
                        ),
                      ],
                    ),
                  ],
                ),

                Image.asset(
                  "imgs/bg_share_footer.png",
                  width: MediaQuery.of(context).size.width,
                ),
              ],
            ),
          ),
        ),
        //顶部按钮
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top), //状态栏高度
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                  // Navigator.of(navigatorKey.currentState!.context).pop();
                },
              ),
              Expanded(
                child: Container(),
              ),
              IconButton(
                icon: const Icon(Icons.share),
                color: Colors.white,
                onPressed: () async {
                  //分享
                  if (!await FlutterEasyPermission.has(
                      perms: _permissions, permsGroup: _permissionGroup)) {
                    FlutterEasyPermission.request(
                        perms: _permissions, permsGroup: _permissionGroup);
                  } else {
                    // _shareUiImage();
                    _save(_globalKey);
                  }
                },
              ),
            ],
          ),
        )
      ],
    ));
  }
}
