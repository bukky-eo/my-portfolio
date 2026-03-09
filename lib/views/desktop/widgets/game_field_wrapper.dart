import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';

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
              color: borderColor.withValues(alpha: 0.3),
              blurRadius: 30,
              spreadRadius: 5,
            ),
          ],
        ),
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.symmetric(vertical: r.spacing(16)),
      decoration: BoxDecoration(
        color: borderColor.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(17),
          topRight: Radius.circular(17),
        ),
        border: Border(bottom: BorderSide(color: borderColor, width: 2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(levelIcon, color: Colors.amber, size: r.iconSize(28)),
          SizedBox(width: r.spacing(12)),
          Flexible(
            child: Text(
              levelTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: r.scaleFontSize(22),
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(width: r.spacing(12)),
          Icon(levelIcon, color: Colors.amber, size: r.iconSize(28)),
        ],
      ),
    );
  }
}