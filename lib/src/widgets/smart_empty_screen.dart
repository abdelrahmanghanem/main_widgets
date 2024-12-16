import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:main_button/main_button.dart';
import 'package:main_widgets/src/screen_util/size_extension.dart';
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
  final TextStyle? titleStyle;

  final ButtonModel? buttonModel;

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
    this.buttonModel,
  });

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case EmptyType.image:
        // Displays an image (SVG) with a message when using the EmptyType.image.
        return Padding(
          padding: padding ?? const EdgeInsets.all(12).r,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(emptyImage!),
                SizedBox(height: 32.h),
                if (title != null)
                  Text(
                    title ?? SmartLocalize.noDataFound,
                    textAlign: TextAlign.center,
                    style: titleStyle ?? Theme.of(context).textTheme.labelLarge,
                  ),
                if (message != null) ...[
                  SizedBox(height: 12.h),
                  Text(
                    message ?? SmartLocalize.noDataFound,
                    style:
                        messageStyle ?? Theme.of(context).textTheme.bodySmall,
                  ),
                ],
                if (buttonModel != null) ...[
                  SizedBox(height: 24.h),
                  if (buttonModel != null)
                    MainButton.icon(
                      onPressed: buttonModel!.onPressed,
                      label: buttonModel!.label,
                      iconType: buttonModel!.iconType ?? IconType.icon,
                      width: buttonModel!.width ?? double.infinity,
                      isLoading: buttonModel?.isLoading ?? false,
                      isDisable: buttonModel?.isDisabled ?? false,
                      backgroundColor: buttonModel?.backgroundColor ??
                          Theme.of(context).primaryColor,
                      textColor: buttonModel!.textColor,
                      icon: buttonModel!.icon,
                      imagePath: buttonModel!.imagePath,
                      borderRadius: buttonModel!.borderRadius ?? 12.r,
                    ),
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
          padding: padding ?? const EdgeInsets.all(12).r,
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

class ButtonModel {
  final String label;
  final double? width;
  final void Function() onPressed;
  final IconType? iconType;
  final bool? isDisabled;
  final bool? isLoading;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final String? imagePath;
  final double? borderRadius;

  const ButtonModel({
    required this.label,
    required this.onPressed,
    this.width,
    this.iconType,
    this.isDisabled,
    this.isLoading,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.imagePath,
    this.borderRadius,
  });
}
