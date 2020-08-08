import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rybalko_dev/ui/theme.dart';

import 'home/screen.dart';
import 'l10n.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Get.updateLocale(Localizations.localeOf(Get.context));
    });
    return GetMaterialApp(
      title: 'Ivan Rybalko - Flutter developer in NY',
      translationsKeys: translationsKeys,
      theme: themes[ThemeMode.light],
      darkTheme: themes[ThemeMode.dark],
      home: Screen(),
    );
  }
}
