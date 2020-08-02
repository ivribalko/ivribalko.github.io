import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common.dart';
import 'constant.dart';
import 'mail.dart';

class Home extends StatelessWidget {
  final scroll = Get.put(PageController());

  Home() {
    Get.put(Scrolling(scroll));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _FAB(),
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
                    _About(),
                    _Image(),
                    constraints,
                    before: _Header(),
                  ),
                  ..._adapted(
                    _About(),
                    _Image(),
                    constraints,
                  ),
                  ..._adapted(
                    _About(),
                    _Image(),
                    constraints,
                    append: _Footer(),
                  ),
                ],
              ),
              _NextPage(),
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
        Column(children: [if (before != null) before, Flexible(child: one)]),
        Column(children: [Flexible(child: two), if (append != null) append]),
      ];
    } else {
      return [
        Column(children: [
          if (before != null) before,
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [Flexible(child: one), Flexible(child: two)],
            ),
          ),
          if (append != null) append
        ])
      ];
    }
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kPadding * 4,
      child: Row(
        children: [
          Text('Ivan Rybalko'.toUpperCase()),
          Text('Flutter designer and developer'.toUpperCase()),
          Spacer(),
          Text('Experienced Unity developer'.toUpperCase()),
        ]..addSpacing(),
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kPadding * 4,
      child: Row(
        children: [
          Text('© Ivan Rybalko, 2020'),
          Spacer(),
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
          Spacer(),
          OutlineButton(
            onPressed: _showBottomSheet,
            child: Text('ivan@rybalko.dev'),
          ),
        ]..addSpacing(),
      ),
    );
  }
}

class _About extends StatelessWidget {
  const _About({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Text(kDummyShort)),
        Flexible(child: Text(kDummyLarge + kDummyLarge)),
      ],
    );
  }
}

class _Image extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset('vga.png'));
  }
}

class _NextPage extends StatelessWidget {
  final scroll = Get.find<PageController>();
  final scrolling = Get.find<Scrolling>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (scrolling.isFooter.value) {
          return SizedBox();
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: padded(
            factor: 5,
            child: Material(
              color: Colors.transparent,
              child: IconButton(
                icon: Icon(Icons.arrow_downward),
                onPressed: () => scroll.animateToPage(
                  scroll.page.toInt() + 1,
                  duration: kDuration,
                  curve: Curves.easeOutQuad,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _FAB extends StatelessWidget {
  final scrolling = Get.find<Scrolling>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (scrolling.isFooter.value) {
        return SizedBox();
      }
      if (scrolling.isHeader.value) {
        return FloatingActionButton.extended(
          onPressed: _showBottomSheet,
          label: Text('Contact'),
          icon: Icon(Icons.email),
        );
      } else {
        return FloatingActionButton(
          onPressed: _showBottomSheet,
          child: Icon(Icons.email),
        );
      }
    });
  }
}

Future _showBottomSheet() {
  return Get.bottomSheet(
    Mail(),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
  );
}
