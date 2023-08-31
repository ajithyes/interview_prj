import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showSnackbar(
      {String? message,
      required BuildContext context,
      VoidCallback? onPressed,
      String? buttonText,
      Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor:Colors.black,
        content: Text(message ?? ""),
        duration: duration ?? Duration(seconds: 20),
        action: SnackBarAction(
          textColor:Colors.blue,
          label: buttonText ?? 'Close',
          onPressed: onPressed ?? () {},
        ),
      ),
    );
  }
}
