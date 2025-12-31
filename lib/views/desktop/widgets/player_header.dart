import 'package:flutter/material.dart';

class PlayerHeader extends StatelessWidget {
  const PlayerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Profile Image
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.cyan, width: 3),
            boxShadow: [
              BoxShadow(
                color: Colors.cyan.withValues(alpha: 0.5),
                blurRadius: 20,
                spreadRadius: 2,
              ),
            ],
            image: const DecorationImage(
              image: AssetImage('assets/images/lego.png'), // Update path
              fit: BoxFit.cover,
            ),
          ),
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
                  ),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "EUNICE BUKOLA OGUNSHOLA",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.2),
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Row(
            children: [
              Icon(Icons.circle, color: Colors.green, size: 12),
              SizedBox(width: 8),
              Text(
                "READY TO PLAY",
                style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Instructions for adding your profile image:
//
// METHOD 1: Using Local Asset
// 1. Create an 'assets/images' folder in your project root
// 2. Add your profile image (e.g., profile.jpg) to that folder
// 3. Update pubspec.yaml:
//    flutter:
//      assets:
//        - assets/images/profile.jpg
// 4. Replace NetworkImage with: AssetImage('assets/images/profile.jpg')
//
// METHOD 2: Using Network Image
// 1. Upload your image to a hosting service (Imgur, Cloudinary, etc.)
// 2. Replace the URL in NetworkImage with your image URL
//
// Recommended image: Square image, at least 300x300px for best quality