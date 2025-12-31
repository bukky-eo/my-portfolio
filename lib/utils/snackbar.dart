import 'package:flutter/material.dart';
void showCustomSnackBar(
    BuildContext context, {
      required String message,
      Color color = Colors.green,
      Duration duration = const Duration(seconds: 4),
    }) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        constraints: const BoxConstraints(
          minWidth: 40,
        ),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 2),
        ),
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent, // make background transparent
      duration: duration,
      margin: const EdgeInsets.only(
        bottom: 0, // distance from bottom
        left: 20,
        right: 20,
      ),
    ),
  );
}
