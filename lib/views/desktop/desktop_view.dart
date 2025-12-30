import 'package:flutter/material.dart';
import 'widgets/main_screen.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  int selectedIndex = 0;

  void _onLevelChange(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F172A),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  // Sidebar(
                  //   selectedIndex: selectedIndex,
                  //   onTap: (i) => setState(() => selectedIndex = i),
                  // ),
                  Expanded(
                    child: MainScreen(
                      selectedIndex: selectedIndex,
                      onLevelChange: _onLevelChange,
                    ),
                  ),
                ],
              ),
            ),
            // const StatusBar(),
          ],
        ),
      ),
    );
  }
}