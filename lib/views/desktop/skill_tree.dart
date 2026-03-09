import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';
import '../../utils/responsive.dart';

class SkillTree extends BaseLevelPage {
  const SkillTree({
    super.key,
    super.onNextLevel,
    super.onBack,
  });

  @override
  State<SkillTree> createState() => _SkillTreeState();
}

class _SkillTreeState extends BaseLevelPageState<SkillTree> {
  @override
  String get levelTitle => "LEVEL 2: SKILL TREE";

  @override
  IconData get levelIcon => Icons.stars;

  @override
  Color get accentColor => Colors.purple;

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
              "UNLOCKED ABILITIES",
              style: TextStyle(
                color: Colors.amber,
                fontSize: r.scaleFontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: r.spacing(24)),
            _buildSkillCategory(context, "Test Automation", 0.78, Colors.cyan,
                ["Cypress", "Playwright", "Appium", "Selenium"],
                "Master of automated testing frameworks"),
            SizedBox(height: r.spacing(20)),
            _buildSkillCategory(context, "API & Performance Testing", 0.85, Colors.green,
                ["Postman", "JMeter", "Swagger", "RESTful APIs", "Load Testing"],
                "Expert in backend validation and stress testing"),
            SizedBox(height: r.spacing(20)),
            _buildSkillCategory(context, "CI/CD Integration", 0.75, Colors.blue,
                ["GitHub Actions", "Jenkins", "Pipeline Automation"],
                "Seamless integration with deployment workflows"),
            SizedBox(height: r.spacing(20)),
            _buildSkillCategory(context, "Mobile & Web Testing", 0.80, Colors.purple,
                ["Charles Proxy", "Chrome DevTools", "Cross-browser Testing", "Chromatic"],
                "Comprehensive testing across platforms"),
            SizedBox(height: r.spacing(20)),
            _buildSkillCategory(context, "Test Management", 0.82, Colors.orange,
                ["Git/GitHub", "TestRail", "Excel", "Jira"],
                "Proficient with industry-standard tools"),
            SizedBox(height: r.spacing(20)),
            _buildSkillCategory(context, "Manual Testing", 0.90, Colors.pink,
                ["Regression", "Exploratory", "Sanity", "Bug Reporting"],
                "Thorough manual testing expertise"),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
      BuildContext context,
      String title,
      double mastery,
      Color color,
      List<String> skills,
      String description,
      ) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(24)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
        boxShadow: [
          BoxShadow(color: color.withValues(alpha: 0.2), blurRadius: 15, spreadRadius: 1),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(r.spacing(12)),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(Icons.verified, color: color, size: r.iconSize(24)),
              ),
              SizedBox(width: r.spacing(16)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontSize: r.scaleFontSize(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: r.spacing(4)),
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: r.scaleFontSize(13),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: r.spacing(16)),
          // Mastery bar
          Row(
            children: [
              Text(
                "MASTERY LEVEL:",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: r.scaleFontSize(12),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: r.spacing(12)),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: mastery),
                    duration: const Duration(milliseconds: 1500),
                    builder: (context, value, _) => LinearProgressIndicator(
                      value: value,
                      backgroundColor: Colors.white10,
                      color: color,
                      minHeight: r.spacing(10),
                    ),
                  ),
                ),
              ),
              SizedBox(width: r.spacing(12)),
              Text(
                "${(mastery * 100).toInt()}%",
                style: TextStyle(
                  color: color,
                  fontSize: r.scaleFontSize(14),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: r.spacing(16)),
          // Skill chips
          Wrap(
            spacing: r.spacing(10),
            runSpacing: r.spacing(10),
            children: skills.map((skill) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: r.spacing(14),
                vertical: r.spacing(8),
              ),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: color.withValues(alpha: 0.5), width: 1.5),
              ),
              child: Text(
                skill,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: r.scaleFontSize(13),
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }
}