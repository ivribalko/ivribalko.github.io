import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';

class FAB extends StatelessWidget {
  final scrolling = Get.find<Scrolling>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (scrolling.isFooter.value) {
        return SizedBox();
      }
      if (scrolling.isHeader.value) {
        return FloatingActionButton.extended(
          onPressed: mail,
          label: Text('email_me'.tr),
          icon: Icon(Icons.email),
        );
      } else {
        return FloatingActionButton(
          onPressed: mail,
          child: Icon(Icons.email),
        );
      }
    });
  }
}
