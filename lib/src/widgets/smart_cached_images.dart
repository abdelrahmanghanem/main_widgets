import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../main_widgets.dart';

class CustomCachedImages extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final BorderRadiusGeometry? borderRadius;
  final BoxFit fit;
  final Color? filterColor;
  final Widget? placeholder;
  final Widget? errorWidget;

  const CustomCachedImages({
    super.key,
    required this.imageUrl,
    this.filterColor = Colors.transparent,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.borderRadius,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ??
          BorderRadius.all(
            Radius.circular(radius),
          ),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          filterColor ?? Colors.transparent,
          BlendMode.darken,
        ),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          width: width,
          height: height,
          fit: fit,
          httpHeaders: const {"Access-Control-Allow-Origin": "*"},
          placeholder: (context, url) =>
              placeholder ?? const SmartLoadingWidget(),
          errorWidget: (context, url, error) =>
              errorWidget ?? const Icon(Icons.error),
        ),
      ),
    );
  }
}
