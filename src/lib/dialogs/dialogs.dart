import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String _okButtonText = "OK";
String _yesButtonText = "Sim";
String _noButtonText = "Não";

final class DialogButton extends StatelessWidget {
  const DialogButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isDefaultAction = false,
    this.isDestructiveAction = false,
  });

  final String text;
  final bool isDefaultAction;
  final bool isDestructiveAction;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      fontWeight: isDefaultAction ? FontWeight.bold : FontWeight.normal,
      color: isDestructiveAction ? CupertinoColors.destructiveRed : null,
    );

    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: textStyle),
    );
  }
}

extension Dialogs on BuildContext {
  void setButtonTexts({
    required String ok,
    required String yes,
    required String no,
  }) {
    _okButtonText = ok;
    _yesButtonText = yes;
    _noButtonText = no;
  }

  Future<void> showOKDialog({
    required String title,
    required String message,
  }) async {
    return showAdaptiveDialog(
      context: this,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title),
        content: Text(message),
        actions: [
          DialogButton(
            text: _okButtonText,
            isDefaultAction: true,
            isDestructiveAction: false,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Future<T?> showDialog<T>({
    required String title,
    required String message,
    required List<AlertAction> Function(BuildContext context) actionsFactory,
  }) async {
    return showAdaptiveDialog<T>(
      context: this,
      builder: (context) => AlertDialog.adaptive(
        title: Text(title),
        content: Text(message),
        actions: actionsFactory(context)
            .map(
              (action) => DialogButton(
                text: action.text,
                isDefaultAction: action.isDefaultAction,
                isDestructiveAction: action.isDestructiveAction,
                onPressed:
                    action.onPressed ?? () => Navigator.of(context).pop(),
              ),
            )
            .toList(),
      ),
    );
  }

  Future<bool> showConfirmDialog({
    required String title,
    required String message,
  }) async {
    return (await showDialog<bool>(
          title: title,
          message: message,
          actionsFactory: (context) => [
            AlertAction(
              text: _yesButtonText,
              onPressed: () => Navigator.of(context).pop(true),
            ),
            AlertAction(
              text: _noButtonText,
              onPressed: () => Navigator.of(context).pop(false),
              isDefaultAction: true,
            ),
          ],
        )) ??
        false;
  }

  Future<bool> showImportantConfirmation({
    required String title,
    required String message,
  }) async {
    AlertAction yesAction(BuildContext context) => AlertAction(
          text: _yesButtonText,
          isDestructiveAction: true,
          onPressed: () => Navigator.of(context).pop(true),
        );

    AlertAction noAction(BuildContext context) => AlertAction(
          text: _noButtonText,
          onPressed: () => Navigator.of(context).pop(false),
          isDefaultAction: true,
        );

    final result1 = await showDialog<bool>(
      title: "${title} (1/2)",
      message: "(1/2): ${message}",
      actionsFactory: (context) => [yesAction(context), noAction(context)],
    );

    if (result1 == false) {
      return false;
    }

    return (await showDialog<bool>(
          title: "${title} (2/2)",
          message: "(2/2): ${message}",
          actionsFactory: (context) => [noAction(context), yesAction(context)],
        )) ??
        false;
  }
}

final class AlertAction {
  const AlertAction({
    required this.text,
    this.onPressed,
    this.isDestructiveAction = false,
    this.isDefaultAction = false,
  });

  final String text;
  final void Function()? onPressed;
  final bool isDestructiveAction;
  final bool isDefaultAction;
}
