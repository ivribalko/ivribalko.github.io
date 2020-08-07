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
          icon: MdiIcons.linkedin,
          address: 'https://www.linkedin.com/in/ivan-rybalko-38b92a151/',
        ),
        _FooterButton(
          icon: MdiIcons.telegram,
          address: 'https://t.me/whitepyjamas',
        ),
        _FooterButton(
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
  final IconData icon;
  final String address;

  const _FooterButton({
    Key key,
    this.icon,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon),
      onPressed: () => launch(address),
    );
  }
}
