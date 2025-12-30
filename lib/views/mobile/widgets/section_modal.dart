import 'package:flutter/material.dart';
import 'dart:async';

class SectionModal extends StatefulWidget {
  final String title;
  final Widget content;

  const SectionModal({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<SectionModal> createState() => _SectionModalState();
}

class _SectionModalState extends State<SectionModal> {
  String _displayedText = '';
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTypewriterEffect();
  }

  void _startTypewriterEffect() {
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {  // Increased from 100ms to 150ms
      if (_currentIndex < widget.title.length) {
        setState(() {
          _displayedText += widget.title[_currentIndex];
          _currentIndex++;
        });
      } else {
        // Add a pause before restarting
        timer.cancel();
        Future.delayed(const Duration(seconds: 2), () {  // 2 second pause before restarting
          if (mounted) {
            setState(() {
              _displayedText = '';
              _currentIndex = 0;
            });
            _startTypewriterEffect();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            // Title with typewriter effect
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      _displayedText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lastica',
                      ),
                    ),
                  ),
                  // Close button
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 28),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),

            // Divider
            Container(
              height: 1,
              color: Colors.white.withValues(alpha:0.3),
            ),

            // Content area (scrollable)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: widget.content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}