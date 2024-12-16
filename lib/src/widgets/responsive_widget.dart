import 'package:flutter/material.dart';
import 'package:main_widgets/main_widgets.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tabletPortrait;
  final Widget? tabletLandscape;
  const ResponsiveWidget({
    super.key,
    required this.mobile,
    this.tabletPortrait,
    this.tabletLandscape,
  });

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      if (MainWidgetsUtil.isTablet) {
        if (!context.isLandscape) {
          return tabletPortrait ?? mobile;
        } else {
          return tabletLandscape ?? tabletPortrait ?? mobile;
        }
      }

      return mobile;
    });
  }
}

double getResponsiveSize({
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

double getResponsiveTabletSize({
  required double s,
  double? m,
  double? l,
  double? xl,
}) {
  final scaleHeight = MainWidgetsUtil().scaleHeight;
  if (scaleHeight <= 0.8) {
    return s;
  } else if (scaleHeight <= 0.9) {
    return m ?? s;
  } else if (scaleHeight <= 1) {
    return l ?? m ?? s;
  } else {
    return xl ?? l ?? m ?? s;
  }
}
