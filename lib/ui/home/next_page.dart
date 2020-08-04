import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../constant.dart';

class NextPage extends StatelessWidget {
  final scroll = Get.find<PageController>();
  final scrolling = Get.find<Scrolling>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (scrolling.isFooter.value) {
          return SizedBox();
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: kFooterHeight,
            height: kFooterHeight,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () => scroll.animateToPage(
                  scroll.page.toInt() + 1,
                  duration: kDuration,
                  curve: Curves.easeOutQuad,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
