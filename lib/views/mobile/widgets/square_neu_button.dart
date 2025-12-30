import 'package:flutter/material.dart';
import 'package:portfolio/views/theme/app_theme.dart';

class SquareNeuButton extends StatelessWidget {
  final child;
  final function;
  final bool isDarkMode;

  SquareNeuButton({
    this.child,
    this.function,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          width: 60,
          height: 60,
          child: Center(
            child: child,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppTheme.getButtonColor(isDarkMode),
            boxShadow: AppTheme.getShadows(isDarkMode),
          ),
        ),
      ),
    );
  }
}