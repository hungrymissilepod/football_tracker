import 'package:equatable/equatable.dart';

class Coach extends Equatable {
  const Coach({
    required this.name,
  });

  final String? name;

  factory Coach.fromMap(Map<String, dynamic>? map) {
    return Coach(
      name: map?['name'],
    );
  }

  @override
  List<Object?> get props => <Object?>[name];
}