import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import '../../utils/custom_scrollbar.dart';
import '../../utils/responsive.dart';

class QALab extends BaseLevelPage {
  const QALab({
    super.key,
    super.onNextLevel,
    super.onBack,
  });

  @override
  State<QALab> createState() => _QALabState();
}

class _QALabState extends BaseLevelPageState<QALab> {

  @override
  String get levelTitle => "LEVEL 4: QA TEST LAB";

  @override
  IconData get levelIcon => Icons.science;

  @override
  Color get accentColor => Colors.pink;

  @override
  Widget buildLevelContent(BuildContext context) {
    final responsive = context.responsive;

    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(responsive.spacing(32)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "TESTING METHODOLOGY",
              style: TextStyle(
                color: Colors.amber,
                fontSize: responsive.scaleFontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: responsive.spacing(24)),

            Row(
              children: [

                Expanded(
                  child: _buildLabPanel(
                    context,
                    title: "Test Strategy",
                    icon: Icons.analytics,
                    color: Colors.cyan,
                    confidence: 0.85,
                    description:
                    "Plan test coverage, risk areas, entry/exit criteria and acceptance rules before execution.",
                    bullets: [
                      "Define scope & risks",
                      "Write test cases",
                      "Plan coverage",
                      "Prioritize features",
                    ],
                  ),
                ),

                SizedBox(width: responsive.spacing(20)),

                Expanded(
                  child: _buildLabPanel(
                    context,
                    title: "Automation Approach",
                    icon: Icons.bolt,
                    color: Colors.purple,
                    confidence: 0.75,
                    description:
                    "Automate repeatable & critical paths to improve release confidence and reduce manual effort.",
                    bullets: [
                      "UI & API test coverage",
                      "Stability over speed",
                      "Pipeline integration",
                      "Debug & refactor",
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: responsive.spacing(20)),

            Row(
              children: [

                Expanded(
                  child: _buildLabPanel(
                    context,
                    title: "Test Execution & Reporting",
                    icon: Icons.bug_report,
                    color: Colors.green,
                    confidence: 0.90,
                    description:
                    "Run manual & automated tests, log bugs clearly and collaborate with engineering teams.",
                    bullets: [
                      "Functional & Regression",
                      "Defect reporting",
                      "Retesting",
                      "Root cause support",
                    ],
                  ),
                ),

                SizedBox(width: responsive.spacing(20)),

                Expanded(
                  child: _buildLabPanel(
                    context,
                    title: "Tools & Frameworks",
                    icon: Icons.build,
                    color: Colors.orange,
                    confidence: 0.80,
                    description:
                    "Hands-on experience with QA tooling across automation, API testing and CI pipelines.",
                    bullets: [
                      "Cypress • Playwright • Appium",
                      "Postman • JMeter",
                      "GitHub Actions • Jenkins",
                      "Flutter • JS • Git",
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabPanel(
      BuildContext context, {
        required String title,
        required IconData icon,
        required Color color,
        required double confidence,
        required String description,
        required List<String> bullets,
      }) {
    final responsive = context.responsive;

    return Container(
      padding: EdgeInsets.all(responsive.spacing(24)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha: 0.5), width: 2),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// Title
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(responsive.spacing(12)),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: color, width: 2),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: responsive.iconSize(28),
                ),
              ),

              SizedBox(width: responsive.spacing(12)),

              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: color,
                    fontSize: responsive.scaleFontSize(18),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: responsive.spacing(16)),

          Text(
            description,
            style: TextStyle(
              color: Colors.white70,
              fontSize: responsive.scaleFontSize(13),
              height: 1.5,
            ),
          ),

          SizedBox(height: responsive.spacing(16)),

          ...bullets.map(
                (bullet) => Padding(
              padding: EdgeInsets.only(bottom: responsive.spacing(8)),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: color,
                    size: responsive.iconSize(18),
                  ),
                  SizedBox(width: responsive.spacing(8)),
                  Expanded(
                    child: Text(
                      bullet,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: responsive.scaleFontSize(13),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: responsive.spacing(16)),

          /// Confidence Bar
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text(
                    "CONFIDENCE",
                    style: TextStyle(
                      color: Colors.white60,
                      fontSize: responsive.scaleFontSize(11),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    "${(confidence * 100).toInt()}%",
                    style: TextStyle(
                      color: color,
                      fontSize: responsive.scaleFontSize(11),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              SizedBox(height: responsive.spacing(6)),

              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0, end: confidence),
                  duration: const Duration(milliseconds: 1500),
                  builder: (context, value, _) => LinearProgressIndicator(
                    value: value,
                    backgroundColor: Colors.white10,
                    color: color,
                    minHeight: responsive.spacing(8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}