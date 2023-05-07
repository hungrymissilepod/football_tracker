import 'package:equatable/equatable.dart';
import 'package:football_tracker/models/score.dart';
import 'package:football_tracker/models/team.dart';

class Match extends Equatable {
  const Match({
    required this.id,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
  });

  final int id;
  final Team homeTeam;
  final Team awayTeam;
  final Score score;


  factory Match.fromMap(Map<String, dynamic> map) {
    return Match(
      id: map['id'] as int,
      homeTeam: Team.fromMap(map['homeTeam']),
      awayTeam: Team.fromMap(map['awayTeam']),
      score: Score.fromMap(map['score']),
    );
  }
  
  @override
  List<Object?> get props => <Object?>[id, homeTeam, awayTeam];
}