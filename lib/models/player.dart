import 'package:equatable/equatable.dart';

class Player extends Equatable {

  const Player({
    required this.name,
    required this.position,
  });

  final String? name;
  final String? position;

  factory Player.fromMap(Map<String, dynamic>? map) {
    return Player(
      name: map?['name'],
      position: map?['position'],
    );
  }
  
  @override
  List<Object?> get props => <Object?>[name, position];
}