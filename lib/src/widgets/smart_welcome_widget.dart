import 'package:flutter/material.dart';
import 'package:smart_localize/smart_localize.dart';

import '../../main_widgets.dart';

class SmartWelcomeWidget extends StatelessWidget {
  final String firstName;
  final String? lastName;
  final String userImage;
  final double? spaceBetween;
  final double? imageSize;
  final Widget? trailing;
  final VoidCallback? onTap;
  final DateFormats? dateFormat;
  final TextStyle? dateStyle;
  final TextStyle? userNameStyle;
  final TextStyle? greetingStyle;
  const SmartWelcomeWidget({
    super.key,
    required this.firstName,
    required this.userImage,
    this.lastName,
    this.trailing,
    this.spaceBetween = 12,
    this.onTap,
    this.imageSize,
    this.dateFormat,
    this.dateStyle,
    this.userNameStyle,
    this.greetingStyle,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              SmartUserImage(
                imageSize: imageSize ?? 40.rr,
                displayName: '$firstName$lastName',
                photo: userImage,
              ),
              SizedBox(width: spaceBetween?.ww),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getFormatedDate(
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
                            context.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: getSmartResponsive(
                                mobile: 12.spp,
                                tabletPortrait: 8.spp,
                                tabletLandscape: 8.spp,
                              ),
                            ),
                      ),
                      Text(
                        ' $firstName ',
                        style: userNameStyle ??
                            context.labelSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: getSmartResponsive(
                                mobile: 12.spp,
                                tabletPortrait: 8.spp,
                                tabletLandscape: 8.spp,
                              ),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
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
    return SmartLocalize.goodMorning; // Morning greeting
  } else if (hour < 17) {
    return SmartLocalize.goodAfternoon; // Afternoon greeting
  } else {
    return SmartLocalize.goodEvening; // Evening greeting
  }
}
