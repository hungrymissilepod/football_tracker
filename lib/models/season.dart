import 'package:equatable/equatable.dart';

class Season extends Equatable {
  const Season({
    required this.id,
    required this.startDate,
    required this.endDate,
  });

  final int id;
  final DateTime startDate;
  final DateTime endDate;

  factory Season.fromMap(Map<String, dynamic> map) {
    return Season(
      id: map['id'] as int,
      startDate: DateTime.parse(map['startDate']),
      endDate: DateTime.parse(map['endDate']),
    );
  }
  
  @override
  List<Object?> get props => <Object?>[id, startDate, endDate];
}