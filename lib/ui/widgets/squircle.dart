import 'package:flutter/material.dart';

class Squircle extends StatelessWidget {
  const Squircle({
    this.width,
    this.height,
    this.radius = 42,
    this.color,
    this.child,
    super.key,
  });

  final double? width;
  final double? height;
  final double radius;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: color,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: child,
    );
  }
}
