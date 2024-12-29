import 'package:flutter/material.dart';
import 'package:main_widgets/main_widgets.dart';

double getSmartResponsive({
  required double mobile,
  double? tabletPortrait,
  double? tabletLandscape,
  String? text,
}) {
  final isLandscape = WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.width >
      WidgetsBinding
          .instance.platformDispatcher.views.first.physicalSize.height;

  if (MainWidgetsUtil.isTablet) {
    if (isLandscape) {
      return tabletLandscape ?? tabletPortrait ?? mobile;
    } else {
      return tabletPortrait ?? mobile;
    }
  }
  return mobile;
}
