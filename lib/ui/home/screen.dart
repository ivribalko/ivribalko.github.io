import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../constant.dart';
import '../stack.dart';
import 'about.dart';
import 'animated_text.dart';
import 'fab.dart';
import 'footer.dart';
import 'header.dart';
import 'next_page.dart';
import 'pic.dart';
import 'settings.dart';

class Screen extends StatelessWidget {
  final scroll = Get.put(PageController());
  final narrowed = Get.put(false.obs);

  Screen() {
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
                return StackWithAllChildrenReceiveEvents(
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
                        ),
                        ..._adapted(
                          About(),
                          Pic(),
                          info,
                          append: Footer(isMobile: info.isSmall),
                        ),
                      ],
                    ),
                    _Fader(Alignment.topCenter),
                    _Fader(Alignment.bottomCenter),
                    _Title(),
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

class _Fader extends StatelessWidget {
  final Alignment alignment;
  final scrolling = Get.find<Scrolling>();

  _Fader(this.alignment);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var isMiddle = !scrolling.isHeader.value && !scrolling.isFooter.value;
      return Align(
        alignment: alignment,
        child: AnimatedContainer(
          duration: kDuration,
          curve: kCurve,
          height: isMiddle ? Get.height * 0.10 : 0,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: alignment,
              end: Alignment(-1 * alignment.x, -1 * alignment.y),
              colors: [
                Get.theme.scaffoldBackgroundColor,
                Get.theme.scaffoldBackgroundColor.withOpacity(0),
              ],
            ),
          ),
        ),
      );
    });
  }
}

class _Title extends StatelessWidget {
  final scrolling = Get.find<Scrolling>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: kPadding * 2),
      child: Obx(() {
        return Align(
          alignment: Alignment.topCenter,
          child: AnimatedText(
            index: scrolling.page.value,
            items: [
              '',
              'here is a title',
              'a short one',
              'and max width is this',
              'ending soon',
              'end',
            ],
          ),
        );
      }),
    );
  }
}
