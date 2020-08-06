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
        opacity: scrolling.isFooter.value ? 0 : 1,
        child: scrolling.isHeader.value
            ? FloatingActionButton.extended(
                onPressed: mail,
                label: Text('email_me'.tr),
                icon: Icon(Icons.email),
              )
            : FloatingActionButton(
                onPressed: mail,
                child: Icon(Icons.email),
              ),
      );
    });
  }
}
