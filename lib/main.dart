import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'views/mobile/gamepad_view.dart';
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
        final width = MediaQuery.of(context).size.width;

        // Choose layout based on screen width
        if (width >= 800) {
          // Wide screen -> desktop view
          return const DesktopView();
        } else {
          // Narrow screen -> mobile gamepad view
          return const PlayStationController();
        }
      },
    );
  }
}
