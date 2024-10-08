import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum LoadingType {
  defaultType,
  gif,
  lottie,
}

class MainLoadingWidget extends StatelessWidget {
  final LoadingType type;
  final String? path;
  const MainLoadingWidget({
    super.key,
    this.type = LoadingType.defaultType,
    this.path,
  }) : assert(
          type != LoadingType.gif || path != null,
          "path must be provided if type is gif",
        );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: getLoadingWidget(type: type),
    );
  }
}

getLoadingWidget({required LoadingType type, String? path}) {
  switch (type) {
    case LoadingType.defaultType:
      return const CircularProgressIndicator.adaptive();
    case LoadingType.gif:
      return Image.asset(
        path!,
        height: 140,
        width: 140,
      );
    case LoadingType.lottie:
      return Lottie.asset(
        path!,
        height: 140,
        width: 140,
      );
  }
}
