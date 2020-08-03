import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import 'about.dart';
import 'fab.dart';
import 'footer.dart';
import 'header.dart';
import 'localization.dart';
import 'next_page.dart';
import 'pic.dart';
import 'theming.dart';

class Home extends StatelessWidget {
  final scroll = Get.put(PageController());

  Home() {
    Get.put(Scrolling(scroll));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FAB(),
      body: LayoutBuilder(
        builder: (context, constraints) {
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
                    constraints,
                    before: Header(),
                  ),
                  ..._adapted(
                    About(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('change_locale'.tr, textAlign: TextAlign.center),
                        Localization(),
                        Text('change_theme'.tr, textAlign: TextAlign.center),
                        Theming(),
                      ]..addSpacing(),
                    ),
                    constraints,
                    before: SubHeader(),
                  ),
                  ..._adapted(
                    About(),
                    Pic(),
                    constraints,
                    before: SubHeader(),
                    append: Footer(),
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
    BoxConstraints constraints, {
    Widget before,
    Widget append,
  }) {
    var narrow = constraints.isNarrow;
    if (narrow) {
      return [
        Column(
          children: [
            if (before != null) padded(child: before),
            Flexible(child: padded(child: one)),
          ]..addSpacing(),
        ),
        Column(
          children: [
            Flexible(child: padded(child: two)),
            if (append != null) padded(child: append),
          ]..addSpacing(),
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
            if (append != null) padded(child: append)
          ]..addSpacing(),
        )
      ];
    }
  }
}
