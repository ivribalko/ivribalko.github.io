import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'common.dart';
import 'constant.dart';
import 'mail.dart';

class Home extends StatelessWidget {
  final scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: GetBuilder<Scrolling>(
        init: Scrolling(scroll),
        builder: (x) => _FAB(extended: x.top.value),
      ),
      body: SingleChildScrollView(
        controller: scroll,
        child: Column(
          children: List.generate(
            30,
            (index) => Text(dummyLarge),
          ),
        ),
      ),
    );
  }

  AppBar get _appBar {
    return AppBar(
      title: Text(
        dummyShort,
        style: Get.textTheme.headline1,
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
