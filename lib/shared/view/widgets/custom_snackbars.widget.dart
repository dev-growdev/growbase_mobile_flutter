import 'package:flutter/material.dart';

class SuccessSnackBar extends SnackBar {
  SuccessSnackBar({
    super.key,
    required String text,
  }) : super(
          content: Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: Color(0xFF00BFA6),
              ),
              const SizedBox(width: 6),
              Expanded(child: Text(text)),
            ],
          ),
          behavior: SnackBarBehavior.floating,
        );
}

class ErrorSnackBar extends SnackBar {
  ErrorSnackBar({
    super.key,
    required String text,
  }) : super(
          content: Row(
            children: [
              const Icon(
                Icons.error,
                color: Color(0xFFD32F2F),
              ),
              const SizedBox(width: 6),
              Expanded(child: Text(text)),
            ],
          ),
          behavior: SnackBarBehavior.floating,
        );
}
