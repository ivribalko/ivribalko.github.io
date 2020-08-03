import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('© ${'ivan_rybalko'.tr}, 2020'),
        Spacer(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(MdiIcons.linkedin),
              onPressed: () =>
                  launch('https://www.linkedin.com/in/ivan-rybalko-38b92a151/'),
            ),
            IconButton(
              icon: Icon(MdiIcons.telegram),
              onPressed: () => launch('https://t.me/whitepyjamas'),
            ),
            IconButton(
              icon: Icon(MdiIcons.github),
              onPressed: () => launch('https://github.com/whitepyjamas'),
            ),
          ],
        ),
        Spacer(),
        MaterialButton(
          onPressed: mail,
          child: Text('ivan@rybalko.dev'),
        ),
      ]..addSpacing(),
    );
  }
}
