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
        'company': 'TechMosaic',
        'logo': 'assets/icons/techmosaic.png',
        'summary':
        'Successfully bridged product management expertise with quality assurance precision, orchestrating the timely delivery of a company website project while ensuring every feature implementation meticulously met Product Requirements Document standards through comprehensive review processes and strategic progress tracking.',
      },
      {
        'company': 'Standard Biblio',
        'logo': 'assets/icons/standardbiblio.png',
        'summary':
        'Elevated EduTech platform reliability through sophisticated exploratory testing techniques and comprehensive API validation using Postman. Demonstrated exceptional problem-solving skills by uncovering critical defects through deep analysis of console and network logs, ensuring educational tools delivered flawless functionality to students and educators while maintaining rigorous documentation standards with Jira.',
      },
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        // Calculate 80% of available width
        final cardWidth = constraints.maxWidth * 0.8;

        return SizedBox(
          height: 500,
          child: Scrollbar(
            thickness: 8,
            radius: const Radius.circular(10),
            thumbVisibility: true,
            trackVisibility: true,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                return Container(
                  width: cardWidth,
                  margin: const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[900],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha:0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Company Name
                      Text(
                        experiences[index]['company']!,
                        style: const TextStyle(
                          color: Color(0xFFFFC857), // Yellowy color
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Lastica',
                        ),
                        textAlign: TextAlign.center,
                      ),

                      const SizedBox(height: 6),

                      // Divider
                      Container(
                        width: 80,
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

                      const SizedBox(height: 6),

                      // Summary - Scrollable for long text with neumorphic scrollbar
                      Expanded(
                        child: Scrollbar(
                          thickness: 6,
                          radius: const Radius.circular(8),
                          thumbVisibility: true,
                          trackVisibility: true,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                experiences[index]['summary']!,
                                style: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 12,
                                  letterSpacing: 0.3,
                                  fontFamily: 'Poppins', // See font suggestions below
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
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