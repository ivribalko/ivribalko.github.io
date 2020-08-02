import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rybalko_dev/ui/constant.dart';

import 'common.dart';
import 'mail.dart';

class Home extends StatelessWidget {
  final scroll = Get.put(PageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: GetBuilder<Scrolling>(
        init: Scrolling(scroll),
        builder: (x) => _FAB(extended: x.top.value),
      ),
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: scroll,
        children: [
          _Title(),
          _Title(),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: padding * 2,
          child: Row(
            children: [
              Text('Ivan Rybalko'.toUpperCase()),
              Text('Flutter designer and developer'.toUpperCase()),
              Spacer(),
              Text('Experienced Unity developer'.toUpperCase()),
            ]..addSpacing(),
          ),
        ),
        Expanded(child: _Greeting()),
        _NextPage(),
      ],
    );
  }
}

class _NextPage extends StatelessWidget {
  final scroll = Get.find<PageController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: padding * 2,
      child: IconButton(
        icon: Icon(Icons.arrow_downward),
        onPressed: () => scroll.animateToPage(
          scroll.page.toInt() + 1,
          duration: duration,
          curve: Curves.easeOutQuad,
        ),
      ),
    );
  }
}

class _Greeting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: Column(
            children: [
              Spacer(),
              Flexible(child: Text(dummyShort)),
              Flexible(child: Text(dummyLarge)),
              Spacer(),
            ],
          ),
        ),
        Flexible(
          child: Container(
            color: Colors.yellow,
          ),
        ),
      ],
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
    ;
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
}
