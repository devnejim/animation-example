extension StringExtension on String {
  String get capFirst => isEmpty ? this : this[0].toUpperCase() + substring(1);

  String get capFirstOfEach =>
      isEmpty ? this : split(' ').map((e) => e.capFirst).join(' ');
}
