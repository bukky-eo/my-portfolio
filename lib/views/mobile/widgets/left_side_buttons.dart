import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/widgets/square_neu_button.dart';
import 'package:portfolio/views/mobile/widgets/blankgap.dart';
import 'package:portfolio/views/mobile/widgets/modal_helper.dart';
import 'package:portfolio/views/mobile/tools_framework_content.dart';
import 'package:portfolio/views/mobile/work_experience_content.dart';
import 'package:portfolio/views/mobile/education_content.dart';
import 'package:portfolio/views/mobile/detailed_summary_content.dart';
import 'package:portfolio/views/theme/app_theme.dart';

class LeftSideButtons extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback? onThemeToggle;

  const LeftSideButtons({
    Key? key,
    this.isDarkMode = false,
    this.onThemeToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final iconColor = AppTheme.getIconColor(isDarkMode);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BlankGap(),
            SquareNeuButton(
              isDarkMode: isDarkMode,
              child: Icon(
                Icons.arrow_left_rounded,
                size: 40,
                color: iconColor,
              ),
              function: () {
                // Left arrow -> Tools & Frameworks
                showSectionModal(
                  context,
                  'TOOLS & FRAMEWORKS',
                  const ToolsFrameworkContent(),
                );
              },
            ),
            const BlankGap(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SquareNeuButton(
              isDarkMode: isDarkMode,
              child: Icon(
                Icons.arrow_drop_up_rounded,
                size: 40,
                color: iconColor,
              ),
              function: () {
                // Up arrow -> Detailed Summary
                showSectionModal(
                  context,
                  'DETAILED SUMMARY',
                  const DetailedSummaryContent(),
                );
              },
            ),
            // DARK MODE TOGGLE IN THE CENTER (Simple style)
            GestureDetector(
              onTap: onThemeToggle,
              child: Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 3),
                child: Icon(
                  isDarkMode ? Icons.light_mode : Icons.dark_mode,
                  color: isDarkMode ? Colors.amber : Colors.grey[700],
                  size: 32,
                ),
              ),
            ),
            SquareNeuButton(
              isDarkMode: isDarkMode,
              child: Icon(
                Icons.arrow_drop_down_rounded,
                size: 40,
                color: iconColor,
              ),
              function: () {
                // Down arrow -> Education
                showSectionModal(
                  context,
                  'EDUCATION',
                  const EducationContent(),
                );
              },
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BlankGap(),
            SquareNeuButton(
              isDarkMode: isDarkMode,
              child: Icon(
                Icons.arrow_right_rounded,
                size: 40,
                color: iconColor,
              ),
              function: () {
                // Right arrow -> Work Experience
                showSectionModal(
                    context,
                    'WORK EXPERIENCE',
                    const WorkExperienceContent()

                );
              },
            ),
            const BlankGap(),
          ],
        ),
      ],
    );
  }
}