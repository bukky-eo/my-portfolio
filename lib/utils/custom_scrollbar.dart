import 'package:flutter/material.dart';

// Add this to your main.dart theme or use it directly in widgets

class CustomScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;

  const CustomScrollbar({
    super.key,
    required this.child,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      controller: controller,
      thumbVisibility: false, // Only shows on hover/scroll
      thickness: 6,
      radius: const Radius.circular(10),
      thumbColor: Colors.cyan.withValues(alpha: 0.3),
      fadeDuration: const Duration(milliseconds: 300),
      timeToFade: const Duration(milliseconds: 600),
      child: child,
    );
  }
}

// Usage example in your widgets:
// Wrap your ScrollView with CustomScrollbar:
//
// CustomScrollbar(
//   child: SingleChildScrollView(
//     padding: const EdgeInsets.all(32),
//     child: Column(
//       children: [...],
//     ),
//   ),
// )