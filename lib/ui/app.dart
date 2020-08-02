import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rybalko_dev/ui/theme.dart';

import 'home.dart';
import 'l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ivan Rybalko',
      translationsKeys: translationsKeys,
      theme: theme,
      home: Home(),
    );
  }
}
