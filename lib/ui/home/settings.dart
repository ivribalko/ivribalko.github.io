import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common.dart';
import '../constant.dart';
import '../theme.dart';

class Settings extends StatelessWidget {
  final bool? isSmall;

  Settings({this.isSmall});

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
        if (_canNarrow) _Responsiveness(),
      ]..addSpacing(),
    );
  }

  bool get _canNarrow => !isSmall! || Get.find<RxBool>().value!;
}

class _Localization extends _Toggle<Locale> {
  @override
  List<Locale> getValues() => locales;

  @override
  bool isCurrent(Locale value) => value.languageCode == Get.locale!.languageCode;

  @override
  Widget toWidget(Locale value) {
    return MaterialButton(
      onPressed: () => Get.updateLocale(value),
      child: Text(
        value == Locale('en', 'US') ? 'English' : 'Русский',
        style: styleFor(value),
      ),
    );
  }
}

class _Theming extends _Toggle<ThemeMode> {
  @override
  List<ThemeMode> getValues() => themes.keys.toList();

  @override
  bool isCurrent(ThemeMode value) {
    return (value == ThemeMode.dark) == (Get.isDarkMode);
  }

  @override
  Widget toWidget(ThemeMode value) {
    return MaterialButton(
      onPressed: () {
        Get.changeThemeMode(value);
        _fixUpdating();
      },
      child: Text(
        value.toString().tr,
        style: styleFor(value),
      ),
    );
  }

  Future<dynamic> _fixUpdating() {
    return Future.delayed(
      Duration(milliseconds: 100),
      () {
        Get.updateLocale(Get.locale!);
        Future.delayed(
          Duration(milliseconds: 100),
          () => Get.updateLocale(Get.locale!),
        );
      },
    );
  }
}

class _Responsiveness extends _Toggle<bool> {
  final narrowed = Get.find<RxBool>();

  @override
  List<bool> getValues() => [false, true];

  @override
  bool isCurrent(bool value) => narrowed.value == value;

  @override
  Widget toWidget(bool value) {
    return MaterialButton(
      onPressed: () => narrowed.value = value,
      child: Text(
        value ? 'narrowed_on'.tr : 'narrowed_off'.tr,
        style: styleFor(value),
      ),
    );
  }
}

abstract class _Toggle<T> extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...getValues().map(toWidget),
      ],
    );
  }

  @protected
  List<T> getValues();

  @protected
  bool isCurrent(T value);

  @protected
  Widget toWidget(T value);

  TextStyle? styleFor(T value) {
    return isCurrent(value) ? TextStyle(color: Get.theme!.accentColor) : null;
  }
}
