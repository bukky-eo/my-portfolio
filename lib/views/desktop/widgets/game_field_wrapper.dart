import 'package:flutter/material.dart';

/// Reusable game field container that wraps level content
/// with consistent styling and animations
class GameFieldWrapper extends StatelessWidget {
  final String levelTitle;
  final IconData levelIcon;
  final Color borderColor;
  final Animation<double> fadeAnimation;
  final Widget child;

  const GameFieldWrapper({
    super.key,
    required this.levelTitle,
    required this.levelIcon,
    required this.borderColor,
    required this.fadeAnimation,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff1a1f2e),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: borderColor.withValues(alpha:0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: borderColor.withValues(alpha:0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
        border: Border(bottom: BorderSide(color: borderColor, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(levelIcon, color: Colors.amber, size: 28),
          const SizedBox(width: 12),
          Text(
            levelTitle,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(width: 12),
          Icon(levelIcon, color: Colors.amber, size: 28),
        ],
      ),
    );
  }
}