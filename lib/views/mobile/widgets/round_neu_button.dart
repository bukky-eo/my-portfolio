import 'package:flutter/material.dart';
import 'package:portfolio/views/theme/app_theme.dart';

class RoundNeuButton extends StatelessWidget {
  final child;
  final function;
  final bool isDarkMode;

  RoundNeuButton({
    this.child,
    this.function,
    this.isDarkMode = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 65,
        height: 65,
        decoration: BoxDecoration(
          color: AppTheme.getButtonColor(isDarkMode),
          shape: BoxShape.circle,
          boxShadow: AppTheme.getShadows(isDarkMode),
        ),
        child: Center(
          child: child,
        ),
      ),
    );
  }
}