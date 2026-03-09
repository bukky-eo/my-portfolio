import 'package:flutter/material.dart';

/// Responsive utility that scales UI elements based on screen width.
/// Uses smooth linear interpolation so everything shrinks gradually
/// as the browser/window narrows — no abrupt jumps.
///
/// SCALE FACTOR:
///   >= 1400px  →  1.00  (full size)
///    1100px    →  0.87
///     800px    →  0.72
///     600px    →  0.60  (minimum for desktop view)
class ResponsiveUtils {
  final BuildContext context;

  const ResponsiveUtils(this.context);

  double get screenWidth => MediaQuery.of(context).size.width;
  double get screenHeight => MediaQuery.of(context).size.height;

  // ── Breakpoint helpers ────────────────────────────────────────────────────
  bool get isLaptop => screenWidth >= 1024 && screenWidth < 1440;
  bool get isDesktop => screenWidth >= 1440 && screenWidth < 1920;
  bool get isLargeDesktop => screenWidth >= 1920;

  // ── Core scale factor: linear between 600 px (0.60) and 1400 px (1.0) ────
  double get _scale {
    const double maxW = 1400.0;
    const double minW = 600.0;
    const double minScale = 0.60;
    if (screenWidth >= maxW) return 1.0;
    if (screenWidth <= minW) return minScale;
    return minScale + (1.0 - minScale) * ((screenWidth - minW) / (maxW - minW));
  }

  // ── Public API ────────────────────────────────────────────────────────────

  /// Scale a font size.
  double scaleFontSize(double baseSize) =>
      (baseSize * _scale).clamp(baseSize * 0.55, baseSize * 1.15);

  /// Scale spacing / padding values.
  double spacing(double baseSpacing) =>
      (baseSpacing * _scale).clamp(baseSpacing * 0.45, baseSpacing * 1.2);

  /// Scale icon sizes.
  double iconSize(double baseSize) =>
      (baseSize * _scale).clamp(baseSize * 0.55, baseSize * 1.15);

  /// Outer page padding — used by base_level_page.
  double get contentPadding {
    if (screenWidth >= 1400) return 40.0;
    if (screenWidth >= 1100) return 28.0;
    if (screenWidth >= 800) return 18.0;
    return 12.0;
  }

  /// Legacy helpers kept for any existing call-sites.
  double get pagePadding => contentPadding;
  double containerWidth(double baseWidth) => baseWidth * _scale;
}

/// Extension for easy access via context.
extension ResponsiveExtension on BuildContext {
  ResponsiveUtils get responsive => ResponsiveUtils(this);
}