import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// Enum that defines the type of loading indicator to display.
enum LoadingType {
  /// Displays the default loading indicator (a circular progress indicator).
  defaultType,

  /// Displays a GIF image as the loading indicator.
  gif,

  /// Displays a Lottie animation as the loading indicator.
  lottie,
}

class SmartLoadingWidget extends StatelessWidget {
  /// Specifies the type of loading indicator to display.
  final LoadingType loadingType;

  /// The file path to the GIF or Lottie animation.
  /// This is required when using [LoadingType.gif] or [LoadingType.lottie].
  final String? path;

  const SmartLoadingWidget({
    super.key,
    this.loadingType = LoadingType.defaultType,
    this.path,
  }) : assert(
          loadingType == LoadingType.defaultType || path != null,
          "path must be provided if type is gif or lottie",
        );

  @override
  Widget build(BuildContext context) {
    final double width = 140;
    final double height = 140;
    switch (loadingType) {
      case LoadingType.defaultType:
        // Displays the default circular progress indicator.
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      case LoadingType.gif:
        // Displays a GIF image as the loading indicator.
        return Center(
          child: Image.asset(path!, height: height, width: width),
        );
      case LoadingType.lottie:
        // Displays a Lottie animation as the loading indicator.
        return Center(
          child: Lottie.asset(path!, height: height, width: width),
        );
    }
  }
}
