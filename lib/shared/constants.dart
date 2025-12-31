import 'package:flutter/material.dart';
class NeumorphicText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const NeumorphicText(
      this.text, {super.key,
        required this.fontSize,
        required this.fontWeight,
      });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: 1.5,
        fontFamily: 'Lastica',
        foreground: Paint()
          ..style = PaintingStyle.fill
          ..color = const Color(0xFFE0E5EC),
        shadows: [
          const Shadow(
            color: Colors.white,
            offset: Offset(-2, -2),
            blurRadius: 4,
          ),
          Shadow(
            color: const Color(0xFFA3B1C6).withValues(alpha: 0.5),
            offset: const Offset(2, 2),
            blurRadius: 4,
          ),
        ],
      ),
    );
  }
}

// Neumorphic card
class NeumorphicCard extends StatelessWidget {
  final Widget child;

  const NeumorphicCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-6, -6),
            blurRadius: 12,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: const Color(0xFFA3B1C6).withValues(alpha:0.5),
            offset: const Offset(6, 6),
            blurRadius: 12,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}

// Mini neumorphic button
class MiniNeumorphicButton extends StatelessWidget {
  final IconData icon;

  const MiniNeumorphicButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: const Color(0xFFA3B1C6).withValues(alpha:0.5),
            offset: const Offset(4, 4),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Icon(
        icon,
        color: const Color(0xFF6B7A8F),
        size: 24,
      ),
    );
  }
}

// Feature hint widget
class FeatureHint extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureHint({super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: const Color(0xFFE0E5EC),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.8),
                offset: const Offset(-3, -3),
                blurRadius: 6,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: const Color(0xFFA3B1C6).withValues(alpha: 0.4),
                offset: const Offset(3, 3),
                blurRadius: 6,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xFF6B7A8F),
            size: 26,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF9FA9BA),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
// Neumorphic container widget
class NeumorphicContainer extends StatelessWidget {
  final double size;
  final Widget child;

  const NeumorphicContainer({super.key,
    required this.size,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E5EC),
        borderRadius: BorderRadius.circular(size / 4),
        boxShadow: [
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-8, -8),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: const Color(0xFFA3B1C6).withValues(alpha: 0.5),
            offset: const Offset(8, 8),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(child: child),
    );
  }
}