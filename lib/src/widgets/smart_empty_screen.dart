import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

/// Enum that defines the type of empty state to display.
enum EmptyType {
  /// Custom empty state that allows using a custom widget.
  custom,

  /// Empty state that displays an image (SVG) with a message.
  image,

  /// Empty state that displays only a text message.
  text,
}

class EmptyWidget extends StatelessWidget {
  /// The message to display in the empty state. Defaults to 'no_data_found' if not provided.
  final String? message;

  /// The file path to the image (SVG) to be displayed when using [EmptyType.image].
  final String? path;

  /// A custom widget to display when using [EmptyType.custom].
  final Widget? child;

  /// The text to display on the action button, if applicable.
  final String? buttonText;

  /// A callback function that is triggered when the action button is pressed.
  final void Function()? onTap;

  /// The padding around the content of the empty state.
  final EdgeInsetsGeometry padding;

  /// Specifies the type of empty state to display.
  final EmptyType type;

  /// The text style to apply to the message.
  final TextStyle? style;

  const EmptyWidget({
    super.key,
    this.message,
    this.child,
    this.buttonText,
    this.onTap,
    this.padding = const EdgeInsets.all(12),
    this.path,
    this.type = EmptyType.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case EmptyType.image:
        // Displays an image (SVG) with a message when using the EmptyType.image.
        return Padding(
          padding: padding,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(path!),
                const SizedBox(height: 32),
                Text(
                  message ?? 'no_data_found',
                  style: style ?? Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      case EmptyType.text:
        // Displays only a text message when using the EmptyType.text.
        return Center(
          child: Text(
            message ?? 'no_data_found',
            style: style ?? Theme.of(context).textTheme.bodyMedium,
          ),
        );
      case EmptyType.custom:
        // Displays a custom widget provided by the user when using the EmptyType.custom.
        return Padding(
          padding: padding,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [child!],
            ),
          ),
        );
      default:
        // Fallback to displaying a text message if no specific type matches.
        return Center(
          child: Text(
            message ?? 'no_data_found',
            style: style ?? Theme.of(context).textTheme.bodyMedium,
          ),
        );
    }
  }
}
