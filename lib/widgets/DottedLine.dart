import 'package:flutter/material.dart';

/// 虚线
/// direction: 支持属性Axis.horizontal，Axis.vertical，用于切换是横向或竖向虚线
/// width：虚线的宽度
/// height：虚线的高度
/// color： 虚线的颜色
class DottedLine extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final Axis direction;

  const DottedLine({
    this.width =10,
    this.height = 1,
    this.color = Colors.black,
    this.direction = Axis.horizontal,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = direction == Axis.horizontal
            ? constraints.constrainWidth()
            : constraints.constrainHeight();
        final dashWidth = width;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: direction == Axis.horizontal ? dashWidth : dashHeight,
              height: direction == Axis.horizontal ? dashHeight : dashWidth,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: direction,
        );
      },
    );
  }
}

