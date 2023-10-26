import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMMMd();

const uuid = Uuid();

class PainData {
  PainData({
    required this.scale,
    required this.painDesc,
    required this.cause,
    required this.date,
    required this.time,
    required this.symptom,
    required this.medication,
  }) : id = uuid.v4();

  final String id;
  final String scale;
  final String painDesc;
  final String cause;
  final String symptom;
  final String medication;
  final DateTime date;
  final String time;

  String get formattedDate {
    return dateFormatter.format(date);
  }

}
