extension DateTimeFormatter on DateTime {

  /// Converts a [DateTime] ISO-8601 string and returns only the year, month, and day.
  String toFormattedString() {
    return toIso8601String().split('T').first;
  }
}