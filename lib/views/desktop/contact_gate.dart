import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../utils/custom_scrollbar.dart';

class ContactGate extends BaseLevelPage {
  const ContactGate({
    super.key,
    super.onBack,
  });

  @override
  State<ContactGate> createState() => _ContactGateState();
}

class _ContactGateState extends BaseLevelPageState<ContactGate> {
  final _formKey = GlobalKey<FormState>();
  final name = TextEditingController();
  final email = TextEditingController();
  final subject = TextEditingController();
  final message = TextEditingController();

  @override
  String get levelTitle => "FINAL GATE: RECRUIT THIS PLAYER";

  @override
  IconData get levelIcon => Icons.castle;

  @override
  Color get accentColor => Colors.green;

  @override
  bool get showNextButton => false; // Last level has no next button

  @override
  double get contentPadding => 60.0;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    subject.dispose();
    message.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (_formKey.currentState!.validate()) {
      const String emailTo = 'euniceogunshola@gmail.com';
      final String emailSubject = subject.text.isNotEmpty
          ? subject.text
          : 'Contact from ${name.text}';
      final String emailBody =
          'Name: ${name.text}\nEmail: ${email.text}\n\nMessage:\n${message.text}';

      final Uri emailUri = Uri(
        scheme: 'mailto',
        path: emailTo,
        queryParameters: {
          'subject': emailSubject,
          'body': emailBody,
        },
      );

      try {
        await launchUrl(
          emailUri,
          mode: LaunchMode.platformDefault,
        );

        if (mounted) {
          name.clear();
          email.clear();
          subject.clear();
          message.clear();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Opening your email client..."),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Error: Could not open email client."),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      }
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Could not open link"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _downloadCV() async {
    // For web - triggers download
    const cvUrl = 'assets/cv/Eunice Bukola Ogunshola.pdf';
    try {
      await launchUrl(Uri.parse(cvUrl), mode: LaunchMode.platformDefault);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("CV download started!"),
            backgroundColor: Colors.green,
          ),
        );
      }
    }
  }

  @override
  Widget buildHeader() {
    return Row(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xff667eea), Color(0xff764ba2)],
            ),
            border: Border.all(color: Colors.cyan, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withValues(alpha:0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
          ),
          child: const Icon(Icons.person, color: Colors.white, size: 32),
        ),
        const SizedBox(width: 20),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.gamepad, color: Colors.cyan, size: 20),
                SizedBox(width: 8),
                Text(
                  "PLAYER:",
                  style: TextStyle(
                    color: Colors.cyan,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "Eunice Bukola Ogunshola",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha:0.2),
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.circle, color: Colors.green, size: 12),
              SizedBox(width: 8),
              Text(
                "AVAILABLE FOR HIRE",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget buildLevelContent(BuildContext context) {
    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            const Text(
              "You've reached the final gate. Ready to work together?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                height: 1.6,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: _buildContactForm(),
                ),
                const SizedBox(width: 24),
                Expanded(
                  flex: 2,
                  child: _buildQuickContact(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withValues(alpha:0.5), width: 2),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SEND A MESSAGE",
              style: TextStyle(
                color: Colors.green,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(
              controller: name,
              label: "Your Name",
              icon: Icons.person,
              validator: (v) => v == null || v.isEmpty ? "Name required" : null,
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: email,
              label: "Your Email",
              icon: Icons.email,
              validator: (v) {
                if (v == null || v.isEmpty) return "Email required";
                if (!v.contains("@")) return "Invalid email";
                return null;
              },
            ),
            const SizedBox(height: 16),
            _buildTextField(
              controller: subject,
              label: "Subject",
              icon: Icons.subject,
              validator: (v) =>
              v == null || v.isEmpty ? "Subject required" : null,
            ),
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Message",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: message,
                  validator: (v) => v!.isEmpty ? "Enter your message" : null,
                  maxLines: 5,
                  style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  decoration: InputDecoration(
                    hintText: "Type your message here...",
                    hintStyle: const TextStyle(color: Colors.white30, fontFamily: 'Poppins'),
                    filled: true,
                    fillColor: Colors.black26,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.white24),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.cyan, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _sendEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.send, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "SEND MESSAGE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickContact() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyan.withValues(alpha:0.5), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "QUICK CONNECT",
            style: TextStyle(
              color: Colors.cyan,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 24),
          _buildContactButton(
            icon: Icons.email,
            label: "Email",
            value: "euniceogunshola@gmail.com",
            color: Colors.red,
            onTap: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: 'euniceogunshola@gmail.com',
              );
              await launchUrl(emailUri, mode: LaunchMode.platformDefault);
            },
          ),
          const SizedBox(height: 16),
          _buildContactButton(
            icon: Icons.business,
            label: "LinkedIn",
            value: "Connect on LinkedIn",
            color: Colors.blue,
            onTap: () => _launchURL('https://www.linkedin.com/in/euniceogunshola/'),
          ),
          const SizedBox(height: 16),
          _buildContactButton(
            icon: Icons.code,
            label: "GitHub",
            value: "View Projects",
            color: Colors.purple,
            onTap: () => _launchURL('https://github.com/bukky-eo'),
          ),
          const SizedBox(height: 16),
          _buildContactButton(
            icon: Icons.download,
            label: "Download CV",
            value: "Get Resume",
            color: Colors.amber,
            onTap: _downloadCV,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.withValues(alpha:0.5)),
            ),
            child: const Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 20),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Available for QA roles & freelance projects",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      height: 1.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required String? Function(String?) validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white, fontFamily: 'Poppins'),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white60, fontFamily: 'Poppins'),
        prefixIcon: Icon(icon, color: Colors.cyan),
        filled: true,
        fillColor: Colors.black26,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.white24),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.cyan, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
    required VoidCallback onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: color.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha:0.5)),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha:0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 12,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: color, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}