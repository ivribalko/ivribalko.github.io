import 'package:flutter/material.dart';
import 'package:rybalko_dev/ui/theme.dart';

import 'home.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ivan Rybalko',
      theme: theme,
      home: Home(),
    );
  }
}
