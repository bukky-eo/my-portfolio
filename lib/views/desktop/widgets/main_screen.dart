import 'package:flutter/material.dart';

// Import all game screens
import '../player_profile.dart';
import '../skill_tree.dart';
import '../missions.dart';
import '../qa_lab.dart';
import '../achievements.dart';
import '../contact_gate.dart';

class MainScreen extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onLevelChange;

  const MainScreen({
    super.key,
    required this.selectedIndex,
    this.onLevelChange,
  });

  void _handleBack() {
    if (selectedIndex > 0 && onLevelChange != null) {
      onLevelChange!(selectedIndex - 1);
    }
  }

  void _handleBackToHome() {
    if (onLevelChange != null) {
      onLevelChange!(0); // Go back to Level 1 (Player Profile)
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      PlayerProfile(
        onNextLevel: () => onLevelChange?.call(1),
      ),
      SkillTree(
        onNextLevel: () => onLevelChange?.call(2),
        onBack: _handleBack,
      ),
      Missions(
        onNextLevel: () => onLevelChange?.call(3),
        onBack: _handleBack,
      ),
      QALab(
        onNextLevel: () => onLevelChange?.call(4),
        onBack: _handleBack,
      ),
      Achievements(
        onNextLevel: () => onLevelChange?.call(5),
        onBack: _handleBack,
      ),
      ContactGate(
        onBack: _handleBack,
      ),
    ];

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child: pages[selectedIndex],
    );
  }
}