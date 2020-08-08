import 'package:flutter/material.dart';

class AnimatedText extends StatelessWidget {
  final int index;
  final List<String> items;

  const AnimatedText({
    this.index,
    this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Text(items[index]);
  }
}
