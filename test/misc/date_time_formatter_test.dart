import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/misc/date_time_formatter.dart';

void main() {

  group('DateTimeFormatter: ', () {

    test('toFormattedString returns correctly', () {
      final DateTime dateTime = DateTime(1993, 1, 10);
      final String formattedStr = dateTime.toFormattedString();
      expect(formattedStr, '1993-01-10');
    });

    test('toFormattedString returns correctly when month and day are not specified', () {
      final DateTime dateTime = DateTime(2023);
      final String formattedStr = dateTime.toFormattedString();
      expect(formattedStr, '2023-01-01');
    });
  });
}