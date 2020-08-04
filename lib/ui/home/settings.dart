import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../theme.dart';

class Settings extends StatelessWidget {
  final bool isMobile;

  const Settings({this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('change_locale'.tr, textAlign: TextAlign.center),
        _Localization(),
        Text('change_theme'.tr, textAlign: TextAlign.center),
        _Theming(),
        if (!isMobile) Text('change_display'.tr, textAlign: TextAlign.center),
        if (!isMobile) _Adaptivity(),
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
        child: Text(
          key,
          style: _accentActive(value),
        ),
        onPressed: () => Get.updateLocale(value),
      ),
    );
  }

  TextStyle _accentActive(value) {
    return value == Get.locale ? TextStyle(color: Get.theme.accentColor) : null;
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
        child: Text(
          key.tr,
          style: _accentActive(value),
        ),
        onPressed: () {
          Get.changeThemeMode(value);
          // fix text not updating style/color
          Future.delayed(
            Duration(milliseconds: 100),
            () => Get.updateLocale(Get.locale),
          );
        },
      ),
    );
  }

  TextStyle _accentActive(ThemeMode value) {
    return (value == ThemeMode.dark) ==
            (Get.theme.brightness == Brightness.dark)
        ? TextStyle(color: Get.theme.accentColor)
        : null;
  }
}

class _Adaptivity extends StatelessWidget {
  final setMobile = false.obs;

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
        child: Text(
          key.tr,
          style: _accentActive(value),
        ),
        onPressed: () {
          Get.changeThemeMode(value);
          // fix text not updating style/color
          Future.delayed(
            Duration(milliseconds: 100),
            () => Get.updateLocale(Get.locale),
          );
        },
      ),
    );
  }

  TextStyle _accentActive(ThemeMode value) {
    return (value == ThemeMode.dark) ==
            (Get.theme.brightness == Brightness.dark)
        ? TextStyle(color: Get.theme.accentColor)
        : null;
  }
}
