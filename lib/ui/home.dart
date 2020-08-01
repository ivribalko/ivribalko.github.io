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
      floatingActionButton: GetBuilder<Scrolling>(
        init: Scrolling(scroll),
        builder: (x) => _FAB(extended: x.top.value),
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: SingleChildScrollView(
          controller: scroll,
          child: Column(
            children: [
              _Title(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
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
