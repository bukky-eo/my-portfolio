import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailJSService {
  // Replace these with your EmailJS credentials
  static const String serviceId = 'service_2ya352t';
  static const String templateId = 'template_e3dketg';
  static const String publicKey = 'D3l32sVg245HHYA01';

  static Future<bool> sendEmail({
    required String fromName,
    required String fromEmail,
    required String subject,
    required String message,
  }) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': publicKey,
          'template_params': {
            'from_name': fromName,
            'from_email': fromEmail,
            'subject': subject,
            'message': message,
            'to_email': 'euniceogunshola@gmail.com',
          },
        }),
      );

      return response.statusCode == 200;
    } catch (e) {
      print('Error sending email: $e');
      return false;
    }
  }
}