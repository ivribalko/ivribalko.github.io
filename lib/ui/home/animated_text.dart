import 'package:animations/animations.dart';
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

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  AnimationController animation;

  _AnimatedTextState() {
    animation = AnimationController(
      duration: kDuration,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: kDuration * 1.5,
      transitionBuilder: (child, animation) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: this.animation,
          transitionType: SharedAxisTransitionType.vertical,
          fillColor: Colors.transparent,
          child: child,
        );
      },
      child: Text(
        widget.items[widget.index],
        key: ValueKey(widget.index),
        style: Get.textTheme.headline4,
      ),
    );
  }
}
