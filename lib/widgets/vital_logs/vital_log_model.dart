import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMMMd();

const uuid = Uuid();

class VitalData {
  VitalData({
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.date,
    required this.time,
    required this.oxygen,
    required this.temprature,
  }) : id = uuid.v4();

  final String id;
  final String systolic;
  final String diastolic;
  final String pulse;
  final String oxygen;
  final String temprature;
  final DateTime date;
  final String time;

  String get formattedDate {
    return dateFormatter.format(date);
  }

}
