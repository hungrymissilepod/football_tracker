import 'package:equatable/equatable.dart';

class Score extends Equatable {
  const Score({
    required this.winner,
  });

  final String? winner;

  factory Score.fromMap(Map<String, dynamic> map) {
    return Score(
      winner: map['winner'] as String?,
    );
  }
  
  @override
  List<Object?> get props => <Object?>[winner];
}