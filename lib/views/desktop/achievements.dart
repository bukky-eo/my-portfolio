import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';

class Achievements extends BaseLevelPage {
  const Achievements({
    super.key,
    super.onNextLevel,
    super.onBack,
  });

  @override
  State<Achievements> createState() => _AchievementsRefactoredState();
}

class _AchievementsRefactoredState extends BaseLevelPageState<Achievements> {
  @override
  String get levelTitle => "LEVEL 5: ACHIEVEMENTS & BADGES";

  @override
  IconData get levelIcon => Icons.military_tech;

  @override
  Color get accentColor => Colors.amber;

  @override
  String get nextButtonText => "PROCEED TO FINAL GATE";

  @override
  Widget buildLevelContent(BuildContext context) {
    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "UNLOCKED BADGES",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 24),
            _buildBadgesRow(),
            const SizedBox(height: 40),
            const Text(
              "PLAYER STATISTICS",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 24),
            _buildStatsRow1(),
            const SizedBox(height: 16),
            _buildStatsRow2(),
            const SizedBox(height: 40),
            const Text(
              "EDUCATION & TRAINING",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 24),
            _buildEducationCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesRow() {
    return Row(
      children: [
        Expanded(
          child: _buildBadgeCard(
            icon: Icons.bug_report,
            title: "Bug Slayer",
            description: "Identified, logged and helped resolve critical issues across multiple projects.",
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildBadgeCard(
            icon: Icons.bolt,
            title: "Automation Adventurer",
            description: "Designed and executed automated test suites with CI integration.",
            color: Colors.cyan,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildBadgeCard(
            icon: Icons.handshake,
            title: "Team Collaborator",
            description: "Worked closely with Dev & Product to ship stable, quality-first releases.",
            color: Colors.amber,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow1() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            label: "Automated Tests Built",
            value: "120+",
            color: Colors.cyan,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            label: "Critical Bugs Squashed",
            value: "95+",
            color: Colors.red,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            label: "Tools Mastered",
            value: "10+",
            color: Colors.purple,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow2() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard(
            label: "Releases Supported",
            value: "25+",
            color: Colors.green,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            label: "API Endpoints Tested",
            value: "80+",
            color: Colors.orange,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatCard(
            label: "CI Pipelines Integrated",
            value: "6+",
            color: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _buildEducationCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withValues(alpha:0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha:0.2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          // Icon Section
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha:0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: const Icon(
              Icons.school,
              color: Colors.blue,
              size: 48,
            ),
          ),
          const SizedBox(width: 24),
          // Content Section
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "University of Uyo",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "B.Eng in Computer Engineering",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white60,
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "September 2017 - October 2023",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Text(
                  "Completed Bachelor of Engineering degree in Computer Engineering with focus on software quality and development.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha:0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha:0.2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha:0.2),
              border: Border.all(color: color, width: 3),
              boxShadow: [
                BoxShadow(
                  color: color.withValues(alpha:0.4),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(icon, color: color, size: 40),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.5,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard({
    required String label,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha:0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha:0.2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        children: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: const Duration(milliseconds: 1000),
            builder: (context, opacity, _) => Opacity(
              opacity: opacity,
              child: Text(
                value,
                style: TextStyle(
                  color: color,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.4,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}