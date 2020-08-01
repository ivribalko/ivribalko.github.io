import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Scrolling extends GetxController {
  final top = true.obs;
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
    top.value = scroll.position.pixels < 30;
    update();
  }
}
