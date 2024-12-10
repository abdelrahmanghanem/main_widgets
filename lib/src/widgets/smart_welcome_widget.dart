import 'package:flutter/material.dart';

import '../../main_widgets.dart';
import '../functions/greeting_function.dart';

class SmartWelcomeWidget extends StatelessWidget {
  final Widget? trailing;
  final String userName;
  final String userImage;
  final VoidCallback? onTap;
  const SmartWelcomeWidget({
    super.key,
    this.trailing,
    required this.userName,
    required this.userImage,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          borderRadius: const BorderRadius.all(Radius.circular(50)),
          onTap: onTap,
          child: SmartUserImageWidget(
            size: 40,
            displayName: userName,
            photo: userImage,
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              getDate(
                date: DateTime.now().toString(),
                format: DateFormats.weekdayMonthDay,
              ),
              style: context.bodyMedium,
            ),
            Row(
              children: [
                Text(
                  greeting,
                  style: context.labelSmall?.copyWith(fontSize: 12),
                ),
                Text(
                  ' $userName ',
                  style: context.labelSmall?.copyWith(
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
