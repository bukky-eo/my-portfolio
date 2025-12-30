import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';

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
    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "UNLOCKED ABILITIES",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            _buildSkillCategory(
              "Test Automation",
              0.78,
              Colors.cyan,
              ["Cypress", "Playwright", "Appium", "Selenium"],
              "Master of automated testing frameworks",
            ),
            const SizedBox(height: 20),
            _buildSkillCategory(
              "API & Performance Testing",
              0.85,
              Colors.green,
              ["Postman", "JMeter", "RESTful APIs", "Load Testing"],
              "Expert in backend validation and stress testing",
            ),
            const SizedBox(height: 20),
            _buildSkillCategory(
              "CI/CD Integration",
              0.75,
              Colors.blue,
              ["GitHub Actions", "Jenkins", "Pipeline Automation"],
              "Seamless integration with deployment workflows",
            ),
            const SizedBox(height: 20),
            _buildSkillCategory(
              "Mobile & Web Testing",
              0.80,
              Colors.purple,
              ["Flutter", "Chrome DevTools", "Cross-browser Testing"],
              "Comprehensive testing across platforms",
            ),
            const SizedBox(height: 20),
            _buildSkillCategory(
              "Tools & Frameworks",
              0.82,
              Colors.orange,
              ["Git/GitHub", "Jira", "TestRail", "JavaScript"],
              "Proficient with industry-standard tools",
            ),
            const SizedBox(height: 20),
            _buildSkillCategory(
              "Manual Testing",
              0.90,
              Colors.pink,
              ["Regression", "Exploratory", "Sanity", "Bug Reporting"],
              "Thorough manual testing expertise",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSkillCategory(
      String title,
      double mastery,
      Color color,
      List<String> skills,
      String description,
      ) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withValues(alpha:0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(Icons.verified, color: color, size: 24),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "MASTERY LEVEL:",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
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
                      minHeight: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                "${(mastery * 100).toInt()}%",
                style: TextStyle(
                  color: color,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: skills
                .map((skill) => Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                color: color.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: color.withValues(alpha:0.5), width: 1.5),
              ),
              child: Text(
                skill,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ))
                .toList(),
          ),
        ],
      ),
    );
  }
}