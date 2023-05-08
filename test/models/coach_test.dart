import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/models/coach.dart';
import 'dart:convert' show json;

import '../mocks_and_stubs/stubs.dart';

void main() {

  group('Coach: ', () {

    test('Parse correct Coach json', () {
      final Coach coach = Coach.fromMap(json.decode(coachStub));
      expect(coach.name, 'Jake');
    });

    test('Testing props of Coach object', () {
      const Coach coach = Coach(
        name: 'Jake',
      );
      expect(coach.props, <Object?>[coach.name]);
    });
  });
}