import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';
import '../../utils/responsive.dart';

class Achievements extends BaseLevelPage {
  const Achievements({
    super.key,
    super.onNextLevel,
    super.onBack,
  });

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends BaseLevelPageState<Achievements> {
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
    final r = context.responsive;

    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(r.spacing(32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "UNLOCKED BADGES",
              style: TextStyle(
                color: Colors.amber,
                fontSize: r.scaleFontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: r.spacing(24)),
            _buildBadgesRow(context),
            SizedBox(height: r.spacing(40)),
            Text(
              "PLAYER STATISTICS",
              style: TextStyle(
                color: Colors.amber,
                fontSize: r.scaleFontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: r.spacing(24)),
            _buildStatsRow(context),
            SizedBox(height: r.spacing(40)),
            Text(
              "EDUCATION & TRAINING",
              style: TextStyle(
                color: Colors.amber,
                fontSize: r.scaleFontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: r.spacing(24)),
            _buildEducationCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildBadgesRow(BuildContext context) {
    final r = context.responsive;

    return Row(
      children: [
        Expanded(child: _buildBadgeCard(context,
            icon: Icons.bug_report,
            title: "Bug Slayer",
            description: "Identified, logged and helped resolve critical issues across multiple projects.",
            color: Colors.red)),
        SizedBox(width: r.spacing(16)),
        Expanded(child: _buildBadgeCard(context,
            icon: Icons.bolt,
            title: "Automation Adventurer",
            description: "Designed and executed automated test suites with CI integration.",
            color: Colors.cyan)),
        SizedBox(width: r.spacing(16)),
        Expanded(child: _buildBadgeCard(context,
            icon: Icons.handshake,
            title: "Team Collaborator",
            description: "Worked closely with Dev & Product to ship stable, quality-first releases.",
            color: Colors.amber)),
      ],
    );
  }

  Widget _buildStatsRow(BuildContext context) {
    final r = context.responsive;

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: _buildStatCard(context, "Automated Tests Built", "120+", Colors.cyan)),
            SizedBox(width: r.spacing(16)),
            Expanded(child: _buildStatCard(context, "Critical Bugs Squashed", "95+", Colors.red)),
            SizedBox(width: r.spacing(16)),
            Expanded(child: _buildStatCard(context, "Tools Mastered", "10+", Colors.purple)),
          ],
        ),
        SizedBox(height: r.spacing(16)),
        Row(
          children: [
            Expanded(child: _buildStatCard(context, "Releases Supported", "25+", Colors.green)),
            SizedBox(width: r.spacing(16)),
            Expanded(child: _buildStatCard(context, "API Endpoints Tested", "80+", Colors.orange)),
            SizedBox(width: r.spacing(16)),
            Expanded(child: _buildStatCard(context, "CI Pipelines Integrated", "6+", Colors.blue)),
          ],
        ),
      ],
    );
  }

  Widget _buildEducationCard(BuildContext context) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(24)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.5), width: 2),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(r.spacing(20)),
            decoration: BoxDecoration(
              color: Colors.blue.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: Icon(Icons.school, color: Colors.blue, size: r.iconSize(48)),
          ),
          SizedBox(width: r.spacing(24)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "University of Uyo",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: r.scaleFontSize(22),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: r.spacing(8)),
                Text(
                  "B.Eng in Computer Engineering",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: r.scaleFontSize(18),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: r.spacing(8)),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.white60, size: r.iconSize(16)),
                    SizedBox(width: r.spacing(8)),
                    Text(
                      "September 2017 - October 2023",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: r.scaleFontSize(14),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: r.spacing(12)),
                Text(
                  "Completed Bachelor of Engineering degree in Computer Engineering with focus on software quality and development.",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: r.scaleFontSize(14),
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeCard(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String description,
        required Color color,
      }) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(20)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(r.spacing(20)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color.withValues(alpha: 0.2),
              border: Border.all(color: color, width: 3),
            ),
            child: Icon(icon, color: color, size: r.iconSize(40)),
          ),
          SizedBox(height: r.spacing(16)),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: color,
              fontSize: r.scaleFontSize(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: r.spacing(8)),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: r.scaleFontSize(13),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String label, String value, Color color) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(24)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
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
                  fontSize: r.scaleFontSize(36),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: r.spacing(12)),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white70,
              fontSize: r.scaleFontSize(14),
            ),
          ),
        ],
      ),
    );
  }
}