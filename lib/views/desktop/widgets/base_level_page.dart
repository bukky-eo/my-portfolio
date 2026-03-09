import 'package:flutter/material.dart';
import '../../../utils/responsive.dart';
import 'game_field_wrapper.dart';
import 'level_navigation_buttons.dart';

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

  String get levelTitle;
  IconData get levelIcon;
  Color get accentColor;
  Widget buildLevelContent(BuildContext context);

  String get nextButtonText => "PROCEED TO NEXT LEVEL";
  bool get showBackButton => widget.onBack != null;
  bool get showNextButton => widget.onNextLevel != null;

  // Kept for backward compat — ignored; padding now comes from responsive.
  double get contentPadding => 0.0;

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
    final r = context.responsive;

    return SizedBox.expand(
      key: ValueKey(levelTitle.toLowerCase().replaceAll(' ', '_')),
      child: ColoredBox(
        color: const Color(0xff0F172A),
        child: Padding(
          padding: EdgeInsets.all(r.contentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header — fixed height, never grows
              buildHeader(context),
              SizedBox(height: r.spacing(20)),
              // Game field — takes all remaining space
              Expanded(
                child: GameFieldWrapper(
                  levelTitle: levelTitle,
                  levelIcon: levelIcon,
                  borderColor: accentColor,
                  fadeAnimation: fadeAnimation,
                  child: buildLevelContent(context),
                ),
              ),
              SizedBox(height: r.spacing(16)),
              // Nav buttons — fixed height, never grows
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
        ),
      ),
    );
  }

  /// Default header — override in subclasses if needed.
  Widget buildHeader(BuildContext context) {
    final responsive = context.responsive;

    return Row(
      children: [
        Container(
          width: responsive.iconSize(60),
          height: responsive.iconSize(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xff667eea), Color(0xff764ba2)],
            ),
            border: Border.all(color: Colors.cyan, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withValues(alpha: 0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Icon(Icons.person, color: Colors.white,
              size: responsive.iconSize(32)),
        ),
        SizedBox(width: responsive.spacing(20)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.gamepad, color: Colors.cyan,
                      size: responsive.iconSize(20)),
                  SizedBox(width: responsive.spacing(8)),
                  Text(
                    "PLAYER:",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: responsive.scaleFontSize(14),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.spacing(4)),
              Text(
                "EUNICE BUKOLA OGUNSHOLA",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: responsive.scaleFontSize(22),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: responsive.spacing(16),
            vertical: responsive.spacing(8),
          ),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.2),
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, color: Colors.green,
                  size: responsive.iconSize(12)),
              SizedBox(width: responsive.spacing(8)),
              Text(
                "READY TO PLAY",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: responsive.scaleFontSize(13),
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