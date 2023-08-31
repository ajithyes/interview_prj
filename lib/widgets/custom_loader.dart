import 'package:flutter/material.dart';

// loading box
class SquareLoader {
  static bool isOpen = false;
  static show(BuildContext context) {
    if (!isOpen) {
      isOpen = true;

      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                ),
                width: 200,
                height: 70,
                child: Column(
                  children: [
                    SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  static dismiss(context) {
    if (isOpen) {
      isOpen = false;
      Navigator.of(context).pop();
    }
  }
}
