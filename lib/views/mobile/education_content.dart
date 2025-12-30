import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/widgets/base_modal_content.dart';

class EducationContent extends BaseModalContent {
  const EducationContent({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    final List<Map<String, String>> education = [
      {
        'institution': 'University of Uyo',
        'degree': 'B.Eng in Computer Engineering',
        'period': 'September 2017 - October 2023',
        'description':
        'Completed Bachelor of Engineering degree in Computer Engineering with focus on software quality and development.',
      },
    ];

    return Column(
      children: education.map((edu) => _buildEducationCard(edu)).toList(),
    );
  }

  Widget _buildEducationCard(Map<String, String> edu) {
    return buildContentContainer(
      title: edu['institution']!,
      children: [
        Text(
          edu['degree']!,
          style: TextStyle(
            color: Colors.green[300],
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        buildInfoRow(
          Icons.calendar_today,
          edu['period']!,
          iconColor: Colors.grey[400],
        ),
        const SizedBox(height: 10),
        Text(
          edu['description']!,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            height: 1.5,
          ),
        ),
      ],
    );
  }
}