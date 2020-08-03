import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('ivan_rybalko'.tr.toUpperCase()),
        Text('flutter_developer'.tr.toUpperCase()),
        Spacer(),
        Text('unity_developer'.tr.toUpperCase()),
      ]..addSpacing(),
    );
  }
}

class SubHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'kDummyShort'.tr.toUpperCase(),
      textAlign: TextAlign.center,
      style: Get.textTheme.headline2,
    );
  }
}
