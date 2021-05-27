import 'dart:math';

import 'package:flutter/material.dart';

class Utils {
  double screenSafeAreaHeight(BuildContext context) {
    return MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top -
        MediaQuery.of(context).padding.bottom;
  }

  double screenSafeAreaWidth(BuildContext context) {
    return MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.left -
        MediaQuery.of(context).padding.right;
  }

  Color randomColor() => Color(Random().nextInt(0xffffffff)).withAlpha(0xff);

  BorderRadius buildBorderRadius() {
    return BorderRadius.only(
        topRight: Radius.circular(20), topLeft: Radius.circular(20));
  }

  bool isLightTheme() {
    return false;
  }
}
