import 'package:flutter/material.dart';

abstract class OverlayWidget {
  static Future showBottomSheet(
      {required BuildContext context, required Widget widget}) {
    return showModalBottomSheet(
        scrollControlDisabledMaxHeightRatio: 0.7,
        context: context,
        builder: (context) => widget);
  }
}
