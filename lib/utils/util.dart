import 'package:flutter/material.dart';

/// px 转 rpx
double toRpx(BuildContext context, double size) {
  //屏幕宽度/设计稿宽度
  double rpx = MediaQuery.of(context).size.width / 750;
  return size * rpx;
}
