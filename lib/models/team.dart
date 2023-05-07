// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class Team extends Equatable {
  Team({
    required this.id,
    required this.name,
    this.crest,
    this.founded,
    this.venue,
    this.gamesWon = 0,
  });

  final int id;
  final String name;
  final String? crest;
  final int? founded;
  final String? venue;
  int gamesWon;

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'],
      name: map['name'],
      crest: map['crest'],
      founded: map['founded'],
      venue: map['venue'],
    );
  }
  
  @override
  List<Object?> get props => <Object?>[id, name, crest, founded, venue, gamesWon];
}