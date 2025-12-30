import 'package:flutter/material.dart';

/// Reusable navigation buttons for level progression
/// Handles both back and next buttons with consistent styling
class LevelNavigationButtons extends StatelessWidget {
  final VoidCallback? onBack;
  final VoidCallback? onNext;
  final String nextButtonText;
  final Color accentColor;
  final bool showBackButton;
  final bool showNextButton;

  const LevelNavigationButtons({
    super.key,
    this.onBack,
    this.onNext,
    this.nextButtonText = "PROCEED TO NEXT LEVEL",
    this.accentColor = Colors.cyan,
    this.showBackButton = true,
    this.showNextButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Back Button
        if (showBackButton && onBack != null)
          _buildBackButton()
        else
          const Spacer(),

        // Next Button
        if (showNextButton && onNext != null)
          _buildNextButton(),
      ],
    );
  }

  Widget _buildBackButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onBack,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff374151), Color(0xff1f2937)],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accentColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha:0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back, color: Colors.white, size: 20),
              SizedBox(width: 12),
              Text(
                "PREVIOUS LEVEL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNextButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onNext,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff667eea), Color(0xff764ba2)],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accentColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha:0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nextButtonText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 24),
            ],
          ),
        ),
      ),
    );
  }
}