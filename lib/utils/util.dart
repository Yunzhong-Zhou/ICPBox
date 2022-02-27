import 'package:flutter/material.dart';
import 'package:icpbox/main.dart';

/// px 转 rpx
double toRpx(double size) {
  //屏幕宽度/设计稿宽度
  double rpx = MediaQuery.of(navigatorKey.currentState!.context).size.width / 750;
  return size * rpx;
}
