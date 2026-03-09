import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';
import '../../utils/responsive.dart';

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
    final r = context.responsive;

    return CustomScrollbar(
      child: ListView(
        padding: EdgeInsets.all(r.spacing(32)),
        children: [
          _buildMissionCard(context,
              title: "MISSION: Handle Quality for Mobile and Web Version",
              company: "BrandDrive (FinTech)",
              difficulty: 4,
              tools: ["Cypress", "GitHub Actions", "Chrome DevTools"],
              objective: "Automate key user flows and integrate tests into CI/CD pipeline.",
              testing: "Regression • E2E • API validation • DB checks • CI scripting",
              outcome: "Increased deployment confidence and reduced manual regression time.",
              color: Colors.cyan),
          SizedBox(height: r.spacing(20)),
          _buildMissionCard(context,
              title: "MISSION: API & Performance Testing",
              company: "Hoardings Africa (AdTech)",
              difficulty: 3,
              tools: ["JMeter", "Postman", "RESTful APIs"],
              objective: "Validate CRUD logic and performance stability of the platform APIs.",
              testing: "Smoke • Load • Stress • Negative cases • Business logic",
              outcome: "Identified bottlenecks and improved platform stability.",
              color: Colors.green),
          SizedBox(height: r.spacing(20)),
          _buildMissionCard(context,
              title: "MISSION: Functional QA for Web Banking App",
              company: "Fidelity Bank",
              difficulty: 4,
              tools: ["Excel", "Chrome DevTools", "API Testing"],
              objective: "Test authentication flows, dashboards and integrations.",
              testing: "Manual QA • Functional • API • UI validation • Collaboration",
              outcome: "Ensured release readiness and resolved critical defects.",
              color: Colors.purple),
          SizedBox(height: r.spacing(20)),
          _buildMissionCard(context,
              title: "MISSION: EduTech Platform Quality Assurance",
              company: "Standard Biblio Service (EduTech)",
              difficulty: 3,
              tools: ["Postman", "Jira", "Database Testing"],
              objective: "Conduct API and database testing for educational platform.",
              testing: "API Testing • Exploratory • Defect Tracking • Console Debugging",
              outcome: "Delivered stable platform with comprehensive test coverage.",
              color: Colors.blue),
        ],
      ),
    );
  }

  Widget _buildMissionCard(
      BuildContext context, {
        required String title,
        required String company,
        required int difficulty,
        required List<String> tools,
        required String objective,
        required String testing,
        required String outcome,
        required Color color,
      }) {
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
                        fontSize: r.scaleFontSize(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: r.spacing(6)),
                    Text(
                      company,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: r.scaleFontSize(14),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: r.spacing(14),
                  vertical: r.spacing(8),
                ),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.2),
                  border: Border.all(color: Colors.green, width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "✓ COMPLETE",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: r.scaleFontSize(12),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: r.spacing(16)),
          // Difficulty stars
          Row(
            children: [
              Text(
                "DIFFICULTY:",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: r.scaleFontSize(12),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: r.spacing(10)),
              ...List.generate(5, (i) => Padding(
                padding: EdgeInsets.only(right: r.spacing(4)),
                child: Icon(
                  Icons.star,
                  color: i < difficulty ? Colors.amber : Colors.white24,
                  size: r.iconSize(18),
                ),
              )),
            ],
          ),
          SizedBox(height: r.spacing(16)),
          // Tool chips
          Wrap(
            spacing: r.spacing(8),
            runSpacing: r.spacing(8),
            children: tools.map((tool) => Container(
              padding: EdgeInsets.symmetric(
                horizontal: r.spacing(10),
                vertical: r.spacing(6),
              ),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: color.withValues(alpha: 0.5)),
              ),
              child: Text(
                tool,
                style: TextStyle(
                  color: color,
                  fontSize: r.scaleFontSize(12),
                  fontWeight: FontWeight.w600,
                ),
              ),
            )).toList(),
          ),
          SizedBox(height: r.spacing(20)),
          _buildDetailRow(context, "OBJECTIVE:", objective),
          SizedBox(height: r.spacing(12)),
          _buildDetailRow(context, "TESTING:", testing),
          SizedBox(height: r.spacing(12)),
          _buildDetailRow(context, "OUTCOME:", outcome),
        ],
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final r = context.responsive;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.amber,
            fontSize: r.scaleFontSize(13),
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: r.spacing(8)),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white70,
              fontSize: r.scaleFontSize(13),
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}