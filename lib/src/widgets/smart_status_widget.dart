import 'package:flutter/material.dart';
import 'package:main_widgets/main_widgets.dart';

class SmartStatusWidget extends StatelessWidget {
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Widget child;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const SmartStatusWidget({
    super.key,
    this.height = 26,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    required this.text,
    required this.child,
    this.style,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topRight,
      children: [
        child,
        PositionedDirectional(
          end: 0,
          height: height,
          child: StatusWidget(
            height: height,
            borderRadius: borderRadius,
            backgroundColor: backgroundColor,
            textColor: textColor,
            text: text,
            padding: padding,
          ),
        ),
      ],
    );
  }
}

class StatusWidget extends StatelessWidget {
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final double radius;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;

  const StatusWidget({
    super.key,
    required this.text,
    this.height = 26,
    this.borderRadius,
    this.backgroundColor,
    this.textColor,
    this.radius = 10,
    this.style,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ?? BorderRadius.all(Radius.circular(radius)),
      ),
      child: Center(
        child: Text(
          text,
          style: style ??
              context.labelMedium?.copyWith(
                color: textColor,
              ),
        ),
      ),
    );
  }
}
