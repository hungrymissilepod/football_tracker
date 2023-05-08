import 'package:flutter_test/flutter_test.dart';
import 'package:football_tracker/models/match.dart';
import 'package:football_tracker/misc/most_wins_calculator.dart';
import 'package:football_tracker/models/score.dart';
import 'package:football_tracker/models/team.dart';

void main() {

  group('MostWinsCalculator: ', () {

    test('calculateTeamWithMostWins correctly returns team id with most wins', () {
      final List<Match> matches = <Match>[
        Match(
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
        ),
        Match(
          id: 1,
          homeTeam: Team(
            id: 76,
            name: 'Wolverhampton Wanderers FC',
          ),
          awayTeam: Team(
            id: 61,
            name: 'Chelsea FC',
          ),
          score: const Score(
            winner: 'AWAY_TEAM',
          ),
        ),
        Match(
          id: 1,
          homeTeam: Team(
            id: 61,
            name: 'Chelsea FC',
          ),
          awayTeam: Team(
            id: 66,
            name: 'Manchester United FC',
          ),
          score: const Score(
            winner: 'AWAY_TEAM',
          ),
        ),
      ];
      final Team team = MostWinsCalculator().calculateTeamWithMostWins(matches);
      expect(team.id, 66);
    });

    test('When multiple teams have the highest number of wins, calculateTeamWithMostWins will return the team that is closest to the start of the list', () {
      final List<Match> matches = <Match>[
        Match(
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
        ),
        Match(
          id: 1,
          homeTeam: Team(
            id: 76,
            name: 'Wolverhampton Wanderers FC',
          ),
          awayTeam: Team(
            id: 61,
            name: 'Chelsea FC',
          ),
          score: const Score(
            winner: 'AWAY_TEAM',
          ),
        ),
        Match(
          id: 2,
          homeTeam: Team(
            id: 76,
            name: 'Wolverhampton Wanderers FC',
          ),
          awayTeam: Team(
            id: 61,
            name: 'Chelsea FC',
          ),
          score: const Score(
            winner: 'HOME_AWAY',
          ),
        ),
      ];
      final Team team = MostWinsCalculator().calculateTeamWithMostWins(matches);
      expect(team.id, 66);
    });
  });
}