import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../constant.dart';

class FAB extends StatelessWidget {
  final scrolling = Get.find<Scrolling>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var isHeader = scrolling.isHeader.value;
      var isFooter = scrolling.isFooter.value;
      return IgnorePointer(
        ignoring: isFooter,
        child: AnimatedOpacity(
          duration: kDuration,
          curve: kCurve,
          opacity: isFooter ? 0 : 1,
          child: Padding(
            padding: EdgeInsets.only(bottom: kPadding / 2),
            child: FloatingActionButton.extended(
              onPressed: mail,
              label: AnimatedCrossFade(
                duration: kDuration,
                firstCurve: kCurve,
                secondCurve: kCurve,
                sizeCurve: kCurve,
                firstChild: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.email),
                    if (isHeader) Text('email_me'.tr),
                  ]..addSpacing(factor: 0.5),
                ),
                secondChild: Icon(Icons.email),
                crossFadeState: isHeader
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
              ),
            ),
          ),
        ),
      );
    });
  }
}
