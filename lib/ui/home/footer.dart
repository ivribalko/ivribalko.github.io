import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common.dart';
import '../constant.dart';

class Footer extends StatelessWidget {
  final isMobile;
  final children = [
    SizedBox(
      height: Get.theme.buttonTheme.height,
      child: Center(child: Text('© ${'ivan_rybalko'.tr}, 2020')),
    ),
    Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _FooterButton(
          index: 0,
          icon: MdiIcons.linkedin,
          address: 'https://www.linkedin.com/in/ivan-rybalko-38b92a151/',
        ),
        _FooterButton(
          index: 1,
          icon: MdiIcons.telegram,
          address: 'https://t.me/whitepyjamas',
        ),
        _FooterButton(
          index: 2,
          icon: MdiIcons.github,
          address: 'https://github.com/whitepyjamas',
        ),
      ],
    ),
    MaterialButton(
      onPressed: mail,
      child: Text('ivan@rybalko.dev'),
    ),
  ];

  Footer({this.isMobile});

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return Column(children: children);
    } else {
      return SizedBox(
        height: kFooterHeight / 2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      );
    }
  }
}

class _FooterButton extends StatelessWidget {
  final int index;
  final IconData icon;
  final String address;
  final scrolling = Get.find<Scrolling>();

  _FooterButton({
    Key key,
    this.index,
    this.icon,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var isFooter = scrolling.isFooter.value;
      return AnimatedContainer(
        height: isFooter ? 42 : 0,
        duration: kDuration * 2,
        curve: Curves.bounceOut,
        transform: Matrix4.identity()
          ..rotateZ(isFooter ? 0 : 0.3 * (index + 1)),
        child: IconButton(
          icon: Icon(icon),
          onPressed: () => launch(address),
        ),
      );
    });
  }
}
