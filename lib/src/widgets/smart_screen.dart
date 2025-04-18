import 'package:flutter/material.dart';

import '../../main_widgets.dart';

class SmartScreen extends StatelessWidget {
  /// Indicates whether the data is currently being loaded.
  final bool isLoading;

  /// Indicates whether the data is empty.
  final bool isEmpty;

  /// The main content to display when data is available.
  final Widget Function(BuildContext context) builder;

  /// Callback function that is triggered when the user performs a pull-to-refresh action.
  final Future<void> Function()? onRefresh;

  /// A custom widget to display when the data is empty. If not provided, a default empty screen will be used.
  final Widget? emptyWidget;

  /// A custom widget to display when the data is loading. If not provided, a default loading indicator will be used.
  final Widget? loadingWidget;

  /// An optional message to display in the empty state widget.
  final String? message;
  final Color? refreshColor;
  final Color? refreshBackgroundColor;

  const SmartScreen({
    super.key,
    required this.builder,
    this.isLoading = false,
    this.isEmpty = false,
    this.message,
    this.emptyWidget,
    this.onRefresh,
    this.refreshColor,
    this.refreshBackgroundColor,
    this.loadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return getWidget(
      isLoading: isLoading,
      isEmpty: isEmpty,
      builder: builder,
      message: message,
      emptyWidget: emptyWidget,
      onRefresh: onRefresh,
      context: context,
      refreshColor: refreshColor,
      refreshBackgroundColor: Theme.of(context).primaryColor,
    );
  }
}

/// A function that returns a widget based on the state of loading, empty content,
/// or displaying data.
///
/// - If [isLoading] is true, it returns a [SmartLoadingWidget].
/// - If [isEmpty] is true, it returns the [emptyWidget] if provided, or the default [SmartEmptyWidget].
/// - Otherwise, it returns the main content wrapped with a [RefreshIndicator] for pull-to-refresh functionality.
Widget getWidget({
  required BuildContext context,
  required bool isLoading,
  required bool isEmpty,
  required Widget Function(BuildContext context) builder,
  Widget? emptyWidget,
  Widget? loadingWidget,
  String? message,
  Color? refreshColor,
  Color? refreshBackgroundColor,
  required Future<void> Function()? onRefresh,
}) {
  if (isLoading) {
    if (loadingWidget != null) return loadingWidget;
    // Displays a loading widget when data is being fetched.
    return const SmartLoadingWidget();
  } else if (isEmpty) {
    // Displays an empty state widget if there is no data.
    return emptyWidget ?? SmartEmptyWidget(message: message);
  } else {
    // Displays the main content wrapped with a pull-to-refresh functionality.
    return RefreshIndicator(
      onRefresh: onRefresh ?? () async {},
      color: refreshColor ?? Colors.white,
      backgroundColor: refreshBackgroundColor ?? Theme.of(context).primaryColor,
      child: builder(context),
    );
  }
}
