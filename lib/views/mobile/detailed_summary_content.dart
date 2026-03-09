import 'package:flutter/material.dart';
import 'package:portfolio/utils/snackbar.dart';
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
          showCustomSnackBar(context, message: 'CV downloaded successfully', color: Colors.black);
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
    // RESPONSIVE SIZING
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isSmallMobile = screenWidth < 400;

    final titleFontSize = isSmallMobile ? 12.0 : isMobile ? 13.0 : 14.0;
    final bodyFontSize = isSmallMobile ? 11.0 : isMobile ? 12.0 : 14.0;
    final buttonFontSize = isSmallMobile ? 13.0 : isMobile ? 14.0 : 16.0;
    final iconSize = isSmallMobile ? 20.0 : isMobile ? 22.0 : 24.0;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Summary
          buildContentContainer(
            title: 'Profile Summary',
            children: [
              Text(
                'Formerly a Mobile App Developer, now a detail-oriented Quality Assurance Engineer with experience in automation and manual testing for web and mobile applications. Decently proficient in Cypress, Appium for automation, GitHub Actions for CI/CD, as well as Postman and JMeter for API and performance testing. I\'m passionate about ensuring software reliability and quality, enhancing user experience, and collaborating with cross-functional teams to deliver high-quality products.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: bodyFontSize,
                  height: isMobile ? 1.4 : 1.5,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),

          // Testing Types
          buildContentContainer(
            title: 'Testing Expertise',
            children: [
              _buildSkillGrid(
                context,
                [
                  'Automated Testing',
                  'Manual Testing',
                  'Regression Testing',
                  'Integration Testing',
                  'Sanity Testing',
                  'Exploratory Testing',
                  'Web Application Testing',
                  'Mobile App Testing',
                  'API Testing',
                  'Performance Testing (Load & Stress)',
                  'CRUD Testing',
                  'Business Logic Validation',
                ],
                fontSize: titleFontSize,
              ),
            ],
          ),

          // Key Technical Skills
          buildContentContainer(
            title: 'Technical Skills',
            children: [
              _buildSkillGrid(
                context,
                [
                  'Test Planning & Case Development',
                  'Defect Tracking & Documentation',
                  'CI/CD Pipeline Integration',
                  'Browser DevTools Debugging',
                  'Database Testing',
                  'RESTful API Integration',
                  'Positive & Negative Testing',
                  'Smoke Testing',
                ],
                fontSize: titleFontSize,
              ),
            ],
          ),

          // Contact Information
          buildContentContainer(
            title: 'Contact Information',
            children: [
              Row(
                children: [
                  Icon(Icons.email, color: Colors.white, size: iconSize),
                  SizedBox(width: isMobile ? 8 : 10),
                  Expanded(
                    child: Text(
                      'euniceogunshola@gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: bodyFontSize,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Download CV Button
          Center(
            child: GestureDetector(
              onTap: () => _downloadCV(context),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isSmallMobile ? 20 : isMobile ? 25 : 30,
                  vertical: isSmallMobile ? 12 : isMobile ? 13 : 15,
                ),
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
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.download_rounded,
                      color: Colors.black87,
                      size: iconSize,
                    ),
                    SizedBox(width: isMobile ? 8 : 10),
                    Text(
                      'Download CV',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: buttonFontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: isMobile ? 15 : 20),
        ],
      ),
    );
  }

  // Helper method to build responsive skill grid
  Widget _buildSkillGrid(BuildContext context, List<String> skills, {required double fontSize}) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Wrap(
      spacing: isMobile ? 6 : 8,
      runSpacing: isMobile ? 6 : 8,
      children: skills.map((skill) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 8 : 10,
            vertical: isMobile ? 4 : 6,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.3),
              width: 1,
            ),
          ),
          child: Text(
            skill,
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontFamily: 'Poppins',
            ),
          ),
        );
      }).toList(),
    );
  }
}