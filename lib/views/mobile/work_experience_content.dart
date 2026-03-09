import 'package:flutter/material.dart';

class WorkExperienceContent extends StatelessWidget {
  const WorkExperienceContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Your QA-relevant work experiences with eye-catching summaries
    final List<Map<String, String>> experiences = [
      {
        'company': 'Laddar Africa',
        'logo': 'assets/icons/laddar.png',
        'summary':
        'Spearheaded quality assurance initiatives across multiple high-stakes projects including Fidelity Bank\'s e-commerce platform and Hoardings AdTech solution. Delivered comprehensive API testing, meticulous test case development using Excel, and strategic performance validation through JMeter that ensured seamless digital experiences for thousands of users while collaborating closely with implementation leads and developers.',
      },
      {
        'company': 'BrandDrive',
        'logo': 'assets/icons/branddrive.png',
        'summary':
        'Revolutionized testing efficiency for a dynamic FinTech platform by architecting and implementing automated end-to-end test suites using Cypress, integrated seamlessly into GitHub Actions CI/CD pipeline. Drove product excellence through rigorous API and database testing with Postman, performance optimization using JMeter, and collaborative debugging sessions with developers, significantly reducing regression testing time and enhancing overall product reliability.',
      },
      {
        'company': 'Standard Biblio',
        'logo': 'assets/icons/standardbiblio.png',
        'summary':
        'Elevated EduTech platform reliability through sophisticated exploratory testing techniques and comprehensive API validation using Postman. Demonstrated exceptional problem-solving skills by uncovering critical defects through deep analysis of console and network logs, ensuring educational tools delivered flawless functionality to students and educators while maintaining rigorous documentation standards with Jira.',
      },
      {
        'company': 'Harmonic Studios',
        'logo': 'assets/icons/harmonic.png',
        'summary':
        'Built the foundation for quality-first development as a Mobile App Developer in the Web3 space, engineering cross-platform mobile applications using Dart/Flutter. Transformed Figma designs into polished, production-ready user interfaces while mastering RESTful API integration and debugging techniques. This hands-on development experience cultivated a deep understanding of mobile app architecture, performance optimization, and user experience—skills that now power exceptional mobile QA testing strategies.',
      },
      {
        'company': 'Jara Analytics',
        'logo': 'assets/icons/jara.png',
        'summary':
        'Launched mobile development career by implementing sophisticated Flutter applications and seamlessly integrating third-party APIs into existing mobile ecosystems. Gained invaluable experience in bug identification and resolution, feature enhancement delivery, and understanding the complete software development lifecycle. This developer perspective became the cornerstone of current QA expertise, enabling comprehensive test coverage that addresses both user-facing functionality and underlying technical architecture.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // RESPONSIVE CALCULATIONS
        final screenWidth = MediaQuery.of(context).size.width;
        final screenHeight = MediaQuery.of(context).size.height;
        final isMobile = screenWidth < 600;
        final isTablet = screenWidth >= 600 && screenWidth < 1024;

        // RESPONSIVE DIMENSIONS
        final cardHeight = isMobile
            ? screenHeight * 0.5  // 50% of screen height on mobile
            : isTablet
            ? 450.0
            : 500.0;

        final cardWidth = isMobile
            ? constraints.maxWidth * 0.85  // 85% on mobile for easier scrolling
            : isTablet
            ? constraints.maxWidth * 0.75
            : constraints.maxWidth * 0.8;

        // RESPONSIVE FONT SIZES
        final companyFontSize = isMobile ? 16.0 : isTablet ? 17.0 : 18.0;
        final summaryFontSize = isMobile ? 11.0 : isTablet ? 11.5 : 12.0;

        // RESPONSIVE PADDING
        final cardPadding = isMobile ? 16.0 : 20.0;
        final horizontalPadding = isMobile ? 12.0 : 6.0;

        return SizedBox(
          height: cardHeight,
          child: Scrollbar(
            thickness: isMobile ? 6 : 8,
            radius: const Radius.circular(10),
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: horizontalPadding),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                return Container(
                  width: cardWidth,
                  margin: EdgeInsets.only(right: isMobile ? 12 : 15),
                  padding: EdgeInsets.all(cardPadding),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                      width: isMobile ? 1.5 : 2,
                    ),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[900],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min, // IMPORTANT: Don't force full height
                    children: [
                      // Company Name
                      Text(
                        experiences[index]['company']!,
                        style: TextStyle(
                          color: const Color(0xFFFFC857),
                          fontSize: companyFontSize,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Lastica',
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: isMobile ? 4 : 6),

                      // Divider
                      Container(
                        width: isMobile ? 60 : 80,
                        height: 2,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.white.withValues(alpha: 0.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 8 : 6),

                      // Summary - Scrollable for long text
                      Expanded(
                        child: Scrollbar(
                          thickness: isMobile ? 4 : 6,
                          radius: const Radius.circular(8),
                          thumbVisibility: true,
                          trackVisibility: isMobile ? false : true, // Hide track on mobile for cleaner look
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(), // Better mobile scrolling
                            child: Padding(
                              padding: EdgeInsets.only(right: isMobile ? 6.0 : 8.0),
                              child: Text(
                                experiences[index]['summary']!,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: summaryFontSize,
                                  letterSpacing: 0.3,
                                  height: isMobile ? 1.4 : 1.3, // Line height for readability
                                  fontFamily: 'Poppins',
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),

                      // Add some bottom padding for mobile
                      if (isMobile) const SizedBox(height: 8),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}