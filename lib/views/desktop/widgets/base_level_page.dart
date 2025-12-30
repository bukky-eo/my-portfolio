import 'package:flutter/material.dart';
import 'game_field_wrapper.dart';
import 'level_navigation_buttons.dart';

/// Base widget for all level pages
/// Provides consistent structure and reduces code duplication
abstract class BaseLevelPage extends StatefulWidget {
  final VoidCallback? onNextLevel;
  final VoidCallback? onBack;

  const BaseLevelPage({
    super.key,
    this.onNextLevel,
    this.onBack,
  });
}

abstract class BaseLevelPageState<T extends BaseLevelPage> extends State<T>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> fadeAnimation;

  // Abstract methods that must be implemented by subclasses
  String get levelTitle;
  IconData get levelIcon;
  Color get accentColor;
  Widget buildLevelContent(BuildContext context);

  // Optional overrides
  String get nextButtonText => "PROCEED TO NEXT LEVEL";
  bool get showBackButton => widget.onBack != null;
  bool get showNextButton => widget.onNextLevel != null;
  double get contentPadding => 40.0;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: ValueKey(levelTitle.toLowerCase().replaceAll(' ', '_')),
      padding: EdgeInsets.all(contentPadding),
      color: const Color(0xff0F172A),
      child: Column(
        children: [
          buildHeader(),
          const SizedBox(height: 40),
          Expanded(
            child: GameFieldWrapper(
              levelTitle: levelTitle,
              levelIcon: levelIcon,
              borderColor: accentColor,
              fadeAnimation: fadeAnimation,
              child: buildLevelContent(context),
            ),
          ),
          const SizedBox(height: 30),
          LevelNavigationButtons(
            onBack: widget.onBack,
            onNext: widget.onNextLevel,
            nextButtonText: nextButtonText,
            accentColor: accentColor,
            showBackButton: showBackButton,
            showNextButton: showNextButton,
          ),
        ],
      ),
    );
  }

  // Default header implementation - can be overridden
  Widget buildHeader() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xff667eea), Color(0xff764ba2)],
            ),
            border: Border.all(color: Colors.cyan, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withValues(alpha:0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 32),
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.gamepad, color: Colors.cyan, size: 20),
                SizedBox(width: 8),
                Text(
                  "PLAYER:",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "EUNICE BUKOLA OGUNSHOLA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha:0.2),
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.circle, color: Colors.green, size: 12),
              SizedBox(width: 8),
              Text(
                "READY TO PLAY",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}