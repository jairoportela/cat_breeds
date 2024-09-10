import 'package:flutter/material.dart';

class ErrorListWidget extends StatelessWidget {
  const ErrorListWidget({
    super.key,
    required this.message,
    required this.onPressed,
  });
  final String message;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton.icon(
        onPressed: onPressed,
        label: Text(
          message,
        ),
        icon: const Icon(Icons.refresh),
      ),
    );
  }
}
