import 'package:flutter/material.dart';

import '../../main_widgets.dart';
import 'empty_screen.dart';

/// A [MainScreen] widget that handles the UI states of loading, empty content,
/// and displaying data. It includes a pull-to-refresh functionality.
class MainScreen extends StatelessWidget {
  /// Indicates whether the data is currently being loaded.
  final bool isLoading;

  /// Indicates whether the data is empty.
  final bool isEmpty;

  /// The main content to display when data is available.
  final Widget child;

  /// Callback function that is triggered when the user performs a pull-to-refresh action.
  final Future<void> Function() onRefresh;

  /// A custom widget to display when the data is empty. If not provided, a default empty screen will be used.
  final Widget? emptyWidget;

  /// An optional message to display in the empty state widget.
  final String? message;

  /// Creates a [MainScreen] widget.
  ///
  /// [child] is required and represents the main content of the screen.
  /// [isLoading] is required and indicates whether the data is being loaded.
  /// [isEmpty] is required and indicates whether the data is empty.
  /// [onRefresh] is required and triggers a pull-to-refresh action.
  const MainScreen({
    super.key,
    required this.child,
    required this.isLoading,
    required this.isEmpty,
    this.message,
    this.emptyWidget,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return getWidget(
      isLoading: isLoading,
      isEmpty: isEmpty,
      child: child,
      message: message,
      emptyWidget: emptyWidget,
      onRefresh: onRefresh,
    );
  }
}

/// A function that returns a widget based on the state of loading, empty content,
/// or displaying data.
///
/// - If [isLoading] is true, it returns a [MainLoadingWidget].
/// - If [isEmpty] is true, it returns the [emptyWidget] if provided, or the default [EmptyScreen].
/// - Otherwise, it returns the main content wrapped with a [RefreshIndicator] for pull-to-refresh functionality.
Widget getWidget({
  required bool isLoading,
  required bool isEmpty,
  required Widget child,
  Widget? emptyWidget,
  String? message,
  required Future<void> Function() onRefresh,
}) {
  if (isLoading) {
    // Displays a loading widget when data is being fetched.
    return const MainLoadingWidget();
  } else if (isEmpty) {
    // Displays an empty state widget if there is no data.
    return emptyWidget ?? const EmptyScreen();
  } else {
    // Displays the main content wrapped with a pull-to-refresh functionality.
    return RefreshIndicator(
      onRefresh: onRefresh,
      color: Colors.white,
      child: child,
    );
  }
}
