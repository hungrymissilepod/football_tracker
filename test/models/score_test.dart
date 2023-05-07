import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/models/score.dart';
import 'dart:convert' show json;

import '../mocks_and_stubs/stubs.dart';

void main() {

  group('Score: ', () {

    test('Parse correct Score json', () {
      final Score score = Score.fromMap(json.decode(scoreStub));
      expect(score.winner, 'HOME_TEAM');
    });

    test('Parse incorrect Score json', () {
      final Score score = Score.fromMap(json.decode('{}'));
      expect(score.winner, isNull);
    });

    test('Testing props of Score object', () {
      const Score score = Score(
        winner: 'HOME_TEAM',
      );
      expect(score.props, <Object?>[score.winner]);
    });
  });
}