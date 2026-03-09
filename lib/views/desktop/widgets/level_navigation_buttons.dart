import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

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
        if (showBackButton && onBack != null)
          _buildBackButton(context)
        else
          const Spacer(),
        if (showNextButton && onNext != null)
          _buildNextButton(context),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    final r = context.responsive;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onBack,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: r.spacing(30),
            vertical: r.spacing(16),
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff374151), Color(0xff1f2937)],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accentColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha: 0.3),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back, color: Colors.white,
                  size: r.iconSize(20)),
              SizedBox(width: r.spacing(12)),
              Text(
                "PREVIOUS LEVEL",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: r.scaleFontSize(16),
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

  Widget _buildNextButton(BuildContext context) {
    final r = context.responsive;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onNext,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: r.spacing(40),
            vertical: r.spacing(18),
          ),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xff667eea), Color(0xff764ba2)],
            ),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: accentColor, width: 2),
            boxShadow: [
              BoxShadow(
                color: accentColor.withValues(alpha: 0.5),
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
                style: TextStyle(
                  color: Colors.white,
                  fontSize: r.scaleFontSize(18),
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(width: r.spacing(12)),
              Icon(Icons.arrow_forward, color: Colors.white,
                  size: r.iconSize(24)),
            ],
          ),
        ),
      ),
    );
  }
}