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
    _timer = Timer.periodic(const Duration(milliseconds: 150), (timer) {
      if (_currentIndex < widget.title.length) {
        setState(() {
          _displayedText += widget.title[_currentIndex];
          _currentIndex++;
        });
      } else {
        timer.cancel();
        Future.delayed(const Duration(seconds: 2), () {
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
    final sw = MediaQuery.of(context).size.width;
    final sh = MediaQuery.of(context).size.height;

    // Everything scales linearly with screen width
    final titleFontSize = (sw * 0.042).clamp(13.0, 24.0);
    final headerPadding = (sw * 0.04).clamp(10.0, 20.0);
    final contentPadding = (sw * 0.04).clamp(10.0, 20.0);
    final closeIconSize = (sw * 0.06).clamp(18.0, 28.0);
    final dividerThickness = (sw * 0.003).clamp(0.5, 2.0);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: sw * 0.04,
        vertical: sh * 0.05,
      ),
      child: Container(
        width: sw * 0.92,
        height: sh * 0.78,
        decoration: BoxDecoration(
          color: Colors.black87,
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [

            // ── Typewriter title ──────────────────────────────────────
            Padding(
              padding: EdgeInsets.all(headerPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      _displayedText,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Lastica',
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(width: headerPadding * 0.5),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: closeIconSize,
                    ),
                  ),
                ],
              ),
            ),

            // ── Divider ───────────────────────────────────────────────
            Container(
              height: dividerThickness,
              color: Colors.white.withValues(alpha: 0.3),
            ),

            // ── Body / content ────────────────────────────────────────
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(contentPadding),
                child: widget.content,
              ),
            ),
          ],
        ),
      ),
    );
  }
}