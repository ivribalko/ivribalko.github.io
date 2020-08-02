import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'common.dart';
import 'constant.dart';
import 'mail.dart';

class Home extends StatelessWidget {
  final scroll = Get.put(PageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GetBuilder<Scrolling>(
        init: Scrolling(scroll),
        builder: _buildFAB,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return PageView(
            scrollDirection: Axis.vertical,
            controller: scroll,
            pageSnapping: false,
            children: [
              ...adapted(
                Flexible(child: _About()),
                _Image(),
                constraints,
                prepend: _Header(),
              ),
              ...adapted(
                _About(),
                _Image(),
                constraints,
              ),
              ...adapted(
                _About(),
                Flexible(child: _Image()),
                constraints,
                append: _Footer(),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildFAB(Scrolling x) {
    return x.isFooter.value ? SizedBox() : _FAB(extended: x.isHeader.value);
  }

  List<Widget> adapted(
    Widget one,
    Widget two,
    BoxConstraints constraints, {
    Widget prepend,
    Widget append,
  }) {
    var narrow = constraints.isNarrow;
    if (narrow) {
      return [
        prepend != null
            ? Column(children: [prepend, one]).withNextPage()
            : one.withNextPage(),
        append != null ? Column(children: [two, append]) : two.withNextPage(),
      ];
    } else {
      final row = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [one, two],
      );
      final content = prepend != null ? Column(children: [prepend, row]) : row;
      return [
        append != null
            ? Column(children: [Flexible(child: content), append])
            : content.withNextPage()
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
    return Container(
      color: Colors.yellow,
    );
  }
}

class _NextPage extends StatelessWidget {
  final scroll = Get.find<PageController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kPadding * 2,
      child: IconButton(
        icon: Icon(Icons.arrow_downward),
        onPressed: () => scroll.animateToPage(
          scroll.page.toInt() + 1,
          duration: kDuration,
          curve: Curves.easeOutQuad,
        ),
      ),
    );
  }
}

class _FAB extends StatelessWidget {
  final bool extended;
  const _FAB({
    Key key,
    this.extended,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (extended) {
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
  }
}

extension NextPageExtension on Widget {
  Widget withNextPage() {
    return Column(
      children: [
        Flexible(child: this),
        _NextPage(),
        padding,
      ]..addSpacing(),
    );
  }
}

extension NextPageListExtension on List<Widget> {
  Iterable<Widget> withNextPage() {
    return map((e) => e.withNextPage());
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
