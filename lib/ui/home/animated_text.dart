import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant.dart';

class AnimatedText extends StatefulWidget {
  final int index;
  final List<String> items;

  const AnimatedText({
    this.index,
    this.items,
  });

  @override
  _AnimatedTextState createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kDuration,
      switchInCurve: kCurve,
      switchOutCurve: kCurve,
      child: Text(
        widget.items[widget.index],
        key: ValueKey(widget.index),
        style: Get.textTheme.headline4,
      ),
    );
  }
}
