extension NormalizeExtension on num {
  double normalize(double max) {
    return (this / max).abs();
  }
}
