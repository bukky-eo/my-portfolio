import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/views/mobile/mobile_view.dart';
import 'views/desktop/desktop_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock landscape for all native mobile devices (phones + tablets)
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
      title: "Eunice's Portfolio",
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final size = MediaQuery.of(context).size;

        final bool isMobile;

        if (kIsWeb) {
          // Web: decide by window size
          isMobile = size.width < 1000 || size.height < 600;
        } else {
          // Native: decide by physical device size
          isMobile = size.shortestSide < 1000;
        }

        return isMobile ? const MobileView() : const DesktopView();
      },
    );
  }
}