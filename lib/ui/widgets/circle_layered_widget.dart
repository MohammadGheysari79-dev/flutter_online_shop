import 'package:flutter/material.dart';

class CircleLayeredWidget extends StatelessWidget {
  const CircleLayeredWidget({
    required this.color,
    this.width = 100,
    this.height = 100,
    this.layersSpace = 10,
    this.layersCount = 4,
    this.child,
    super.key,
  });

  final List<Color> color;
  final double width;
  final double height;
  final double layersSpace;
  final int layersCount;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return _getContainer(1);
  }

  Widget _getContainer(int count) {
    double w = width - (count * layersSpace);
    double h = height - (count * layersSpace);
    return ClipRRect(
      borderRadius: BorderRadius.circular(1000),
      child: Container(
        width: w,
        height: h,
        padding: EdgeInsets.all(layersSpace),
        color: color[count - 1],
        child: (count == layersCount) ? child : _getContainer(count + 1),
      ),
    );
  }
}
