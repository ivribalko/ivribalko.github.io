import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rybalko_dev/ui/theme.dart';

import 'home/screen.dart';
import 'l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ivan Rybalko - Flutter developer in NY',
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      translationsKeys: translationsKeys,
      theme: themes[ThemeMode.light],
      darkTheme: themes[ThemeMode.dark],
      home: Screen(),
    );
  }
}
