import 'package:flutter/material.dart';
import 'package:main_widgets/main_widgets.dart';

class SmartStatusWidget extends StatelessWidget {
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final Widget child;
  const SmartStatusWidget({
    super.key,
    this.height = 26,
    this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    required this.child,
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
          height: 26,
          child: StatusWidget(
            height: height,
            borderRadius: borderRadius,
            backgroundColor: backgroundColor,
            textColor: textColor,
            text: text,
          ),
        ),
      ],
    );
  }
}

class StatusWidget extends StatelessWidget {
  final double height;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double radius;

  const StatusWidget({
    super.key,
    this.height = 26,
    this.borderRadius,
    required this.backgroundColor,
    required this.textColor,
    required this.text,
    this.radius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius ??
            (context.isArabic
                ? BorderRadius.only(
                    topLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(radius),
                    bottomLeft: Radius.circular(radius),
                  )),
      ),
      child: Center(
        child: Text(
          text,
          style: context.labelMedium?.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
