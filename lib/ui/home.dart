import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';
import 'mail.dart';

class Home extends StatelessWidget {
  final scroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      floatingActionButton: _FAB(),
      body: ListView(
        controller: scroll,
        children: [
          ...List.generate(
            30,
            (index) => Text(dummyLarge),
          )
        ],
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
  const _FAB({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: _showBottomSheet,
      label: Text('Mail'),
      icon: Icon(Icons.email),
    );
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
