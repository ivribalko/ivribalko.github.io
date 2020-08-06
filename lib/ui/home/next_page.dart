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
          child: padded(
            child: SizedBox(
              width: kFooterHeight,
              height: kFooterHeight,
              child: AnimatedContainer(
                decoration: _buildBoxDecoration(),
                duration: kDuration,
                curve: Curves.easeIn,
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
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
      color: Get.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(
        scrolling.isHeader.value ? 0 : 45,
      )),
      boxShadow: [
        if (!scrolling.isHeader.value)
          BoxShadow(
            color: Get.theme.accentColor,
            offset: Offset(0, 3),
          ),
        if (!scrolling.isHeader.value)
          BoxShadow(
            color: Get.theme.accentColor,
            offset: Offset(0, -2),
          ),
      ],
    );
  }
}
