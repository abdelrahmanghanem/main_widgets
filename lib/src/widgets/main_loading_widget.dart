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

/// A [MainLoadingWidget] that displays a loading indicator based on the specified [LoadingType].
/// It supports three types of loading indicators: a default spinner, a GIF, and a Lottie animation.
class MainLoadingWidget extends StatelessWidget {
  /// Specifies the type of loading indicator to display.
  final LoadingType type;

  /// The file path to the GIF or Lottie animation.
  /// This is required when using [LoadingType.gif] or [LoadingType.lottie].
  final String? path;

  const MainLoadingWidget({
    super.key,
    this.type = LoadingType.defaultType,
    this.path,
  }) : assert(
          type == LoadingType.defaultType || path != null,
          "path must be provided if type is gif or lottie",
        );

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case LoadingType.defaultType:
        // Displays the default circular progress indicator.
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      case LoadingType.gif:
        // Displays a GIF image as the loading indicator.
        return Center(
          child: Image.asset(
            path!,
            height: 140,
            width: 140,
          ),
        );
      case LoadingType.lottie:
        // Displays a Lottie animation as the loading indicator.
        return Center(
          child: Lottie.asset(
            path!,
            height: 140,
            width: 140,
          ),
        );
    }
  }
}
