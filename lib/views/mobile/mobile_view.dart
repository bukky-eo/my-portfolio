import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../../shared/constants.dart';
import 'gamepad_view.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotateAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _rotateAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        final isLandscape = orientation == Orientation.landscape;

        if (isLandscape) {
          return const PlayStationController();
        }

        // Stunning portrait fallback
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFFE0E5EC),
                  Color(0xFFECF0F3),
                  Color(0xFFE0E5EC),
                ],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Animated rotating phone icon
                    AnimatedBuilder(
                      animation: _controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: _pulseAnimation.value,
                          child: Transform.rotate(
                            angle: _rotateAnimation.value,
                            child: const NeumorphicContainer(
                              size: 120,
                              child: Icon(
                                Icons.screen_rotation,
                                size: 60,
                                color: Color(0xFF6B7A8F),
                              ),
                            ),
                          ),
                        );
                      },
                    ),



                    const SizedBox(height: 48),

                    // Instruction card
                    const NeumorphicCard(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MiniNeumorphicButton(
                                icon: Icons.phonelink_lock,
                              ),
                              SizedBox(width: 12),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF6B7A8F),
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              MiniNeumorphicButton(
                                icon: Icons.stay_current_landscape,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Rotate to Landscape',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF6B7A8F),
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Please rotate to landscape to view portfolio',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF9FA9BA),
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 48),


                    // Footer
                    const Text(
                      'Built with 🖤, Bukola',
                      style: TextStyle(
                        fontSize: 11,
                        color: Color(0xFF9FA9BA),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}



// Neumorphic text with shadow effect
