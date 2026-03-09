import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/views/mobile/mobile_view.dart';
import 'views/desktop/desktop_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation on mobile
  if (!kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.android ||
          defaultTargetPlatform == TargetPlatform.iOS)) {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final size = MediaQuery
            .of(context)
            .size;
        final shortestSide = size.shortestSide;

        // Use MobileView if device is small (phone)
        final bool isMobile = shortestSide < 600;

        if (isMobile) {
          return const MobileView();
        } else {
          return const DesktopView();
        }
      },
    );
  }
}