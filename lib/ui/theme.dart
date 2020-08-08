import 'package:flutter/material.dart';

final Map<ThemeMode, ThemeData> themes = {
  ThemeMode.light: ThemeData.light().applyButtonShape(),
  ThemeMode.dark: ThemeData.dark().applyButtonShape(),
};

extension Customize on ThemeData {
  ThemeData applyButtonShape() {
    return copyWith(
      buttonTheme: buttonTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
    );
  }
}
