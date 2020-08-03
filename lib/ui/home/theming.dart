import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme.dart';

class Theming extends StatelessWidget {
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
