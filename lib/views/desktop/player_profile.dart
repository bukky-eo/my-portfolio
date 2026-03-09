import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';
import '../../utils/responsive.dart';

class PlayerProfile extends BaseLevelPage {
  const PlayerProfile({
    super.key,
    super.onNextLevel,
  });

  @override
  State<PlayerProfile> createState() => _PlayerProfileState();
}

class _PlayerProfileState extends BaseLevelPageState<PlayerProfile> {
  @override
  String get levelTitle => "LEVEL 1: PLAYER PROFILE";

  @override
  IconData get levelIcon => Icons.emoji_events;

  @override
  Color get accentColor => Colors.cyan;

  @override
  bool get showBackButton => false;

  @override
  Widget buildLevelContent(BuildContext context) {
    final r = context.responsive;

    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(r.spacing(32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCharacterCard(context),
            SizedBox(height: r.spacing(30)),
            _buildStatsGrid(context),
            SizedBox(height: r.spacing(30)),
            _buildBioSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard(BuildContext context) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(24)),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple.withValues(alpha: 0.2),
            Colors.blue.withValues(alpha: 0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.withValues(alpha: 0.5), width: 2),
      ),
      child: Row(
        children: [
          Container(
            width: r.iconSize(120),
            height: r.iconSize(120),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.cyan, width: 4),
              boxShadow: [
                BoxShadow(
                  color: Colors.cyan.withValues(alpha: 0.6),
                  blurRadius: 25,
                  spreadRadius: 3,
                ),
              ],
              image: const DecorationImage(
                image: AssetImage('assets/images/lego.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: r.spacing(30)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "CHARACTER CLASS",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: r.scaleFontSize(12),
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                SizedBox(height: r.spacing(8)),
                Text(
                  "Quality Assurance Engineer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: r.scaleFontSize(24),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: r.spacing(8)),
                Text(
                  "Automation & Web/Mobile Testing Specialist",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: r.scaleFontSize(16),
                  ),
                ),
                SizedBox(height: r.spacing(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EXPERIENCE POINTS",
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: r.scaleFontSize(12),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "2+ Years",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: r.scaleFontSize(12),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: r.spacing(8)),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 0.75),
                        duration: const Duration(milliseconds: 1500),
                        builder: (context, value, _) => LinearProgressIndicator(
                          value: value,
                          backgroundColor: Colors.white12,
                          color: Colors.cyan,
                          minHeight: r.spacing(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final r = context.responsive;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "PLAYER ATTRIBUTES",
          style: TextStyle(
            color: Colors.amber,
            fontSize: r.scaleFontSize(18),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: r.spacing(16)),
        Row(
          children: [
            Expanded(child: _buildStatBar(context, "Test Strategy & Planning", 0.78, Colors.purple)),
            SizedBox(width: r.spacing(16)),
            Expanded(child: _buildStatBar(context, "Quality Architecture", 0.90, Colors.red)),
          ],
        ),
        SizedBox(height: r.spacing(12)),
        Row(
          children: [
            Expanded(child: _buildStatBar(context, "Risk Assessment & Mitigation", 0.85, Colors.green)),
            SizedBox(width: r.spacing(16)),
            Expanded(child: _buildStatBar(context, "Collaboration/Communication", 0.95, Colors.blue)),
          ],
        ),
        SizedBox(height: r.spacing(12)),
        Row(
          children: [
            Expanded(child: _buildStatBar(context, "Stakeholder Management", 0.88, Colors.orange)),
            SizedBox(width: r.spacing(16)),
            Expanded(child: _buildStatBar(context, "Automation Framework Design", 0.92, Colors.pink)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatBar(BuildContext context, String label, double value, Color color) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(16)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: r.scaleFontSize(13),
            ),
          ),
          SizedBox(height: r.spacing(8)),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value),
              duration: const Duration(milliseconds: 1200),
              builder: (context, val, _) => LinearProgressIndicator(
                value: val,
                backgroundColor: Colors.white10,
                color: color,
                minHeight: r.spacing(8),
              ),
            ),
          ),
          SizedBox(height: r.spacing(4)),
          Text(
            "${(value * 100).toInt()}%",
            style: TextStyle(
              color: color.withValues(alpha: 0.7),
              fontSize: r.scaleFontSize(11),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection(BuildContext context) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(20)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "BACKSTORY",
            style: TextStyle(
              color: Colors.amber,
              fontSize: r.scaleFontSize(16),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: r.spacing(12)),
          Text(
            "A former Mobile App Developer who discovered their true calling in the art of Quality Assurance. "
                "Armed with tools like Cypress, Playwright, and Postman, this warrior ensures every line of code "
                "meets the highest standards. They've conquered challenges across FinTech, EduTech, and AdTech realms, "
                "leaving behind a trail of squashed bugs and satisfied users.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: r.scaleFontSize(15),
              height: 1.6,
            ),
          ),
          SizedBox(height: r.spacing(16)),
          Text(
            "Special Abilities:",
            style: TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
              fontSize: r.scaleFontSize(14),
            ),
          ),
          SizedBox(height: r.spacing(8)),
          Text(
            "• Master of Automation Frameworks\n"
                "• CI/CD Pipeline Integration Expert\n"
                "• Cross-functional Team Collaborator\n"
                "• Mobile & Web Testing Specialist",
            style: TextStyle(
              color: Colors.white70,
              fontSize: r.scaleFontSize(14),
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}