import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common.dart';
import '../constant.dart';

class Footer extends StatelessWidget {
  final isSmall;
  final children = [
    SizedBox(
      height: Get.theme.buttonTheme.height,
      child: Center(child: Text('© ${'ivan_rybalko'.tr}, 2020')),
    ),
    Obx(
      () {
        var isFooter = Get.find<Scrolling>().isFooter.value;
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _FooterButton(
              index: 0,
              icon: MdiIcons.linkedin,
              address: 'https://www.linkedin.com/in/ivan-rybalko-38b92a151/',
            ),
            _animatedPadding(isFooter),
            _FooterButton(
              index: 1,
              icon: MdiIcons.telegram,
              address: 'https://t.me/whitepyjamas',
            ),
            _animatedPadding(isFooter),
            _FooterButton(
              index: 2,
              icon: MdiIcons.github,
              address: 'https://github.com/whitepyjamas',
            ),
          ],
        );
      },
    ),
    MaterialButton(
      onPressed: mail,
      child: Text(
        'ivan@rybalko.dev',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    ),
  ];

  static Widget _animatedPadding(bool isFooter) {
    return AnimatedContainer(
      width: isFooter ? 0 : 50,
      duration: isFooter ? kDuration : Duration(milliseconds: 0),
      curve: Curves.bounceOut,
    );
  }

  Footer({this.isSmall});

  @override
  Widget build(BuildContext context) {
    if (isSmall) {
      return Column(children: children);
    } else {
      return SizedBox(
        height: kFooterHeight,
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
  final RxBool entered = false.obs;
  static const double size = kFooterHeight;

  _FooterButton({
    Key key,
    this.index,
    this.icon,
    this.address,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => entered.value = true,
      onExit: (_) => entered.value = false,
      child: SizedBox(
        width: size,
        height: size,
        child: IconButton(
          icon: Icon(icon),
          onPressed: () => launch(address),
        ),
      ),
    );
  }
}
