import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hyper_ui/state_util.dart';

Future showInfoDialog({
  required String message,
  required String title,
  Color? titleColor,
  Color? buttonColor,
  String? buttonText,
  VoidCallback? onDismiss,
}) async {
  await showDialog<void>(
    context: globalContext,
    barrierDismissible: false, // Jangan izinkan dismiss dialog
    builder: (BuildContext context) {
      return Container(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Card(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: titleColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          message,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: buttonColor,
                          ),
                          onPressed: () {
                            if (onDismiss != null) {
                              onDismiss();
                            }
                            Navigator.pop(context);
                          },
                          child: Text('$buttonText'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade().shake(),
        ),
      );
    },
  );
}
