import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';

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
  bool get showBackButton => false; // First level has no back button

  @override
  Widget buildLevelContent(BuildContext context) {
    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCharacterCard(),
            const SizedBox(height: 30),
            _buildStatsGrid(),
            const SizedBox(height: 30),
            _buildBioSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCharacterCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.purple.withValues(alpha:0.2),
            Colors.blue.withValues(alpha:0.2),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.purple.withValues(alpha:0.5), width: 2),
      ),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
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
                image: AssetImage('assets/images/lego.png'), // Update path
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "CHARACTER CLASS",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Quality Assurance Engineer",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Automation & Web/Mobile Testing Specialist",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "EXPERIENCE POINTS",
                          style: TextStyle(
                            color: Colors.cyan,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "2+ Years",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TweenAnimationBuilder<double>(
                        tween: Tween(begin: 0, end: 0.75),
                        duration: const Duration(milliseconds: 1500),
                        builder: (context, value, _) => LinearProgressIndicator(
                          value: value,
                          backgroundColor: Colors.white12,
                          color: Colors.cyan,
                          minHeight: 12,
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

  Widget _buildStatsGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "PLAYER ATTRIBUTES",
          style: TextStyle(
            color: Colors.amber,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: _buildStatBar("Test Automation", 0.78, Colors.purple)),
            const SizedBox(width: 16),
            Expanded(child: _buildStatBar("Bug Detection", 0.90, Colors.red)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildStatBar("API Testing", 0.85, Colors.green)),
            const SizedBox(width: 16),
            Expanded(child: _buildStatBar("Collaboration", 0.95, Colors.blue)),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(child: _buildStatBar("Problem Solving", 0.88, Colors.orange)),
            const SizedBox(width: 16),
            Expanded(child: _buildStatBar("Attention to Detail", 0.92, Colors.pink)),
          ],
        ),
      ],
    );
  }

  Widget _buildStatBar(String label, double value, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha:0.3), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: value),
              duration: const Duration(milliseconds: 1200),
              builder: (context, val, _) => LinearProgressIndicator(
                value: val,
                backgroundColor: Colors.white10,
                color: color,
                minHeight: 8,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "${(value * 100).toInt()}%",
            style: TextStyle(
              color: color.withValues(alpha:0.7),
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBioSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyan.withValues(alpha:0.3), width: 1),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "BACKSTORY",
            style: TextStyle(
              color: Colors.amber,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "A former Mobile App Developer who discovered their true calling in the art of Quality Assurance. "
                "Armed with tools like Cypress, Playwright, and Postman, this warrior ensures every line of code "
                "meets the highest standards. They've conquered challenges across FinTech, EduTech, and AdTech realms, "
                "leaving behind a trail of squashed bugs and satisfied users.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 15,
              height: 1.6,
            ),
          ),
          SizedBox(height: 16),
          Text(
            "Special Abilities:",
            style: TextStyle(
              color: Colors.cyan,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            "• Master of Automation Frameworks\n"
                "• CI/CD Pipeline Integration Expert\n"
                "• Cross-functional Team Collaborator\n"
                "• Mobile & Web Testing Specialist",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}