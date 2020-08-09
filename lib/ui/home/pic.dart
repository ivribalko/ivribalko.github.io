import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Pic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Center(child: CircularProgressIndicator()),
          Center(
            child: FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: AssetImage('assets/vga.png'),
            ),
          ),
        ],
      ),
    );
  }
}
