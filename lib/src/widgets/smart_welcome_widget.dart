import 'package:flutter/material.dart';
import 'package:main_widgets/src/screen_util/size_extension.dart';
import 'package:smart_localize/smart_localize.dart';

import '../../main_widgets.dart';

class SmartWelcomeWidget extends StatelessWidget {
  final String userName;
  final String userImage;
  final double? imageSize;
  final Widget? trailing;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final DateFormats? dateFormat;
  final TextStyle? dateStyle;
  final TextStyle? userNameStyle;
  final TextStyle? greetingStyle;
  const SmartWelcomeWidget({
    super.key,
    required this.userName,
    required this.userImage,
    this.trailing,
    this.onTap,
    this.imageSize,
    this.borderRadius,
    this.dateFormat,
    this.dateStyle,
    this.userNameStyle,
    this.greetingStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius:
              borderRadius ?? const BorderRadius.all(Radius.circular(50)).r,
          onTap: onTap,
          child: SmartUserImage(
            imageSize: imageSize ?? 40.r,
            displayName: userName,
            photo: userImage,
          ),
        ),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getDate(
                date: DateTime.now().toString(),
                format: dateFormat ?? DateFormats.weekdayMonthDay,
              ),
              style: dateStyle ?? context.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  _greeting,
                  style: greetingStyle ??
                      context.labelSmall?.copyWith(fontSize: 12),
                ),
                Text(
                  ' $userName ',
                  style: userNameStyle ??
                      context.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}

String get _greeting {
  final hour = DateTime.now().hour;
  if (hour < 12) {
    return SmartLocalize.goodMorning;
  }
  if (hour < 17) {
    return SmartLocalize.goodAfternoon;
  }
  return SmartLocalize.goodEvening;
}
