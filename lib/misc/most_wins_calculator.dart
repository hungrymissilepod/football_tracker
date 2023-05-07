import 'package:football_tracker/models/team.dart';
import 'package:football_tracker/models/match.dart';

class MostWinsCalculator {

  static const String homeTeam = 'HOME_TEAM';
  static const String awayTeam = 'AWAY_TEAM';

  int calculateTeamWithMostWins(List<Match> matches) {
    List<Team> teams = <Team>[];
    for (Match m in matches) {
      /// Add the home and away teams if they are not already in [_teams] list
      if (!teams.contains(m.homeTeam)) {
        teams.add(m.homeTeam);
      }
      if (!teams.contains(m.awayTeam)) {
        teams.add(m.awayTeam);
      }

      /// Increment [gamesWon] based on which team won the match
      if (m.score.winner == homeTeam) {
        int index = teams.indexOf(m.homeTeam);
        teams[index].gamesWon++;
      } else if (m.score.winner == awayTeam) {
        int index = teams.indexOf(m.awayTeam);
        teams[index].gamesWon++;
      }
    }
    
    /// Get the team with the most [gamesWon]
    final Team bestTeam = teams.reduce((value, element) => value.gamesWon > element.gamesWon ? value : element);
    return bestTeam.id;
  } 
}