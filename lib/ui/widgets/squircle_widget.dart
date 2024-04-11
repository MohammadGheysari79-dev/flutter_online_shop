import 'package:flutter/material.dart';

class SquircleWidget extends StatelessWidget {
  const SquircleWidget({
    this.width,
    this.height,
    this.radius = 42,
    this.color,
    this.child,
    this.shadows,
    super.key,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color? color;
  final Widget? child;
  final List<BoxShadow>? shadows;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: color,
        shadows: shadows,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: child,
    );
  }
}
