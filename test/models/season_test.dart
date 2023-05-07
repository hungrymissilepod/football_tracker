import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/models/season.dart';
import 'dart:convert' show json;

import '../mocks_and_stubs/stubs.dart';

void main() {

  group('Season: ', () {

    test('Parse correct Season json', () {
      final Season season = Season.fromMap(json.decode(seasonStub));
      expect(season.id, 1490);
      
      expect(season.startDate.year, 2022);
      expect(season.startDate.month, 08);
      expect(season.startDate.day, 05);

      expect(season.endDate.year, 2023);
      expect(season.endDate.month, 05);
      expect(season.endDate.day, 28);
    });

    test('Parsing Season json with incorect types throws a TypeError', () {
      expect(() => Season.fromMap(json.decode(seasonStubWithWrongTypes)), throwsA(isA<TypeError>()));
    });

    test('Testing props of Season object', () {
      final Season season = Season(
        id: 0,
        startDate: DateTime(2022, 04, 07),
        endDate: DateTime(2023, 05, 07),
      );
      expect(season.props, <Object?>[season.id, season.startDate, season.endDate]);
    });
  });
}