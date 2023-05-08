// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'package:football_tracker/models/coach.dart';
import 'package:football_tracker/models/player.dart';

class Team extends Equatable {
  Team({
    required this.id,
    required this.name,
    this.crest,
    this.founded,
    this.venue,
    this.coach,
    this.players,
    this.gamesWon = 0,
  });

  final int id;
  final String name;
  final String? crest;
  final int? founded;
  final String? venue;
  final Coach? coach;
  final List<Player>? players;
  int gamesWon;

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'],
      name: map['name'],
      crest: map['crest'],
      founded: map['founded'],
      venue: map['venue'],
      coach: Coach.fromMap(map['coach']),
      players: map['squad'] is List<dynamic> ? (map['squad'] as List<dynamic>).map((e) => Player.fromMap(e)).toList() : null,

    );
  }
  
  @override
  List<Object?> get props => <Object?>[id, name, crest, founded, venue, coach, players];
}