import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easy_permission/easy_permissions.dart';
import 'package:icpbox/generated/l10n.dart';

import 'dart:ui' as ui;

import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share/share.dart';

///分享资讯
class SharePosterPage extends StatefulWidget {

  const SharePosterPage({Key? key,}) : super(key: key);

  @override
  _SharePosterPageState createState() => _SharePosterPageState();
}

const _permissions = [
  Permissions.WRITE_EXTERNAL_STORAGE,
  Permissions.READ_EXTERNAL_STORAGE
];
const _permissionGroup = [PermissionGroup.Photos];

class _SharePosterPageState extends State<SharePosterPage> {
  final GlobalKey _globalKey = GlobalKey();

  /// 保存图片
  void _save(globalKey) async {
    RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
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
    File imgFile = File('$directory/share.png');
    //写入文件
    imgFile.writeAsBytesSync(list);

    //分享
    RenderBox box = globalKey.currentContext.findRenderObject();
    Share.shareFiles(['$directory/share.png'],
        sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size,subject: "subject",text: "text");

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
          child: Stack(
            children: [
              //背景图
              Image.asset(
                "imgs/bg_share.png",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "imgs/ic_logo.png",
                        width: 56,
                        height: 39,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "ICPBox",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF3E4F8F)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    S().mine26,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF222B36)),
                  ),
                  Text(
                    S().mine27,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFFA8ABB6)),
                  ),
                  Expanded(child: Container()),
                  Container(
                    color: Colors.white,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: Row(
                      children: [
                        Image.asset(
                          "imgs/ic_logo.png",
                          width: 65,
                          height: 65,
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        Expanded(
                          child: Column(
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
                                S().mine26,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Color(0xFFA8ABB6)),
                              ),
                            ],
                          ),
                        ),
                        //二维码图片
                        QrImage(
                          data: "https://www.icpbox.org/",
                          size: 65,
                        ),
                        /*Image.asset(
                          "imgs/ic_logo.png",
                          width: 65,
                          height: 65,
                        ),*/
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        //顶部按钮
        Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),//状态栏高度
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                color: Colors.black,
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
                color: Colors.black,
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
