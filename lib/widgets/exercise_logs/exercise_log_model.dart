import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMMMd();

const uuid = Uuid();

class ExerciseData {
  ExerciseData({
    required this.hrsOfSleep,
    required this.caloriesBurned,
    required this.whatExercises,
    required this.date,
    required this.time,
    required this.sets,
    required this.reps,
    required this.notes
  }) : id = uuid.v4();

  final String id;
  final String hrsOfSleep;
  final String caloriesBurned;
  final String whatExercises;
  final String sets;
  final String reps;
  final String notes;
  final DateTime date;
  final String time;

  String get formattedDate {
    return dateFormatter.format(date);
  }

}
