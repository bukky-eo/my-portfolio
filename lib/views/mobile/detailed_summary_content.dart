import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/widgets/base_modal_content.dart';
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
// For web
import 'package:web/web.dart' as web;
import 'dart:js_interop';


class DetailedSummaryContent extends BaseModalContent {
  const DetailedSummaryContent({Key? key}) : super(key: key);

  // Function to download CV
  Future<void> _downloadCV(BuildContext context) async {
    try {
      if (kIsWeb) {
        // WEB VERSION - Download using blob
        final byteData = await rootBundle.load('assets/cv/Eunice Bukola Ogunshola.pdf');
        final bytes = byteData.buffer.asUint8List();

        // Create blob and download using package:web with proper JS interop
        final blob = web.Blob([bytes.toJS].toJS, web.BlobPropertyBag(type: 'application/pdf'));
        final url = web.URL.createObjectURL(blob);
        final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
        anchor.href = url;
        anchor.download = 'Eunice_Bukola_Ogunshola_CV.pdf';
        anchor.click();
        web.URL.revokeObjectURL(url);

        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('CV download started!'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } else {
        // MOBILE VERSION (Android/iOS)
        final byteData = await rootBundle.load('assets/cv/Eunice Bukola Ogunshola.pdf');
        final bytes = byteData.buffer.asUint8List();

        Directory? directory;

        if (Platform.isAndroid) {
          // For Android 10+ (API 29+), use external storage directory
          if (await Permission.storage.isGranted ||
              await Permission.manageExternalStorage.isGranted) {
            directory = Directory('/storage/emulated/0/Download');
          } else {
            // Request permission
            final storageStatus = await Permission.storage.request();
            final manageStorageStatus = await Permission.manageExternalStorage.request();

            if (storageStatus.isGranted || manageStorageStatus.isGranted) {
              directory = Directory('/storage/emulated/0/Download');
            } else {
              if (context.mounted) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Storage permission is required to download CV'),
                    backgroundColor: Colors.orange,
                    duration: Duration(seconds: 3),
                  ),
                );
              }
              return;
            }
          }
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          directory = await getDownloadsDirectory();
        }

        directory ??= await getApplicationDocumentsDirectory();

        // Create file path
        final filePath = '${directory.path}/Eunice_Bukola_Ogunshola_CV.pdf';
        final file = File(filePath);

        // Write the file
        await file.writeAsBytes(bytes);

        // Show success message
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                Platform.isAndroid
                    ? 'CV downloaded to Downloads folder!'
                    : 'CV saved successfully!',
              ),
              backgroundColor: Colors.green,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error downloading CV: $e');
      }
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error downloading CV. Please try again.'),
            backgroundColor: Colors.red,
            duration: Duration(seconds: 3),
          ),
        );
      }
    }
  }
  @override
  Widget buildContent(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Profile Summary
        buildContentContainer(
          title: 'Profile Summary',
          children: [
            const Text(
              'Formerly a Mobile App Developer, now a detail-oriented Quality Assurance Engineer with experience in automation and manual testing for web and mobile applications. Decently proficient in Cypress, Appium for automation, GitHub Actions for CI/CD, as well as Postman and JMeter for API and performance testing. I\'m passionate about ensuring software reliability and quality, enhancing user experience, and collaborating with cross-functional teams to deliver high-quality products.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                height: 1.5,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),

        // Testing Types
        buildContentContainer(
          title: 'Testing Expertise',
          children: [
            buildSkillItem('Automated Testing'),
            buildSkillItem('Manual Testing'),
            buildSkillItem('Regression Testing'),
            buildSkillItem('Integration Testing'),
            buildSkillItem('Sanity Testing'),
            buildSkillItem('Exploratory Testing'),
            buildSkillItem('Web Application Testing'),
            buildSkillItem('Mobile App Testing'),
            buildSkillItem('API Testing'),
            buildSkillItem('Performance Testing (Load & Stress)'),
            buildSkillItem('CRUD Testing'),
            buildSkillItem('Business Logic Validation'),
          ],
        ),

        // Key Technical Skills
        buildContentContainer(
          title: 'Technical Skills',
          children: [
            buildSkillItem('Test Planning & Case Development'),
            buildSkillItem('Defect Tracking & Documentation'),
            buildSkillItem('CI/CD Pipeline Integration'),
            buildSkillItem('Browser DevTools Debugging'),
            buildSkillItem('Database Testing'),
            buildSkillItem('RESTful API Integration'),
            buildSkillItem('Positive & Negative Testing'),
            buildSkillItem('Smoke Testing'),
          ],
        ),

        // Contact Information
        buildContentContainer(
          title: 'Contact Information',
          children: [
            buildInfoRow(
              Icons.email,
              'euniceogunshola@gmail.com',
            ),
          ],
        ),

        // Download CV Button
        Center(
          child: GestureDetector(
            onTap: () => _downloadCV(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFFFC857),
                    Color(0xFFFFB347),
                  ],
                ),
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFC857).withValues(alpha: 0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.download_rounded,
                    color: Colors.black87,
                    size: 24,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Download CV',
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}