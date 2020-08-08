import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  final narrowed = Get.put(false.obs);

  Home() {
    Get.put(Scrolling(scroll));
    ever(narrowed, _update);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FAB(),
      body: Obx(() {
        return Center(
          child: SizedBox(
            width: narrowed.value ? mobileWidth - 200 : double.infinity,
            child: LayoutBuilder(
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
                          Settings(isMobile: info.isSmall),
                          info,
                          before: SubHeader(),
                        ),
                        ..._adapted(
                          About(),
                          Pic(),
                          info,
                          before: SubHeader(),
                          append: Footer(isMobile: info.isSmall),
                        ),
                      ]..addAppear(Get.find<Scrolling>(), scroll),
                    ),
                    NextPage(),
                  ],
                );
              },
            ),
          ),
        );
      }),
    );
  }

  dynamic _update(dynamic narrowed) {
    if (narrowed) {
      scroll.jumpToPage(scroll.page.round() * 2 + 1);
    } else {
      scroll.jumpToPage((scroll.page / 2).floor());
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.find<Scrolling>().forceUpdate(); // update next page visible
    });
  }

  List<Widget> _adapted(
    Widget one,
    Widget two,
    BoxConstraints info, {
    Widget before,
    Widget append,
  }) {
    if (info.isSmall) {
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: kMaxWidth),
                      child: padded(child: one),
                    ),
                  ),
                  Flexible(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: kMaxWidth),
                      child: padded(child: two),
                    ),
                  ),
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
