import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// webview 封装
class WebViewPage extends StatefulWidget {
  String? initialUrl;

  WebViewPage({Key? key, this.initialUrl}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  ///是否显示加载 true是
  bool _isShowProgress = false;

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      child: Stack(
        alignment: Alignment.center,
        children: [
          WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: widget.initialUrl,
            onWebViewCreated: (WebViewController webViewController) {
              //WebView创建完成时调用
              debugPrint("XWebView onWebViewCreated");
              _controller.complete(webViewController);
              setState(() {
                _isShowProgress = true;
              });
            },
            onPageStarted: (url) {
              //页面开始加载时调用
              debugPrint("XWebView onPageStarted : $url");
              // EasyLoading.show(status: S().loading);
            },
            onPageFinished: (url) {
              //页面加载完成时调用
              // debugPrint("XWebView onPageFinished : $url");
              EasyLoading.dismiss();
              setState(() {
                _isShowProgress = false;
              });
            },
          ),
          _isShowProgress
              ? SpinKitThreeBounce(
                  color: Theme.of(context).primaryColor,
                ) //动画控件根据自己需求改动
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
