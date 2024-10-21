import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart' as toast;

enum ToastStatus {
  success,
  failure,
}

void showToastSmart({
  required String msg,
  required ToastStatus status,
  required Widget icon,
  Color? backgroundColor,
  Color? textColor,
  BuildContext? context,
  double radius = 12,
  BorderRadiusGeometry? borderRadius,
}) {
  toast.dismissAllToast(showAnim: true);
  Future.delayed(
    const Duration(milliseconds: 100),
    () {
      toast.showToastWidget(
        builder: (context, theme) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minHeight: 40,
              minWidth: 350,
              maxWidth: double.infinity - 20,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: backgroundColor ?? theme?.backgroundColor,
                borderRadius: borderRadius ??
                    BorderRadius.all(
                      Radius.circular(radius),
                    ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  children: [
                    icon,
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Text(
                        msg,
                        maxLines: 2,
                        style: theme?.textStyle?.copyWith(color: textColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        context: context,
        animation: toast.StyledToastAnimation.fade,
        animDuration: const Duration(milliseconds: 100),
        duration: const Duration(seconds: 3),
        dismissOtherToast: true,
      );
      log('msg => $msg');
    },
  );
}

void showToastError({
  required String msg,
  Color? backgroundColor,
  Widget? icon,
}) {
  showToastSmart(
    msg: msg,
    status: ToastStatus.failure,
    backgroundColor: backgroundColor,
    icon: icon ?? const Icon(Icons.cancel),
  );
}

void showToastSuccess({
  required String msg,
  Color? backgroundColor,
  Widget? icon,
}) {
  showToastSmart(
    msg: msg,
    status: ToastStatus.success,
    backgroundColor: backgroundColor,
    icon: icon ?? const Icon(Icons.check_circle),
  );
}
