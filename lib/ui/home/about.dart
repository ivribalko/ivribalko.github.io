import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';

class About extends StatelessWidget {
  const About({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Text('kDummyShort'.tr)),
        Flexible(child: Text('kDummyLarge'.tr * 2)),
      ]..addSpacing(),
    );
  }
}
