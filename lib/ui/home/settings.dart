import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../constant.dart';
import '../theme.dart';

class Settings extends StatelessWidget {
  final bool isMobile;
  final narrowed = Get.find<RxBool>();

  Settings({this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('change_locale'.tr, textAlign: TextAlign.center),
        _Localization(),
        Text('change_theme'.tr, textAlign: TextAlign.center),
        _Theming(),
        if (_canNarrow) Text('change_display'.tr, textAlign: TextAlign.center),
        if (_canNarrow) _Adaptivity(),
      ]..addSpacing(),
    );
  }

  bool get _canNarrow => !isMobile || narrowed.value;
}

class _Localization extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [...locales.values.map(_toWidget)],
    );
  }

  Widget _toWidget(Locale value) {
    return MaterialButton(
      child: Text(
        value.toString().tr,
        style: _styleFor(value),
      ),
      onPressed: () => Get.updateLocale(value),
    );
  }

  TextStyle _styleFor(value) {
    return value == Get.locale ? TextStyle(color: Get.theme.accentColor) : null;
  }
}

class _Theming extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [...themes.keys.map(_toWidget)],
    );
  }

  Widget _toWidget(ThemeMode value) {
    return MaterialButton(
      child: Text(
        value.toString().tr,
        style: _styleFor(value),
      ),
      onPressed: () {
        Get.changeThemeMode(value);
        // fix text not updating style/color
        Future.delayed(
          Duration(milliseconds: 100),
          () => Get.updateLocale(Get.locale),
        );
      },
    );
  }

  TextStyle _styleFor(ThemeMode value) {
    return (value == ThemeMode.dark) == (Get.isDarkMode)
        ? TextStyle(color: Get.theme.accentColor)
        : null;
  }
}

class _Adaptivity extends StatelessWidget {
  final narrowed = Get.find<RxBool>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...[false, true].map(_toWidget)
      ],
    );
  }

  Widget _toWidget(bool value) {
    return MaterialButton(
      child: Text(
        value ? 'narrowed_on'.tr : 'narrowed_off'.tr,
        style: _styleFor(value),
      ),
      onPressed: () => narrowed.value = value,
    );
  }

  TextStyle _styleFor(bool value) {
    return narrowed.value == value
        ? TextStyle(color: Get.theme.accentColor)
        : null;
  }
}
