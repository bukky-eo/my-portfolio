import 'package:flutter/material.dart';
import 'package:portfolio/views/mobile/widgets/left_side_buttons.dart';
import 'package:portfolio/views/mobile/widgets/right_side_buttons.dart';
import 'package:portfolio/views/theme/app_theme.dart';
import 'dart:async';

class PlayStationController extends StatefulWidget {
  const PlayStationController({Key? key}) : super(key: key);

  @override
  State<PlayStationController> createState() => _PlayStationControllerState();
}

class _PlayStationControllerState extends State<PlayStationController> {
  // Dark mode state
  bool _isDarkMode = false;

  // Typewriter effect state
  String _displayedText = '';
  int _currentIndex = 0;
  Timer? _typewriterTimer;

  // List of humorous phrases about what you do
  final List<String> _phrases = [
    "Breaking apps so you don't have to... professionally!",
    "Finding bugs faster than they can hide",
    "Turning 'It works on my machine' into 'It works everywhere'",
    "QA Engineer: Because developers need someone to blame",
    "Making sure your app doesn't crash and burn",
    "Professional button clicker and edge case finder",
    "I test in production... said no QA ever!",
  ];

  int _currentPhraseIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTypewriterEffect();
  }

  void _startTypewriterEffect() {
    String currentPhrase = _phrases[_currentPhraseIndex];

    _typewriterTimer = Timer.periodic(const Duration(milliseconds: 80), (timer) {
      if (_currentIndex < currentPhrase.length) {
        setState(() {
          _displayedText += currentPhrase[_currentIndex];
          _currentIndex++;
        });
      } else {
        // Pause before clearing and moving to next phrase
        timer.cancel();
        Future.delayed(const Duration(seconds: 3), () {
          if (mounted) {
            setState(() {
              _displayedText = '';
              _currentIndex = 0;
              _currentPhraseIndex = (_currentPhraseIndex + 1) % _phrases.length;
            });
            _startTypewriterEffect();
          }
        });
      }
    });
  }

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  void dispose() {
    _typewriterTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Use theme colors
    final backgroundColor = AppTheme.getBackgroundColor(_isDarkMode);
    final textColor = AppTheme.getTextColor(_isDarkMode);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Center(
            child: Stack(
              children: [
                Row(
                  children: [
                    // CONTROLS ON THE LEFT SIDE
                    Expanded(
                      flex: 3,
                      child: LeftSideButtons(
                        isDarkMode: _isDarkMode,
                        onThemeToggle: _toggleDarkMode,
                      ),
                    ),

                    // GAP IN THE MIDDLE
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),

                    // CONTROLS ON THE RIGHT SIDE
                    Expanded(
                      flex: 3,
                      child: RightSideButtons(isDarkMode: _isDarkMode),
                    ),
                  ],
                ),

                // TEXT FOR DECORATION - Name (VERY BOLD)
                Container(
                  alignment: const Alignment(0, -0.6),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'EUNICE BUKOLA OGUNSHOLA',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Lastica',
                        ),
                      ),
                    ),
                  ),
                ),

                // Title text
                Container(
                  alignment: const Alignment(0, -0.5),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        'QUALITY ASSURANCE ENGINEER',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 10,
                          letterSpacing: 2,
                          fontFamily: 'Lastica',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                // Typewriter text

                // Footer text - Built with Flutter
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Text(
                        _displayedText,
                        style: TextStyle(
                          color: _isDarkMode ? Colors.white : Colors.black.withValues(alpha: 0.8),
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w100,
                          letterSpacing: 0.3,
                          height: 1.3,
                          shadows: _isDarkMode
                              ? null
                              : [
                            Shadow(
                              color: Colors.white.withValues(alpha:0.8),
                              offset: const Offset(0, 0),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Built with 🖤, Bukola',
                        style: TextStyle(
                          color: _isDarkMode
                              ? Colors.grey[400]
                              : Colors.grey[700],
                          fontSize: 9,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 3),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}