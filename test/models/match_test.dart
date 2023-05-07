import 'dart:convert' show json;
import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/models/match.dart';
import 'package:football_tracker/models/score.dart';
import 'package:football_tracker/models/team.dart';

import '../mocks_and_stubs/stubs.dart';

void main() {

  group('Match: ', () {

    test('Parse correct Match json', () {
      final Match match = Match.fromMap(json.decode(matchStub));
      expect(match.id, 0);

      expect(match.homeTeam.id, 66);
      expect(match.homeTeam.name, 'Manchester United FC');
      expect(match.homeTeam.crest, isNull);

      expect(match.awayTeam.id, 62);
      expect(match.awayTeam.name, 'Everton FC');
      expect(match.awayTeam.venue, isNull);

      expect(match.score.winner, 'HOME_TEAM');
    });

    test('Parsing Match json with incorect types throws a TypeError', () {
      expect(() => Match.fromMap(json.decode(matchStubWithWrongTypes)), throwsA(isA<TypeError>()));
    });

    test('Testing props of Match object', () {
      final Match match = Match(
        id: 0,
        homeTeam: Team(
          id: 66,
          name: 'Manchester United FC',
        ),
        awayTeam: Team(
          id: 62,
          name: 'Everton FC',
        ),
        score: const Score(
          winner: 'HOME_TEAM',
        ),
      );
      expect(match.props, <Object?>[match.id, match.homeTeam, match.awayTeam, match.score]);
    });
  });
}