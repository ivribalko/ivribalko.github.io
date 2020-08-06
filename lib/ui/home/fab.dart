import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../constant.dart';

class FAB extends StatelessWidget {
  final scrolling = Get.find<Scrolling>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AnimatedOpacity(
        duration: kDuration,
        curve: kCurve,
        opacity: scrolling.isFooter.value ? 0 : 1,
        child: Padding(
          padding: EdgeInsets.only(bottom: kPadding),
          child: FloatingActionButton.extended(
            onPressed: mail,
            label: AnimatedCrossFade(
              duration: kDuration,
              firstCurve: kCurve,
              secondCurve: kCurve,
              sizeCurve: kCurve,
              firstChild: Row(
                children: [
                  Icon(Icons.email),
                  Text('email_me'.tr),
                ]..addSpacing(factor: 0.5),
              ),
              secondChild: Icon(Icons.email),
              crossFadeState: scrolling.isHeader.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
            ),
          ),
        ),
      );
    });
  }
}
