import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../common.dart';
import '../constant.dart';
import 'about.dart';
import 'fab.dart';
import 'footer.dart';
import 'header.dart';
import 'next_page.dart';
import 'pic.dart';
import 'settings.dart';

class Home extends StatelessWidget {
  final scroll = Get.put(PageController());

  Home() {
    Get.put(Scrolling(scroll));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FAB(),
      body: ResponsiveBuilder(
        builder: (context, info) {
          return Stack(
            children: [
              PageView(
                scrollDirection: Axis.vertical,
                controller: scroll,
                pageSnapping: false,
                children: [
                  ..._adapted(
                    About(),
                    Pic(),
                    info,
                    before: Header(),
                  ),
                  ..._adapted(
                    About(),
                    Settings(),
                    info,
                    before: SubHeader(),
                  ),
                  ..._adapted(
                    About(),
                    Pic(),
                    info,
                    before: SubHeader(),
                    append: Footer(isMobile: info.isMobile),
                  ),
                ],
              ),
              NextPage(),
            ],
          );
        },
      ),
    );
  }

  List<Widget> _adapted(
    Widget one,
    Widget two,
    SizingInformation info, {
    Widget before,
    Widget append,
  }) {
    if (info.isMobile) {
      return [
        Column(
          children: [
            if (before != null) padded(child: before),
            Flexible(child: padded(child: one)),
            padded(),
          ],
        ),
        Column(
          children: [
            Flexible(child: padded(child: two)),
            if (append != null) padded(child: append),
          ],
        ),
      ];
    } else {
      return [
        Column(
          children: [
            if (before != null) padded(child: before),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(child: padded(child: one)),
                  Flexible(child: padded(child: two)),
                ]..addSpacing(),
              ),
            ),
            SizedBox(height: kFooterHeight),
            if (append != null) padded(child: append)
          ]..addSpacing(),
        )
      ];
    }
  }
}
