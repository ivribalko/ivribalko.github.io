import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rybalko_dev/ui/constant.dart';
import 'package:url_launcher/url_launcher.dart';

class Scrolling extends GetxController {
  final page = 0.obs;
  final offset = 0.0.obs;
  final isHeader = true.obs;
  final isFooter = false.obs;
  final PageController scroll;

  Scrolling(this.scroll) {
    scroll.addListener(_update);
  }

  @override
  void onClose() {
    scroll.removeListener(_update);
    super.onClose();
  }

  void forceUpdate() {
    offset.value -= 1;
    offset.value += 1;
    _update();
  }

  void _update() {
    const diff = kFooterHeight + 50;
    page.value = scroll.page.round();
    offset.value = scroll.offset;
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

  void addAppear(Scrolling scrolling) {
    for (var i = length - 1; i >= 0; i--) {
      var child = this[i];
      this[i] = Obx(() {
        return Opacity(
          opacity: (1.2 - (i - scrolling.page.value).abs()).clamp(0, 1),
          child: child,
        );
      });
    }
  }
}

const double mobileWidth = 700;

extension ConstraintsExtension on BoxConstraints {
  bool get isSmall {
    return maxWidth < mobileWidth || maxWidth * maxHeight < 400 * 1000;
  }
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
