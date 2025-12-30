import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/widgets/base_modal_content.dart';

class ToolsFrameworkContent extends BaseModalContent {
  const ToolsFrameworkContent({Key? key}) : super(key: key);

  @override
  Widget buildContent(BuildContext context) {
    // List of your actual tools and frameworks from CV
    final List<Map<String, String>> tools = [
      {'name': 'Appium', 'logo': 'assets/icons/appium.png'},
      {'name': 'Chromatic', 'logo': 'assets/icons/Chromatic.png'},
      {'name': 'Cypress', 'logo': 'assets/icons/Cypress.png'},
      {'name': 'Excel', 'logo': 'assets/icons/excel.png'},
      {'name': 'Flutter/Dart', 'logo': 'assets/icons/flutter.png'},
      {'name': 'Git/GitHub', 'logo': 'assets/icons/GitHub.png'},
      {'name': 'JavaScript', 'logo': 'assets/icons/javascript.png'},
      {'name': 'Jenkins', 'logo': 'assets/icons/jenkins.png'},
      {'name': 'Jira', 'logo': 'assets/icons/jira.png'},
      {'name': 'JMeter', 'logo': 'assets/icons/jmeter.png'},
      {'name': 'Playwright', 'logo': 'assets/icons/Playwright.png'},
      {'name': 'Postman', 'logo': 'assets/icons/Postman.png'},
      {'name': 'TestRail', 'logo': 'assets/icons/TestRail.png'},
    ];

    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tools.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Tool/Framework Logo Container
                Container(
                  width: 120,
                  height: 120,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[900],
                  ),
                  child: Image.asset(
                    tools[index]['logo']!,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.code,
                        size: 50,
                        color: Colors.white,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // Tool/Framework Name
                Text(
                  tools[index]['name']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}