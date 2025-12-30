import 'package:flutter/material.dart';

class SectionPanel extends StatelessWidget {
  final String title;
  final Widget child;
  final IconData? icon;

  const SectionPanel({
    super.key,
    required this.title,
    required this.child,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: const Color(0xff111827),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 18,
            offset: Offset(6, 6),
          ),
          BoxShadow(
            color: Colors.white10,
            blurRadius: 18,
            offset: Offset(-6, -6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            children: [
              if (icon != null)
                Icon(icon, color: Colors.cyanAccent, size: 22),
              if (icon != null) const SizedBox(width: 10),

              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          /// Divider
          Container(
            height: 1,
            color: Colors.white12,
          ),

          const SizedBox(height: 16),

          /// Body
          Expanded(child: child),
        ],
      ),
    );
  }
}
