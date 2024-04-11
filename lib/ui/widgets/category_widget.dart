import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    required this.child,
    this.space = 0,
    this.title = '',
    this.textStyle,
    super.key,
  });

  final Widget child;
  final double space;
  final String title;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        child,
        SizedBox(height: space),
        Text(
          title,
          style: textStyle,
        ),
      ],
    );
  }
}
