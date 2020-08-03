import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Localization extends StatelessWidget {
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
