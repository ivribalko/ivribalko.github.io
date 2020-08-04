import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rybalko_dev/ui/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Scrolling extends GetxController {
  final isHeader = true.obs;
  final isFooter = false.obs;
  final ScrollController scroll;

  Scrolling(this.scroll) {
    scroll.addListener(_update);
  }

  @override
  void onClose() {
    scroll.removeListener(_update);
    super.onClose();
  }

  void _update() {
    const diff = 30.0;
    isHeader.value = scroll.offset < diff;
    isFooter.value = scroll.position.maxScrollExtent - scroll.offset < diff;
    update();
  }
}

extension ListExtensions on List<Widget> {
  void addSpacing({double factor = 1.0}) {
    var size = kPadding * factor;
    for (var i = length - 1; i > 0; i--) {
      insert(i, SizedBox(width: size, height: size));
    }
  }
}

extension ConstraintsExtension on BoxConstraints {
  bool get isMobile => maxWidth < 700 || maxWidth * maxHeight < 400 * 1000;
}

Widget get padding => const SizedBox(width: kPadding, height: kPadding);

Widget padded({double factor = 1.0, Widget child = const SizedBox()}) {
  return Padding(
    padding: EdgeInsets.all(kPadding * factor),
    child: child,
  );
}

void mail() {
  launch('mailto:ivan@rybalko.dev?subject=${'inquiry'.tr}');
}
