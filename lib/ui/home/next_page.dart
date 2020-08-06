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
        var isFooter = scrolling.isFooter.value;
        return IgnorePointer(
          ignoring: isFooter ? true : false,
          child: AnimatedOpacity(
            duration: kDuration,
            curve: kCurve,
            opacity: isFooter ? 0 : 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: padded(
                child: SizedBox(
                  width: kFooterHeight,
                  height: kFooterHeight,
                  child: AnimatedContainer(
                    decoration: _buildBoxDecoration(),
                    duration: kDuration,
                    curve: kCurve,
                    child: Material(
                      type: MaterialType.circle,
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
            ),
          ),
        );
      },
    );
  }

  BoxDecoration _buildBoxDecoration() {
    var isHeader = scrolling.isHeader.value;
    return BoxDecoration(
      color: Get.theme.scaffoldBackgroundColor,
      borderRadius: BorderRadius.all(Radius.circular(
        isHeader ? 0 : 45,
      )),
      boxShadow: [
        BoxShadow(
          color: isHeader ? Colors.transparent : Get.theme.accentColor,
          offset: Offset(0, 3),
        ),
        BoxShadow(
          color: isHeader ? Colors.transparent : Get.theme.accentColor,
          offset: Offset(0, -2),
        ),
      ],
    );
  }
}
