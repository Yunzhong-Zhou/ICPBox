import 'package:flutter/material.dart';
import 'package:icpbox/generated/l10n.dart';

///空数据布局
Widget? MyEmptyWidget(bool empty, VoidCallback? onTap) {
  return empty
      ? InkWell(
          onTap: onTap,
          child: SizedBox(
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Expanded(
                  child: SizedBox(),
                  flex: 2,
                ),
                SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: Image.asset('imgs/empty.png'),
                ),
                Text(
                  S().noData,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
                ),
                const Expanded(
                  child: SizedBox(),
                  flex: 3,
                ),
              ],
            ),
          ),
        )
      : null;
}
