import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smart_localize/smart_localize.dart';

/// Enum that defines the type of empty state to display.
enum EmptyType {
  /// Custom empty state that allows using a custom widget.
  custom,

  /// Empty state that displays an image (SVG) with a message.
  image,

  /// Empty state that displays only a text message.
  text,
}

class SmartEmptyWidget extends StatelessWidget {
  /// The message to display in the empty state. Defaults to 'no_data_found' if not provided.
  final String? title;
  final String? message;

  /// The file path to the image (SVG) to be displayed when using [EmptyType.image].
  final String? emptyImage;

  /// A custom widget to display when using [EmptyType.custom].
  final Widget? child;

  /// The padding around the content of the empty state.
  final EdgeInsetsGeometry? padding;

  /// Specifies the type of empty state to display.
  final EmptyType type;

  /// The text style to apply to the message.
  final TextStyle? messageStyle;

  /// The text style to apply to the title.
  final TextStyle? titleStyle;

  /// buttonWidget.
  final Widget? buttonWidget;

  const SmartEmptyWidget({
    super.key,
    this.message,
    this.title,
    this.child,
    this.padding,
    this.emptyImage,
    this.type = EmptyType.text,
    this.messageStyle,
    this.titleStyle,
    this.buttonWidget,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case EmptyType.image:
        // Displays an image (SVG) with a message when using the EmptyType.image.
        return Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(emptyImage!),
                SizedBox(height: 32),
                if (title != null)
                  Text(
                    title ?? SmartLocalize.noDataFound,
                    textAlign: TextAlign.center,
                    style: titleStyle ?? Theme.of(context).textTheme.labelLarge,
                  ),
                if (message != null) ...[
                  SizedBox(height: 12),
                  Text(
                    message ?? SmartLocalize.noDataFound,
                    style:
                        messageStyle ?? Theme.of(context).textTheme.bodySmall,
                  ),
                ],
                if (buttonWidget != null) ...[
                  SizedBox(height: 24),
                  buttonWidget!,
                ],
              ],
            ),
          ),
        );
      case EmptyType.text:
        // Displays only a text message when using the EmptyType.text.
        return Center(
          child: Text(
            message ?? SmartLocalize.noDataFound,
            style: messageStyle ?? Theme.of(context).textTheme.bodyMedium,
          ),
        );
      case EmptyType.custom:
        // Displays a custom widget provided by the user when using the EmptyType.custom.
        return Padding(
          padding: padding ?? const EdgeInsets.all(12),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [child!],
            ),
          ),
        );
    }
  }
}
