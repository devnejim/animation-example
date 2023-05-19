import 'dart:math' show min, max;

class Sizes {
  Sizes._();
  static const bottomBarButtonRadius = 24.0;
  static const menuItemHeight = 40.0;

  static const double fabBottomPadding = 8.0;
  static const double _fabRadius = 15.0;

  /// Calculates the effective radius for a floating action button based
  /// on the constant [_fabRadius], ensuring that it falls within the range
  /// of 24 to 40
  static double get fabRadius => (_fabRadius >= 40 && _fabRadius > 24)
      ? min(_fabRadius, 40)
      : max(24, _fabRadius);
}
