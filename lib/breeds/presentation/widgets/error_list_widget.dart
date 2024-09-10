import 'package:flutter/material.dart';

///A widget to show error in the get of a list
class ErrorListWidget extends StatelessWidget {
  /// Constructs a `ErrorListWidget` instance.
  const ErrorListWidget({
    required this.message,
    required this.onPressed,
    super.key,
  });

  ///Error message to show
  final String message;

  ///Action when press the text button icon
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
