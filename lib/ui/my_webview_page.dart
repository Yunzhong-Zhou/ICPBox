import 'package:flutter/material.dart';

//展示网页数据
// ignore: must_be_immutable
/*
class MyWebViewPage extends StatefulWidget {
  String url;
  String title;

  MyWebViewPage({Key? key, required this.url, required this.title});

  @override
  createState() => _PageState(url: url, title: title);
}

class _PageState extends State<MyWebViewPage> {
  _PageState({Key? key, required this.url, required this.title});

  String url;
  String title;
  FlutterWebviewPlugin _webViewPlugin = FlutterWebviewPlugin();

  double lineProgress = 0.0;

  initState() {
    super.initState();
    _webViewPlugin.onProgressChanged.listen((progress) {
      print(progress);
      setState(() {
        lineProgress = progress;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      appBar: _setTitle(context),
      url: widget.url,
      mediaPlaybackRequiresUserGesture: false,
      withZoom: false,
      withLocalStorage: true,
      hidden: true,
    );
  }

  _progressBar(double progress, BuildContext context) {
    return Container(
      child: LinearProgressIndicator(
        backgroundColor: Colors.blueAccent.withOpacity(0),
        value: progress == 1.0 ? 0 : progress,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
      ),
      height: 1,
    );
  }

  _setTitle(context) {
    return AppBar(
      brightness: Brightness.light,
      title: Text(title, style: const TextStyle(color: Colors.black, fontSize: 20)),
      elevation: 1,
      leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context)),
      backgroundColor: Colors.white,
      centerTitle: true,
      bottom: PreferredSize(
        child: _progressBar(lineProgress, context),
        preferredSize: const Size.fromHeight(0.1),
      ),
    );
  }

  @override
  void dispose() {
    _webViewPlugin.dispose();
    super.dispose();
  }
}*/
