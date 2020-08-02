import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rybalko_dev/ui/constant.dart';

class Scrolling extends GetxController {
  final isTop = true.obs;
  final ScrollController scroll;

  Scrolling(this.scroll) {
    scroll.addListener(_setTop);
  }

  @override
  void onClose() {
    scroll.removeListener(_setTop);
    super.onClose();
  }

  void _setTop() {
    isTop.value = scroll.position.pixels < 30;
    update();
  }
}

extension ListExtensions on List<Widget> {
  void addSpacing({double multiplier = 1.0}) {
    var size = padding * multiplier;
    for (var i = length - 1; i > 0; i--) {
      insert(i, SizedBox(width: size, height: size));
    }
  }
}
