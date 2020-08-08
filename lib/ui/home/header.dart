import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../constant.dart';

const double sun = kFooterHeight + 30;

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sun,
      child: Row(
        children: [
          _Image(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ivan_rybalko'.tr.toUpperCase(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('flutter_developer'.tr.toUpperCase())
            ],
          ),
        ]..addSpacing(),
      ),
    );
  }
}

class SubHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kFooterHeight,
      child: Text(
        'kDummyShort'.tr.toUpperCase(),
        textAlign: TextAlign.center,
        style: Get.textTheme.headline4,
      ),
    );
  }
}

class _Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: StarClipper(12),
          child: Container(
            height: sun,
            color: Colors.yellowAccent,
            child: SizedBox(
              width: sun,
              height: sun,
            ),
          ),
        ),
        SizedBox(
          width: sun,
          height: sun,
          child: Center(
            child: SizedBox(
              width: kFooterHeight,
              height: kFooterHeight,
              child: Image.asset(
                'assets/photo-social-circle.png',
              ),
            ),
          ),
        )
      ],
    );
  }
}
