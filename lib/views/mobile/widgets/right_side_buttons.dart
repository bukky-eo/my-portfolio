import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/widgets/round_neu_button.dart';
import 'package:portfolio/views/mobile/widgets/blankgap.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher_string.dart';

class RightSideButtons extends StatelessWidget {
  final bool isDarkMode;

  const RightSideButtons({Key? key, this.isDarkMode = false}) : super(key: key);

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  // Function to launch email
  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'euniceogunshola@gmail.com',
      query: Uri.encodeFull('subject=Hi Eunice&body='),
    );

    if (!await launchUrl(
      uri,
      mode: LaunchMode.platformDefault,
      webOnlyWindowName: '_self',
    )) {
      throw Exception('Could not launch email');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BlankGap(),
            RoundNeuButton(
              isDarkMode: isDarkMode,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF830303), // Light/baby pink tint for Medium
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/icons/medium.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.article,
                        size: 30,
                        color: Color(0xFFFFB6D9),
                      );
                    },
                  ),
                ),
              ),
              function: () {
                // Medium button
                _launchURL('https://medium.com/@bukola-eo');
              },
            ),
            const BlankGap(),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundNeuButton(
              isDarkMode: isDarkMode,
              child:  Padding(
                padding: const EdgeInsets.all(18.0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF90C490), // Green tint for Gmail
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/icons/gmail.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.email,
                        size: 30,
                        color: Color(0xFF90C490),
                      );
                    },
                  ),
                ),
              ),
              function: () {
                // Gmail button (top)
                _launchURL(
                    'https://mail.google.com/mail/?view=cm&to=euniceogunshola@gmail.com'
                );
              },
            ),
            const BlankGap(),
            RoundNeuButton(
              isDarkMode: isDarkMode,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ColorFiltered(
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF6C6C6C), // Grey tint for GitHub
                    BlendMode.srcIn,
                  ),
                  child: Image.asset(
                    'assets/icons/github_logo.png',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.code,
                        size: 30,
                        color: Color(0xFF6C6C6C),
                      );
                    },
                  ),
                ),
              ),
              function: () {
                // GitHub button (bottom)
                _launchURL('https://github.com/bukky-eo');
              },
            )
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const BlankGap(),
            RoundNeuButton(
              isDarkMode: isDarkMode,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  'assets/icons/LinkedIn.png',
                  fit: BoxFit.contain,
                  // color: Color(0xFF5DADE),
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.work,
                      size: 30,
                      color: Color(0xFF5DADE2),
                    );
                  },
                ),
              ),
              function: () {
                // LinkedIn button
                _launchURL('https://www.linkedin.com/in/euniceogunshola/');
              },
            ),
            const BlankGap(),
          ],
        ),
      ],
    );
  }
}