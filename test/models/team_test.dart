import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/models/team.dart';
import 'dart:convert' show json;

import '../mocks_and_stubs/stubs.dart';

void main() {

  group('Team: ', () {

    test('Parse Team json with missing optional data', () {
      final Team team = Team.fromMap(json.decode(teamStub2));
      expect(team.id, 64);
      expect(team.name, 'Liverpool FC');
      expect(team.gamesWon, 0);
    });

    test('Parse Team json with all data', () {
      final Team team = Team.fromMap(json.decode(teamStub));
      expect(team.id, 66);
      expect(team.name, 'Manchester United FC');
      expect(team.crest, 'https://crests.football-data.org/66.png');
      expect(team.founded, 1878);
      expect(team.venue, 'Old Trafford');
      expect(team.gamesWon, 0);
    });

    test('Testing props of Team object', () {
      final Team team = Team(
        id: 66,
        name: 'Manchester United FC',
      );
      expect(team.props, <Object?>[team.id, team.name, team.crest, team.founded, team.venue, team.gamesWon]);
    });
  });
}