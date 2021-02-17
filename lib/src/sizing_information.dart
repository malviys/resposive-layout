import 'package:flutter/material.dart';
import 'package:responsive_layout/src/enums.dart';

class SizingInformation {
  final Size screenSize;
  final Size localWidgetSize;
  final Orientation screenOrientation;

  SizingInformation({
    @required this.screenSize,
    @required this.localWidgetSize,
    @required this.screenOrientation,
  });

  ScreenType get screenType {
    final shortestSide = screenSize.shortestSide;

    if (shortestSide <= 200) {
      return ScreenType.XS;
    }

    if (shortestSide <= 320) {
      return ScreenType.S;
    }

    if (shortestSide <= 480) {
      return ScreenType.L;
    }

    if (shortestSide <= 800) {
      return ScreenType.XL;
    }

    return ScreenType.XXL;
  }
}
