import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';

class Missions extends BaseLevelPage {
  const Missions({
    super.key,
    super.onNextLevel,
    super.onBack,
  });

  @override
  State<Missions> createState() => _MissionsState();
}

class _MissionsState extends BaseLevelPageState<Missions> {
  @override
  String get levelTitle => "LEVEL 3: COMPLETED MISSIONS";

  @override
  IconData get levelIcon => Icons.flag;

  @override
  Color get accentColor => Colors.orange;

  @override
  Widget buildLevelContent(BuildContext context) {
    return CustomScrollbar(
      child: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          _buildMissionCard(
            title: "MISSION: Handle Quality for Mobile and Web Version",
            company: "BrandDrive (FinTech)",
            difficulty: 4,
            tools: ["Cypress", "GitHub Actions", "Chrome DevTools"],
            objective:
            "Automate key user flows and integrate tests into CI/CD pipeline.",
            testing:
            "Regression • E2E • API validation • DB checks • CI scripting",
            outcome:
            "Increased deployment confidence and reduced manual regression time.",
            color: Colors.cyan,
          ),
          const SizedBox(height: 20),
          _buildMissionCard(
            title: "MISSION: API & Performance Testing",
            company: "Hoardings Africa (AdTech)",
            difficulty: 3,
            tools: ["JMeter", "Postman", "RESTful APIs"],
            objective:
            "Validate CRUD logic and performance stability of the platform APIs.",
            testing: "Smoke • Load • Stress • Negative cases • Business logic",
            outcome: "Identified bottlenecks and improved platform stability.",
            color: Colors.green,
          ),
          const SizedBox(height: 20),
          _buildMissionCard(
            title: "MISSION: Functional QA for Web Banking App",
            company: "Fidelity Bank",
            difficulty: 4,
            tools: ["Excel", "Chrome DevTools", "API Testing"],
            objective:
            "Test authentication flows, dashboards and integrations.",
            testing:
            "Manual QA • Functional • API • UI validation • Collaboration",
            outcome: "Ensured release readiness and resolved critical defects.",
            color: Colors.purple,
          ),
          const SizedBox(height: 20),
          _buildMissionCard(
            title: "MISSION: EduTech Platform Quality Assurance",
            company: "Standard Biblio Service (EduTech)",
            difficulty: 3,
            tools: ["Postman", "Jira", "Database Testing"],
            objective:
            "Conduct API and database testing for educational platform.",
            testing:
            "API Testing • Exploratory • Defect Tracking • Console Debugging",
            outcome:
            "Delivered stable platform with comprehensive test coverage.",
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  Widget _buildMissionCard({
    required String title,
    required String company,
    required int difficulty,
    required List<String> tools,
    required String objective,
    required String testing,
    required String outcome,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
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
                    const SizedBox(height: 6),
                    Text(
                      company,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha:0.2),
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  "✓ COMPLETE",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "DIFFICULTY:",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              ...List.generate(
                5,
                    (i) => Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(
                    Icons.star,
                    color: i < difficulty ? Colors.amber : Colors.white24,
                    size: 18,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: tools
                .map((tool) => Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: color.withValues(alpha:0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withValues(alpha:0.5)),
              ),
              child: Text(
                tool,
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ))
                .toList(),
          ),
          const SizedBox(height: 20),
          _buildDetailRow("OBJECTIVE:", objective),
          const SizedBox(height: 12),
          _buildDetailRow("TESTING:", testing),
          const SizedBox(height: 12),
          _buildDetailRow("OUTCOME:", outcome),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.amber,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 13,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}