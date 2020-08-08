import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('kDummyShort'.tr),
        Text('kDummyLarge'.tr * 2),
      ]..addSpacing(),
    );
  }
}
