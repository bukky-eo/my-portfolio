import 'package:flutter/material.dart';
import 'package:portfolio/views/desktop/widgets/base_level_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/shared/models/email.dart';
import '../../utils/custom_scrollbar.dart';
import '../../utils/snackbar.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/foundation.dart' show kIsWeb, kDebugMode;
import 'package:web/web.dart' as web;
import 'dart:js_interop';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../utils/responsive.dart';

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
  bool _isSending = false;

  @override
  String get levelTitle => "FINAL GATE: RECRUIT THIS PLAYER";

  @override
  IconData get levelIcon => Icons.castle;

  @override
  Color get accentColor => Colors.green;

  @override
  bool get showNextButton => false;

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    subject.dispose();
    message.dispose();
    super.dispose();
  }

  Future<void> _sendEmail() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSending = true);
    try {
      final success = await EmailJSService.sendEmail(
        fromName: name.text.trim(),
        fromEmail: email.text.trim(),
        subject: subject.text.trim(),
        message: message.text.trim(),
      );
      if (!mounted) return;
      setState(() => _isSending = false);
      if (success) {
        name.clear(); email.clear(); subject.clear(); message.clear();
        showCustomSnackBar(context, message: "Message sent successfully!");
      } else {
        showCustomSnackBar(context,
            message: "Failed to send message. Please try again.",
            color: Colors.red);
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isSending = false);
      showCustomSnackBar(context,
          message: 'An error occurred. Please try again later.',
          color: Colors.orange);
    }
  }

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri, mode: LaunchMode.platformDefault);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Could not open link"), backgroundColor: Colors.red),
        );
      }
    }
  }

  Future<void> _downloadCV() async {
    try {
      if (kIsWeb) {
        final byteData = await rootBundle.load('assets/cv/Eunice Bukola Ogunshola.pdf');
        final bytes = byteData.buffer.asUint8List();
        final blob = web.Blob([bytes.toJS].toJS, web.BlobPropertyBag(type: 'application/pdf'));
        final url = web.URL.createObjectURL(blob);
        final anchor = web.document.createElement('a') as web.HTMLAnchorElement;
        anchor.href = url;
        anchor.download = 'Eunice_Bukola_Ogunshola_CV.pdf';
        anchor.click();
        web.URL.revokeObjectURL(url);
        if (mounted) showCustomSnackBar(context, message: 'CV downloaded successfully', color: Colors.green);
      } else {
        final byteData = await rootBundle.load('assets/cv/Eunice Bukola Ogunshola.pdf');
        final bytes = byteData.buffer.asUint8List();
        Directory? directory;
        if (Platform.isAndroid) {
          if (await Permission.storage.isGranted || await Permission.manageExternalStorage.isGranted) {
            directory = Directory('/storage/emulated/0/Download');
          } else {
            final storageStatus = await Permission.storage.request();
            final manageStorageStatus = await Permission.manageExternalStorage.request();
            if (storageStatus.isGranted || manageStorageStatus.isGranted) {
              directory = Directory('/storage/emulated/0/Download');
            } else {
              if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Storage permission is required to download CV'), backgroundColor: Colors.orange, duration: Duration(seconds: 3)));
              return;
            }
          }
        } else if (Platform.isIOS) {
          directory = await getApplicationDocumentsDirectory();
        } else {
          directory = await getDownloadsDirectory();
        }
        directory ??= await getApplicationDocumentsDirectory();
        final filePath = '${directory.path}/Eunice_Bukola_Ogunshola_CV.pdf';
        await File(filePath).writeAsBytes(bytes);
        if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(Platform.isAndroid ? 'CV downloaded to Downloads folder!' : 'CV saved successfully!'), backgroundColor: Colors.green, duration: const Duration(seconds: 3)));
      }
    } catch (e) {
      if (kDebugMode) print('Error downloading CV: $e');
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error downloading CV. Please try again.'), backgroundColor: Colors.red));
    }
  }

  // ── Responsive header override ─────────────────────────────────────────────

  @override
  Widget buildHeader(BuildContext context) {
    final r = context.responsive;

    return Row(
      children: [
        Container(
          width: r.iconSize(60),
          height: r.iconSize(60),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.cyan, width: 3),
            boxShadow: [
              BoxShadow(color: Colors.cyan.withValues(alpha: 0.5), blurRadius: 20, spreadRadius: 2),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/images/lego.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: r.spacing(20)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.gamepad, color: Colors.cyan, size: r.iconSize(20)),
                  SizedBox(width: r.spacing(8)),
                  Text(
                    "PLAYER:",
                    style: TextStyle(
                      color: Colors.cyan,
                      fontSize: r.scaleFontSize(14),
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ],
              ),
              SizedBox(height: r.spacing(4)),
              Text(
                "EUNICE BUKOLA OGUNSHOLA",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: r.scaleFontSize(22),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: r.spacing(16), vertical: r.spacing(8)),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.2),
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.circle, color: Colors.green, size: r.iconSize(12)),
              SizedBox(width: r.spacing(8)),
              Text(
                "AVAILABLE FOR HIRE",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                  fontSize: r.scaleFontSize(13),
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ── Level content ──────────────────────────────────────────────────────────

  @override
  Widget buildLevelContent(BuildContext context) {
    final r = context.responsive;

    return CustomScrollbar(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(r.spacing(40)),
        child: Column(
          children: [
            Text(
              "You've reached the final gate. Ready to work together?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white70,
                fontSize: r.scaleFontSize(18),
                height: 1.6,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: r.spacing(40)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: _buildContactForm(context)),
                SizedBox(width: r.spacing(24)),
                Expanded(flex: 2, child: _buildQuickContact(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm(BuildContext context) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(28)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.green.withValues(alpha: 0.5), width: 2),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SEND A MESSAGE",
              style: TextStyle(
                color: Colors.green,
                fontSize: r.scaleFontSize(18),
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: r.spacing(24)),
            _buildTextField(context,
                controller: name,
                label: "Your Name",
                icon: Icons.person,
                validator: (v) => v == null || v.isEmpty ? "Name required" : null),
            SizedBox(height: r.spacing(16)),
            _buildTextField(context,
                controller: email,
                label: "Your Email",
                icon: Icons.email,
                validator: (v) {
                  if (v == null || v.isEmpty) return "Email required";
                  if (!v.contains("@")) return "Invalid email";
                  return null;
                }),
            SizedBox(height: r.spacing(16)),
            _buildTextField(context,
                controller: subject,
                label: "Subject",
                icon: Icons.subject,
                validator: (v) => v == null || v.isEmpty ? "Subject required" : null),
            SizedBox(height: r.spacing(16)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Message",
                  style: TextStyle(
                    color: Colors.white60,
                    fontSize: r.scaleFontSize(14),
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                SizedBox(height: r.spacing(8)),
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
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.white24)),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.cyan, width: 2)),
                  ),
                ),
              ],
            ),
            SizedBox(height: r.spacing(24)),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSending ? null : _sendEmail,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isSending ? Colors.grey : Colors.green,
                  padding: EdgeInsets.symmetric(vertical: r.spacing(16)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: _isSending
                    ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: r.iconSize(20),
                      height: r.iconSize(20),
                      child: const CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    ),
                    SizedBox(width: r.spacing(12)),
                    Text(
                      "SENDING...",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: r.scaleFontSize(16), fontFamily: 'Poppins'),
                    ),
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.send, color: Colors.white, size: r.iconSize(20)),
                    SizedBox(width: r.spacing(8)),
                    Text(
                      "SEND MESSAGE",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: r.scaleFontSize(16), fontFamily: 'Poppins'),
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

  Widget _buildQuickContact(BuildContext context) {
    final r = context.responsive;

    return Container(
      padding: EdgeInsets.all(r.spacing(28)),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.cyan.withValues(alpha: 0.5), width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "QUICK CONNECT",
            style: TextStyle(
              color: Colors.cyan,
              fontSize: r.scaleFontSize(18),
              fontWeight: FontWeight.bold,
              fontFamily: 'Poppins',
            ),
          ),
          SizedBox(height: r.spacing(24)),
          _buildContactButton(context,
              icon: Icons.email,
              label: "Email",
              value: "euniceogunshola@gmail.com",
              color: Colors.red,
              onTap: () async {
                await launchUrl(
                  Uri.parse('https://mail.google.com/mail/?view=cm&to=euniceogunshola@gmail.com'),
                  mode: LaunchMode.platformDefault,
                );
              }),
          SizedBox(height: r.spacing(16)),
          _buildContactButton(context,
              icon: Icons.business,
              label: "LinkedIn",
              value: "Connect on LinkedIn",
              color: Colors.blue,
              onTap: () => _launchURL('https://www.linkedin.com/in/euniceogunshola/')),
          SizedBox(height: r.spacing(16)),
          _buildContactButton(context,
              icon: Icons.code,
              label: "GitHub",
              value: "View Projects",
              color: Colors.purple,
              onTap: () => _launchURL('https://github.com/bukky-eo')),
          SizedBox(height: r.spacing(16)),
          _buildContactButton(context,
              icon: Icons.download,
              label: "Download CV",
              value: "Get Resume",
              color: Colors.amber,
              onTap: _downloadCV),
          SizedBox(height: r.spacing(32)),
          Container(
            padding: EdgeInsets.all(r.spacing(16)),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: r.iconSize(20)),
                SizedBox(width: r.spacing(12)),
                Expanded(
                  child: Text(
                    "Available for QA roles & freelance projects",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: r.scaleFontSize(13),
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

  Widget _buildTextField(
      BuildContext context, {
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.white24)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.cyan, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red, width: 2)),
      ),
    );
  }

  Widget _buildContactButton(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String value,
        required Color color,
        required VoidCallback onTap,
      }) {
    final r = context.responsive;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(r.spacing(16)),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color.withValues(alpha: 0.5)),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(r.spacing(10)),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: color, size: r.iconSize(20)),
              ),
              SizedBox(width: r.spacing(12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                        fontSize: r.scaleFontSize(14),
                        fontFamily: 'Poppins',
                      ),
                    ),
                    SizedBox(height: r.spacing(2)),
                    Text(
                      value,
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: r.scaleFontSize(12),
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, color: color, size: r.iconSize(16)),
            ],
          ),
        ),
      ),
    );
  }
}