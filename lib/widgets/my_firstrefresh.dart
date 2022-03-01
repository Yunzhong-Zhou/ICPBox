import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:icpbox/generated/l10n.dart';
import 'package:icpbox/main.dart';

///第一次加载页面布局
Widget MyFirstRefresh(){
 return SizedBox(
    width: double.infinity,
    height: double.infinity,
    child: Center(
        child: SizedBox(
          height: 200.0,
          width: 300.0,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 50.0,
                  height: 50.0,
                  child: SpinKitFadingCube(
                    color: Theme.of(navigatorKey.currentState!.context).primaryColor,
                    size: 25.0,
                  ),
                ),
                Text(S().loading)
              ],
            ),
          ),
        )),
  );
}