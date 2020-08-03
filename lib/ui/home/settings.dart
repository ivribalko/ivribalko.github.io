import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../theme.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('change_locale'.tr, textAlign: TextAlign.center),
        _Localization(),
        Text('change_theme'.tr, textAlign: TextAlign.center),
        _Theming(),
      ]..addSpacing(),
    );
  }
}

class _Localization extends StatelessWidget {
  final supported = {
    'English': Locale('en', 'US'),
    'Русский': Locale('ru', 'RU'),
  };

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [...supported.map(_toWidget).values],
    );
  }

  MapEntry<String, MaterialButton> _toWidget(key, value) {
    return MapEntry(
      key,
      MaterialButton(
        child: Text(key),
        onPressed: () => Get.updateLocale(value),
      ),
    );
  }
}

class _Theming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [...modes.map(_toWidget).values],
    );
  }

  MapEntry<String, MaterialButton> _toWidget(String key, ThemeMode value) {
    return MapEntry(
      key,
      MaterialButton(
        child: Text(key.tr),
        onPressed: () => Get.changeThemeMode(value),
      ),
    );
  }
}
