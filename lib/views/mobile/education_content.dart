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

    return SingleChildScrollView(
      child: Column(
        children: education.map((edu) => _buildEducationCard(context, edu)).toList(),
      ),
    );
  }

  Widget _buildEducationCard(BuildContext context, Map<String, String> edu) {
    // RESPONSIVE SIZING
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isSmallMobile = screenWidth < 400;

    final institutionFontSize = isSmallMobile ? 16.0 : isMobile ? 18.0 : 20.0;
    final degreeFontSize = isSmallMobile ? 14.0 : isMobile ? 15.0 : 16.0;
    final periodFontSize = isSmallMobile ? 12.0 : isMobile ? 13.0 : 14.0;
    final descriptionFontSize = isSmallMobile ? 12.0 : isMobile ? 13.0 : 14.0;
    final iconSize = isSmallMobile ? 16.0 : isMobile ? 18.0 : 20.0;

    return Container(
      margin: EdgeInsets.only(bottom: isMobile ? 12 : 16),
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.white.withValues(alpha: 0.2),
          width: isMobile ? 1 : 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Institution Name
          Text(
            edu['institution']!,
            style: TextStyle(
              color: const Color(0xFFFFC857),
              fontSize: institutionFontSize,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lastica',
            ),
          ),
          SizedBox(height: isMobile ? 8 : 10),

          // Degree
          Text(
            edu['degree']!,
            style: TextStyle(
              color: Colors.green[300],
              fontSize: degreeFontSize,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: isMobile ? 6 : 8),

          // Period with Icon
          Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.grey[400],
                size: iconSize,
              ),
              SizedBox(width: isMobile ? 6 : 8),
              Expanded(
                child: Text(
                  edu['period']!,
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: periodFontSize,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 8 : 10),

          // Description
          Text(
            edu['description']!,
            style: TextStyle(
              color: Colors.white,
              fontSize: descriptionFontSize,
              height: isMobile ? 1.4 : 1.5,
            ),
          ),
        ],
      ),
    );
  }
}