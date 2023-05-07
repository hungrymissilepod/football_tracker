
extension DateTimeFormatter on DateTime {
  String toFormattedString() {
    return toIso8601String().split('T').first;
  }
}