import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Image.asset(
            'photo-social-circle.png',
            fit: BoxFit.fill,
          ),
          Text('ivan_rybalko'.tr.toUpperCase()),
          Spacer(),
          Text('flutter_developer'.tr.toUpperCase()),
        ]..addSpacing(),
      ),
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
